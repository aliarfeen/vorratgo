import 'package:vorratgo/core/network/api_service.dart';
import 'package:vorratgo/features/products/data/model/product_model.dart';
import 'product_remote_data_source.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiService apiService;

  ProductRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Product>> getAllProducts() async {
    final response = await apiService.getProducts();
    return (response.data as List)
        .map((json) => Product.fromJson(json))
        .toList();
  }

  @override
  Future<Product> getProductById(String id) async {
    final response = await apiService.getProductById(id);
    return Product.fromJson(response.data);
  }
}
