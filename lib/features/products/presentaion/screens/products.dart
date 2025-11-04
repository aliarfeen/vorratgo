import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/helpers/extensions.dart';
import 'package:vorratgo/features/products/cubit/product_cubit.dart';
import 'package:vorratgo/features/products/cubit/product_state.dart';
import 'package:vorratgo/features/products/data/model/product_model.dart';
import 'package:vorratgo/features/products/presentaion/widgets/products_grid.dart';

class ProductsScreen extends StatelessWidget {
  final String category;
  ProductsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(category),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.tune))],
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
        body: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductLoaded) {
              return ProductsGrid(
                itemCount: state.products.length,
                products: state.products,
              );
            } else if (state is ProductFiltered) {
              return ProductsGrid(
                itemCount: state.filteredProducts.length,
                products: state.filteredProducts,
              );
            } else if (state is ProductError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No products loaded yet.'));
            }
          },
        ),
      ),
    );
  }
}
