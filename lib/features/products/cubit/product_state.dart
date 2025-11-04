import 'package:vorratgo/features/products/data/model/product_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
}

class ProductFiltered extends ProductState {
  final List<Product> filteredProducts;
  ProductFiltered(this.filteredProducts);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
