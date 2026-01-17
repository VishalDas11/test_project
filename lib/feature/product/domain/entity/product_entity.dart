class ProductEntity {
  final int id;
  final String name;
  final String category;
  final double price;
  final bool inStock;

  ProductEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.inStock,
  });

  // copyWith to update locally
  ProductEntity copyWith({
    int? id,
    String? name,
    String? category,
    double? price,
    bool? inStock,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      inStock: inStock ?? this.inStock,
    );
  }
}
