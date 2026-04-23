import '../models/category_model.dart';
import '../services/firebase_service.dart';

class CategoryRepository {
  final db = FirebaseService.db;

  Future<void> create(Category category) async {
    await db.collection('categories').add(category.toMap());
  }

  Future<List<Category>> getAll() async {
    final snapshot = await db.collection('categories').get();

    return snapshot.docs
        .map((doc) => Category.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<void> update(Category category) async {
    await db.collection('categories').doc(category.id).update(category.toMap());
  }

  Future<void> delete(String id) async {
    await db.collection('categories').doc(id).delete();
  }
}
