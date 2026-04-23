import 'package:flutter/material.dart';
import '../../controllers/product_controller.dart';
import '../../controllers/category_controller.dart';
import '../../data/models/product_model.dart';
import '../../data/models/category_model.dart';
import '../../utils/dialog_helper.dart';

class ProductFormScreen extends StatefulWidget {
  final Product? product;

  ProductFormScreen({this.product});

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final controller = ProductController();
  final categoryController = CategoryController();

  final nameCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final imageCtrl = TextEditingController();

  List<Category> categories = [];
  String? selectedCategory;

  bool get isEdit => widget.product != null;

  @override
  void initState() {
    super.initState();
    loadCategories();

    if (isEdit) {
      final p = widget.product!;
      nameCtrl.text = p.name;
      descCtrl.text = p.description;
      priceCtrl.text = p.price.toString();
      imageCtrl.text = p.image;
      selectedCategory = p.categoryId;
    }
  }

  Future<void> loadCategories() async {
    categories = await categoryController.getCategories();
    setState(() {});
  }

  void save() async {
    final now = DateTime.now();

    if (selectedCategory == null) {
      DialogHelper.showSuccess(context, "Please select category");
      return;
    }

    if (isEdit) {
      await controller.repo.update(
        Product(
          id: widget.product!.id,
          name: nameCtrl.text,
          description: descCtrl.text,
          price: double.parse(priceCtrl.text),
          image: imageCtrl.text,
          categoryId: selectedCategory!,
          createdAt: widget.product!.createdAt,
          updatedAt: now,
        ),
      );

      // 👉 cách chuẩn: show dialog rồi pop 2 lần
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Success"),
          content: Text("Updated successfully"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // đóng dialog
                Navigator.pop(context); // quay về list
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      await controller.addProduct(
        name: nameCtrl.text,
        description: descCtrl.text,
        price: double.parse(priceCtrl.text),
        image: imageCtrl.text,
        categoryId: selectedCategory!,
      );

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Success"),
          content: Text("Created successfully"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Edit Product" : "Add Product")),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: descCtrl,
              decoration: InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: priceCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Price"),
            ),
            TextField(
              controller: imageCtrl,
              decoration: InputDecoration(labelText: "Image URL"),
            ),

            SizedBox(height: 10),

            DropdownButtonFormField<String>(
              value: selectedCategory,
              hint: Text("Select Category"),
              items: categories.map((c) {
                return DropdownMenuItem(value: c.id, child: Text(c.name));
              }).toList(),
              onChanged: (val) {
                setState(() => selectedCategory = val);
              },
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: save,
              child: Text(isEdit ? "Update" : "Create"),
            ),
          ],
        ),
      ),
    );
  }
}
