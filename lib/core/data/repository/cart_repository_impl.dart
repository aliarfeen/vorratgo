import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vorratgo/core/data/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  CartRepositoryImpl(this._auth, this._firestore);

  @override
  Future<void> addToCart(String userId, String productId, int quantity) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<void> clearCart(String userId) {
    // TODO: implement clearCart
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> fetchCart(String userId) {
    // TODO: implement fetchCart
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromCart(String userId, String productId) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }

  @override
  Future<void> updateCartItemQuantity(
    String userId,
    String productId,
    int quantity,
  ) {
    // TODO: implement updateCartItemQuantity
    throw UnimplementedError();
  }
}
