import 'package:vorratgo/core/data/model/cart_item.dart';

abstract class CartRepository {
  Future<void> addToCart(String userId, CartItem item);
  Future<void> removeFromCart(String userId, String productId);
  Future<void> updateCartItemQuantity(
    String userId,
    String productId,
    int quantity,
  );
  Future<Map<String, dynamic>?> fetchCart(String userId);
  Future<void> clearCart(String userId);
}
