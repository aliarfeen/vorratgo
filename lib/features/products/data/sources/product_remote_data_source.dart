import 'package:vorratgo/features/products/data/model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<Product>> getAllProducts();
  Future<Product> getProductById(String id);
}
