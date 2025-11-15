class CartItem {
  late String productId;
  late String quantity;
  late double price = 0.0;
  late String imgUri = '';
  late String name;

  CartItem({
    required this.productId,
    required this.quantity,
    required this.price,
    required this.imgUri,
    required this.name,
  });

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      productId: map['productId'] ?? '',
      quantity: map['quantity'] ?? '',
      price: map['price'] ?? 0.0,
      imgUri: map['imgUri'] ?? '',
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'quantity': quantity,
      'price': price,
      'imgUri': imgUri,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'CartItem(name: $name, quantity: $quantity, price: $price) \n';
  }
}
