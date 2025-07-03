import 'package:vorratgo/features/products/data/model/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProductList();
}
