import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vorratgo/core/cubits/cart_cubit/cart_cubit.dart';
import 'package:vorratgo/core/data/model/cart_item.dart';
import 'package:vorratgo/core/theming/constants.dart';
import 'package:vorratgo/features/cart/presentation/widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    _loadCartData();
  }

  void _loadCartData() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      context.read<CartCubit>().fetchCartFirebase(user.uid);
    }
  }

  String? get _userId => FirebaseAuth.instance.currentUser?.uid;

  void _handleQuantityIncrease(CartItem item) {
    final userId = _userId;
    if (userId != null) {
      final newQuantity = int.parse(item.quantity) + 1;
      context.read<CartCubit>().updateQuantityFirebase(
        userId,
        item.productId,
        newQuantity,
      );
    }
  }

  void _handleQuantityDecrease(CartItem item) {
    final userId = _userId;
    if (userId != null) {
      final newQuantity = int.parse(item.quantity) - 1;
      if (newQuantity > 0) {
        context.read<CartCubit>().updateQuantityFirebase(
          userId,
          item.productId,
          newQuantity,
        );
      } else {
        // If quantity becomes 0, remove the item
        context.read<CartCubit>().removeFromCartFirebase(
          userId,
          item.productId,
        );
      }
    }
  }

  void _handleRemove(CartItem item) {
    final userId = _userId;
    if (userId != null) {
      context.read<CartCubit>().removeFromCartFirebase(userId, item.productId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listenWhen: (previous, current) => current is CartUpdated,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
              state is CartLoading
                  ? const Center(child: CircularProgressIndicator())
                  : cubit.items.isEmpty
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
                        onQuantityIncrease: () => _handleQuantityIncrease(item),
                        onQuantityDecrease: () => _handleQuantityDecrease(item),
                        onRemove: () => _handleRemove(item),
                      );
                    },
                  ),
        );
      },
    );
  }
}
