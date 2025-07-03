import 'package:vorratgo/core/network/api_service.dart';
import 'package:vorratgo/features/products/data/model/product_model.dart';
import 'package:vorratgo/features/products/data/repository/products_repo.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ApiService remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> fetchProductList() async {
    final models = await remoteDataSource.getProducts();
    final data = models.data as List;
    return data.map((item) => Product.fromJson(item)).toList();
  }
}
