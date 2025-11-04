import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/features/products/data/repository/products_repo.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(ProductInitial());

  Future<void> fetchProducts() async {
    try {
      emit(ProductLoading());
      final products = await repository.fetchProductList();

      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  Future<void> filterProducts(String category) async {
    await fetchProducts();
    if (state is ProductLoaded) {
      final products = (state as ProductLoaded).products;
      final filteredProducts =
          products.where((product) => product.catId == category).toList();

      emit(ProductFiltered(filteredProducts));
    }
  }
}
