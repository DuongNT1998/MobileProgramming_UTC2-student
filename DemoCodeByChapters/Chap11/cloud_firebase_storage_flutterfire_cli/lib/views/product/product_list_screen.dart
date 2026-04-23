import 'package:flutter/material.dart';
import '../../controllers/product_controller.dart';
import '../../controllers/category_controller.dart';
import '../../data/models/product_model.dart';
import '../../data/models/category_model.dart';
import '../../utils/dialog_helper.dart';
import 'product_form_screen.dart';
import '../category/category_screen.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final controller = ProductController();
  final categoryController = CategoryController();

  List<Product> products = [];
  List<Category> categories = [];

  Map<String, String> categoryMap = {};

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    products = await controller.getProducts();
    categories = await categoryController.getCategories();

    // 👉 map categoryId -> name
    categoryMap = {for (var c in categories) c.id!: c.name};

    setState(() {});
  }

  void delete(String id) async {
    bool confirm = await DialogHelper.confirmDelete(context);

    if (confirm) {
      await controller.repo.delete(id);
      DialogHelper.showSuccess(context, "Deleted!");
      loadData();
    }
  }

  void goToForm({Product? product}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProductFormScreen(product: product)),
    );
    loadData();
  }

  String formatDate(DateTime dt) {
    return "${dt.year}-${dt.month}-${dt.day}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products Table"),
        actions: [
          IconButton(
            icon: Icon(Icons.category),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CategoryScreen()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => goToForm(),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // 👈 scroll ngang
        child: DataTable(
          columnSpacing: 20,
          columns: const [
            DataColumn(label: Text("ID")),
            DataColumn(label: Text("Image")),
            DataColumn(label: Text("Name")),
            DataColumn(label: Text("Description")),
            DataColumn(label: Text("Price")),
            DataColumn(label: Text("Category")),
            DataColumn(label: Text("Created")),
            DataColumn(label: Text("Updated")),
            DataColumn(label: Text("Actions")),
          ],
          rows: products.map((p) {
            return DataRow(
              cells: [
                DataCell(Text(p.id ?? "")),

                DataCell(
                  Image.network(
                    p.image,
                    width: 50,
                    errorBuilder: (_, __, ___) => Icon(Icons.image),
                  ),
                ),

                DataCell(Text(p.name)),
                DataCell(Text(p.description)),
                DataCell(Text(p.price.toString())),

                DataCell(Text(categoryMap[p.categoryId] ?? "N/A")),

                DataCell(Text(formatDate(p.createdAt))),
                DataCell(Text(formatDate(p.updatedAt))),

                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => goToForm(product: p),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => delete(p.id!),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
