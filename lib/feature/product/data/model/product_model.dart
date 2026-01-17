
import '../../domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.category,
    required super.price,
    required super.inStock,
  });

  // Convert JSON from API to ProductModel
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      name: json['title'] ?? 'No Name',
      category: json['category'] ?? 'General',
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : (json['price'] is double
                ? json['price']
                : double.parse(json['price'].toString())),
      inStock: json['stock'] != null ? (json['stock'] as int) > 0 : true,
    );
  }

  // Convert ProductModel to JSON for API calls (POST/PUT)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': name,
      'category': category,
      'price': price,
      'stock': inStock ? 1 : 0,
    };
  }
}
