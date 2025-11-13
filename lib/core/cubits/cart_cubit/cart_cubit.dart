import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vorratgo/core/data/model/cart_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartItem> items = [];
  double totalPrice = 0.0;

  void addToCart(CartItem item) {
    emit(CartLoading());
    final index = items.indexWhere((i) => i.productId == item.productId);
    if (index != -1) {
      items[index].quantity =
          (int.parse(items[index].quantity) + int.parse(item.quantity))
              .toString();
    } else {
      items.add(item);
    }

    totalPrice = _calculateTotal();
    emit(CartUpdated(items: List.from(items), totalPrice: totalPrice));
  }

  void removeFromCart(CartItem item) {
    items.removeWhere((i) => i.productId == item.productId);
    totalPrice = _calculateTotal();
    emit(CartUpdated(items: List.from(items), totalPrice: totalPrice));
  }

  void updateCartItemQuantity(CartItem item, int newQuantity) {
    final index = items.indexWhere((i) => i.productId == item.productId);
    if (index != -1) {
      items[index].quantity = newQuantity.toString();
      totalPrice = _calculateTotal();
      emit(CartUpdated(items: List.from(items), totalPrice: totalPrice));
    }
  }

  void clearCart() {
    items.clear();
    totalPrice = 0.0;
    emit(CartUpdated(items: [], totalPrice: totalPrice));
  }

  double _calculateTotal() =>
      items.fold(0, (sum, item) => sum + item.price * int.parse(item.quantity));
}
