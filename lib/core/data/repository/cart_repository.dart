abstract class CartRepository {
  Future<void> addToCart(String userId, String productId, int quantity);
  Future<void> removeFromCart(String userId, String productId);
  Future<void> updateCartItemQuantity(
    String userId,
    String productId,
    int quantity,
  );
  Future<Map<String, dynamic>?> fetchCart(String userId);
  Future<void> clearCart(String userId);
}
