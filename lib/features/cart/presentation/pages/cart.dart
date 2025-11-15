import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/cart/presentation/widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listenWhen: (previous, current) => current is CartUpdated,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        print(state);
        print(context.read<CartCubit>().items.length);
        print(context.watch<CartCubit>().items.length);
        print("UI CUBIT HASH: ${context.read<CartCubit>().hashCode}");

        final cubit = context.watch<CartCubit>();
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
                        onQuantityIncrease:
                            () => cubit.updateCartItemQuantity(item, 1),
                        onQuantityDecrease:
                            () => cubit.updateCartItemQuantity(item, -1),
                        onRemove: () => cubit.removeFromCart(item),
                      );
                    },
                  ),
        );
      },
    );
  }
}
