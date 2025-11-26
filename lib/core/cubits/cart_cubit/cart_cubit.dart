import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vorratgo/core/data/model/cart_item.dart';
import 'package:vorratgo/core/data/repository/cart_repository.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository repo;

  CartCubit(this.repo) : super(CartInitial());

  List<CartItem> items = [];
  double totalPrice = 0.0;

  // ---------------- FETCH FIREBASE ----------------
  Future<void> fetchCartFirebase(String userId) async {
    //emit(CartLoading());

    final cartData = await repo.fetchCart(userId);

    final raw = cartData?['cart'];
    if (raw is List) {
      items =
          raw
              .map((e) => CartItem.fromMap(Map<String, dynamic>.from(e)))
              .toList();
    } else {
      items = [];
    }

    totalPrice = _calculateTotal();
    emit(CartLoaded(items: List.from(items), totalPrice: totalPrice));
  }

  // ---------------- ADD FIREBASE ----------------
  Future<void> addToCartFirebase(String userId, CartItem item) async {
    //emit(CartLoading());

    await repo.addToCart(userId, item);

    await fetchCartFirebase(userId);
  }

  // ---------------- REMOVE FIREBASE ----------------
  Future<void> removeFromCartFirebase(String userId, String productId) async {
    //emit(CartLoading());

    await repo.removeFromCart(userId, productId);

    await fetchCartFirebase(userId);
  }

  // ---------------- UPDATE FIREBASE ----------------
  Future<void> updateQuantityFirebase(
    String userId,
    String productId,
    int quantity,
  ) async {
    //emit(CartLoading());

    await repo.updateCartItemQuantity(userId, productId, quantity);

    await fetchCartFirebase(userId);
  }

  // ------------------------------------------------
  // ---------- YOUR ORIGINAL LOCAL FUNCTIONS -------
  // ------------------------------------------------

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

  void updateCartItemQuantity(CartItem item, int change) {
    final index = items.indexWhere((i) => i.productId == item.productId);

    if (index != -1) {
      final currentQty = int.parse(items[index].quantity);
      final newQty = currentQty + change;

      if (newQty <= 0) {
        removeFromCart(item);
        return;
      }

      items[index].quantity = newQty.toString();
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
