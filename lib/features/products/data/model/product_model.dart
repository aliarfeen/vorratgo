import 'package:vorratgo/features/products/data/model/description_product_model.dart';
import 'package:vorratgo/features/products/data/model/name_product_model.dart';

class Product {
  final String id;
  final String catId;
  final Name name;
  final Description description;
  final String imgUri;
  final double price;
  final String unit;
  final int stockLevel;
  final int committedStock;

  Product({
    required this.id,
    required this.catId,
    required this.name,
    required this.description,
    required this.imgUri,
    required this.price,
    required this.unit,
    required this.stockLevel,
    required this.committedStock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      catId: json['cat_id'] as String,
      name: Name.fromJson(json['name']),
      description: Description.fromJson(json['description']),
      imgUri: json['img_uri'] as String,
      price: (json['price'] as num).toDouble(),
      unit: json['unit'] as String,
      stockLevel: json['stock_level'] as int,
      committedStock: json['committed_stock'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cat_id': catId,
      'name': name.toJson(),
      'description': description.toJson(),
      'img_uri': imgUri,
      'price': price,
      'unit': unit,
      'stock_level': stockLevel,
      'committed_stock': committedStock,
    };
  }
}
