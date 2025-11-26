import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vorratgo/core/data/model/cart_item.dart';
import 'package:vorratgo/core/data/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  CartRepositoryImpl(this._auth, this._firestore);

  // Use a typed collection so snapshot.data() is Map<String, dynamic>?
  CollectionReference<Map<String, dynamic>> get _users =>
      _firestore.collection("users");

  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserDocSnapshot(
    String userId,
  ) {
    final docRef = _users.doc(userId);
    return docRef.get();
  }

  @override
  Future<void> addToCart(String userId, CartItem item) async {
    final userDocRef = _users.doc(userId);

    // Ensure doc exists (optional): create empty doc if not present
    final snapshot = await userDocRef.get();
    Map<String, dynamic> data = snapshot.data() ?? {};

    // Safely get cart as a List of Maps
    final rawCart = data['cart'];
    final List<Map<String, dynamic>> cart =
        (rawCart is List)
            ? rawCart.map((e) => Map<String, dynamic>.from(e as Map)).toList()
            : <Map<String, dynamic>>[];

    final index = cart.indexWhere((cartItem) => cartItem["productId"] == item.productId);

    if (index != -1) {
      // Update quantity of existing item
      final oldQty = int.tryParse(cart[index]["quantity"].toString()) ?? 0;
      final newQty = int.parse(item.quantity);
      cart[index]["quantity"] = (oldQty + newQty).toString();
      // Update other fields in case they changed
      cart[index]["price"] = item.price;
      cart[index]["imgUri"] = item.imgUri;
      cart[index]["name"] = item.name;
    } else {
      // Add new complete cart item
      cart.add(item.toMap());
    }

    data['cart'] = cart;
    // If doc didn't exist, set; otherwise update
    if (snapshot.exists) {
      await userDocRef.update({"cart": cart});
    } else {
      await userDocRef.set(data);
    }
  }

  @override
  Future<void> removeFromCart(String userId, String productId) async {
    final userDocRef = _users.doc(userId);
    final snapshot = await userDocRef.get();
    final data = snapshot.data() ?? {};

    final rawCart = data['cart'];
    final List<Map<String, dynamic>> cart =
        (rawCart is List)
            ? rawCart.map((e) => Map<String, dynamic>.from(e as Map)).toList()
            : <Map<String, dynamic>>[];

    cart.removeWhere((item) => item["productId"] == productId);

    if (snapshot.exists) {
      await userDocRef.update({"cart": cart});
    } else {
      await userDocRef.set({"cart": cart});
    }
  }

  @override
  Future<void> updateCartItemQuantity(
    String userId,
    String productId,
    int quantity,
  ) async {
    final userDocRef = _users.doc(userId);
    final snapshot = await userDocRef.get();
    final data = snapshot.data() ?? {};

    final rawCart = data['cart'];
    final List<Map<String, dynamic>> cart =
        (rawCart is List)
            ? rawCart.map((e) => Map<String, dynamic>.from(e as Map)).toList()
            : <Map<String, dynamic>>[];

    final index = cart.indexWhere((item) => item["productId"] == productId);

    if (index == -1) {
      // nothing to update
      return;
    }

    if (quantity <= 0) {
      cart.removeAt(index);
    } else {
      cart[index]["quantity"] = quantity.toString();
    }

    if (snapshot.exists) {
      await userDocRef.update({"cart": cart});
    } else {
      await userDocRef.set({"cart": cart});
    }
  }

  @override
  Future<void> clearCart(String userId) async {
    final userDocRef = _users.doc(userId);
    final snapshot = await userDocRef.get();

    if (snapshot.exists) {
      await userDocRef.update({"cart": []});
    } else {
      await userDocRef.set({"cart": []});
    }
  }

  @override
  Future<Map<String, dynamic>?> fetchCart(String userId) async {
    final snapshot = await _users.doc(userId).get();
    final data = snapshot.data() ?? {};
    // return the cart as a map wrapper or null if none
    return {"cart": data['cart'] ?? []};
  }
}
