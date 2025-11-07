import 'package:vorratgo/features/products/data/model/product_model.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final List<Product> favorites;
  final List<Product> cart;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.favorites,
    required this.cart,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    uid: map['uid'] ?? '',
    name: map['name'] ?? '',
    email: map['email'] ?? '',
    favorites:
        (map['favorites'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(Map<String, dynamic>.from(e)))
            .toList() ??
        [],
    cart:
        (map['cart'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(Map<String, dynamic>.from(e)))
            .toList() ??
        [],
  );

  Map<String, dynamic> toMap() => {
    'uid': uid,
    'name': name,
    'email': email,
    'favorites': favorites.map((p) => p.toJson()).toList(),
    'cart': cart.map((p) => p.toJson()).toList(),
  };

  UserModel copyWith({
    String? name,
    List<Product>? favorites,
    List<Product>? cart,
  }) {
    return UserModel(
      uid: uid,
      name: name ?? this.name,
      email: email,
      favorites: favorites ?? this.favorites,
      cart: cart ?? this.cart,
    );
  }
}
