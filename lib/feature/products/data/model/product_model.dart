// class ProductModel {
//   final List<Product>? products;
//   final int? total;
//   final int? skip;
//   final int? limit;
//
//   ProductModel({
//     this.products,
//     this.total,
//     this.skip,
//     this.limit,
//   });
//
//   ProductModel copyWith({
//     List<Product>? products,
//     int? total,
//     int? skip,
//     int? limit,
//   }) =>
//       ProductModel(
//         products: products ?? this.products,
//         total: total ?? this.total,
//         skip: skip ?? this.skip,
//         limit: limit ?? this.limit,
//       );
// }
//
// class Product {
//   final int? id;
//   final String? title;
//   final String? description;
//   final Category? category;
//   final double? price;
//   final double? discountPercentage;
//   final double? rating;
//   final int? stock;
//   final List<String>? tags;
//   final String? brand;
//   final String? sku;
//   final int? weight;
//   final Dimensions? dimensions;
//   final String? warrantyInformation;
//   final String? shippingInformation;
//   final AvailabilityStatus? availabilityStatus;
//   final List<Review>? reviews;
//   final ReturnPolicy? returnPolicy;
//   final int? minimumOrderQuantity;
//   final Meta? meta;
//   final List<String>? images;
//   final String? thumbnail;
//
//   Product({
//     this.id,
//     this.title,
//     this.description,
//     this.category,
//     this.price,
//     this.discountPercentage,
//     this.rating,
//     this.stock,
//     this.tags,
//     this.brand,
//     this.sku,
//     this.weight,
//     this.dimensions,
//     this.warrantyInformation,
//     this.shippingInformation,
//     this.availabilityStatus,
//     this.reviews,
//     this.returnPolicy,
//     this.minimumOrderQuantity,
//     this.meta,
//     this.images,
//     this.thumbnail,
//   });
//
//   Product copyWith({
//     int? id,
//     String? title,
//     String? description,
//     Category? category,
//     double? price,
//     double? discountPercentage,
//     double? rating,
//     int? stock,
//     List<String>? tags,
//     String? brand,
//     String? sku,
//     int? weight,
//     Dimensions? dimensions,
//     String? warrantyInformation,
//     String? shippingInformation,
//     AvailabilityStatus? availabilityStatus,
//     List<Review>? reviews,
//     ReturnPolicy? returnPolicy,
//     int? minimumOrderQuantity,
//     Meta? meta,
//     List<String>? images,
//     String? thumbnail,
//   }) =>
//       Product(
//         id: id ?? this.id,
//         title: title ?? this.title,
//         description: description ?? this.description,
//         category: category ?? this.category,
//         price: price ?? this.price,
//         discountPercentage: discountPercentage ?? this.discountPercentage,
//         rating: rating ?? this.rating,
//         stock: stock ?? this.stock,
//         tags: tags ?? this.tags,
//         brand: brand ?? this.brand,
//         sku: sku ?? this.sku,
//         weight: weight ?? this.weight,
//         dimensions: dimensions ?? this.dimensions,
//         warrantyInformation: warrantyInformation ?? this.warrantyInformation,
//         shippingInformation: shippingInformation ?? this.shippingInformation,
//         availabilityStatus: availabilityStatus ?? this.availabilityStatus,
//         reviews: reviews ?? this.reviews,
//         returnPolicy: returnPolicy ?? this.returnPolicy,
//         minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
//         meta: meta ?? this.meta,
//         images: images ?? this.images,
//         thumbnail: thumbnail ?? this.thumbnail,
//       );
// }
//
// enum AvailabilityStatus {
//   IN_STOCK,
//   LOW_STOCK
// }
//
// enum Category {
//   BEAUTY,
//   FRAGRANCES,
//   FURNITURE,
//   GROCERIES
// }
//
// class Dimensions {
//   final double? width;
//   final double? height;
//   final double? depth;
//
//   Dimensions({
//     this.width,
//     this.height,
//     this.depth,
//   });
//
//   Dimensions copyWith({
//     double? width,
//     double? height,
//     double? depth,
//   }) =>
//       Dimensions(
//         width: width ?? this.width,
//         height: height ?? this.height,
//         depth: depth ?? this.depth,
//       );
// }
//
// class Meta {
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String? barcode;
//   final String? qrCode;
//
//   Meta({
//     this.createdAt,
//     this.updatedAt,
//     this.barcode,
//     this.qrCode,
//   });
//
//   Meta copyWith({
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     String? barcode,
//     String? qrCode,
//   }) =>
//       Meta(
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         barcode: barcode ?? this.barcode,
//         qrCode: qrCode ?? this.qrCode,
//       );
// }
//
// enum ReturnPolicy {
//   NO_RETURN_POLICY,
//   THE_30_DAYS_RETURN_POLICY,
//   THE_60_DAYS_RETURN_POLICY,
//   THE_7_DAYS_RETURN_POLICY,
//   THE_90_DAYS_RETURN_POLICY
// }
//
// class Review {
//   final int? rating;
//   final String? comment;
//   final DateTime? date;
//   final String? reviewerName;
//   final String? reviewerEmail;
//
//   Review({
//     this.rating,
//     this.comment,
//     this.date,
//     this.reviewerName,
//     this.reviewerEmail,
//   });
//
//   Review copyWith({
//     int? rating,
//     String? comment,
//     DateTime? date,
//     String? reviewerName,
//     String? reviewerEmail,
//   }) =>
//       Review(
//         rating: rating ?? this.rating,
//         comment: comment ?? this.comment,
//         date: date ?? this.date,
//         reviewerName: reviewerName ?? this.reviewerName,
//         reviewerEmail: reviewerEmail ?? this.reviewerEmail,
//       );
// }

class ProductModel {
  final int id;
  final String name;
  final String category;
  final double price;
  final bool inStock;

  ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.inStock,
  });
}

final List<ProductModel> staticProducts = [
  ProductModel(
    id: 1,
    name: "MacBook Pro",
    category: "Laptop",
    price: 2500,
    inStock: true,
  ),
  ProductModel(
    id: 2,
    name: "iPhone 15",
    category: "Mobile",
    price: 1200,
    inStock: false,
  ),
  ProductModel(
    id: 3,
    name: "AirPods Pro",
    category: "Accessories",
    price: 250,
    inStock: true,
  ),
];
