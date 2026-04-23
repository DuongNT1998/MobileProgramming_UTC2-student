import '../models/product_model.dart';
import '../services/firebase_service.dart';

class ProductRepository {
  final db = FirebaseService.db;

  Future<void> create(Product product) async {
    await db.collection('products').add(product.toMap());
  }

  Future<List<Product>> getAll() async {
    final snapshot = await db.collection('products').get();

    return snapshot.docs
        .map((doc) => Product.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<void> update(Product product) async {
    await db.collection('products').doc(product.id).update(product.toMap());
  }

  Future<void> delete(String id) async {
    await db.collection('products').doc(id).delete();
  }
}
