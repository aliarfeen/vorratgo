import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/cart/presentation/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartCubit cubit = context.read<CartCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SizedBox(),
        title: Text(
          'Cart',
          style: TextStyles.black20Bold.copyWith(fontSize: 24),
        ),
      ),
      body:
          cubit.items.isEmpty
              ? const Center(child: Text('Cart is empty'))
              : ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: cubit.items.length,
                itemBuilder: (context, index) {
                  final item = cubit.items[index];
                  return CartItemWidget(
                    productId: item.productId,
                    quantity: item.quantity,
                    price: item.price,
                    imgUri: item.imgUri,
                    name: item.name,
                    onQuantityIncrease: () {},
                    onQuantityDecrease: () {},
                    onRemove: () {},
                  );
                },
              ),
    );
  }
}
