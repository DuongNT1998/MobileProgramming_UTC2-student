import 'package:flutter/material.dart';
import '../../controllers/category_controller.dart';
import '../../data/models/category_model.dart';
import '../../utils/dialog_helper.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final controller = CategoryController();
  List<Category> categories = [];

  final nameController = TextEditingController();
  String? editingId;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    categories = await controller.getCategories();
    setState(() {});
  }

  void save() async {
    if (editingId == null) {
      await controller.addCategory(nameController.text);
      DialogHelper.showSuccess(context, "Category created!");
    } else {
      final now = DateTime.now();
      await controller.repo.update(
        Category(
          id: editingId,
          name: nameController.text,
          createdAt: now,
          updatedAt: now,
        ),
      );
      DialogHelper.showSuccess(context, "Category updated!");
    }

    nameController.clear();
    editingId = null;
    loadData();
  }

  void edit(Category c) {
    nameController.text = c.name;
    editingId = c.id;
  }

  void delete(String id) async {
    bool confirm = await DialogHelper.confirmDelete(context);

    if (confirm) {
      await controller.repo.delete(id);
      DialogHelper.showSuccess(context, "Category deleted!");
      loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: Column(
        children: [
          // FORM
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: "Category Name"),
                  ),
                ),
                ElevatedButton(
                  onPressed: save,
                  child: Text(editingId == null ? "Add" : "Update"),
                ),
              ],
            ),
          ),

          // LIST
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (_, i) {
                final c = categories[i];
                return ListTile(
                  title: Text(c.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => edit(c),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => delete(c.id!),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
