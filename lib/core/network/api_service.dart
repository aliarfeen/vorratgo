import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Response> getProducts() async {
    try {
      final response = await _dio.get('/products');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getProductById(String id) async {
    try {
      final response = await _dio.get('/products/$id');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
