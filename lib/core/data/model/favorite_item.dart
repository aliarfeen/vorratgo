class FavoriteItem {
  late String productId;
  late double price;
  late String imgUri;
  late String name;

  FavoriteItem({
    required this.productId,
    required this.price,
    required this.imgUri,
    required this.name,
  });

  factory FavoriteItem.fromMap(Map<String, dynamic> map) {
    return FavoriteItem(
      productId: map['productId'] ?? '',
      price: (map['price'] ?? 0.0).toDouble(),
      imgUri: map['imgUri'] ?? '',
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'price': price,
      'imgUri': imgUri,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'FavoriteItem(productId: $productId, name: $name, price: $price)';
  }
}
