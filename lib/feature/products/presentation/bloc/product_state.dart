import '../../data/model/product_model.dart';

abstract class ProductState {
  final List<ProductModel> products;
  const ProductState({required this.products});
}

class ProductInitial extends ProductState {
  ProductInitial() : super(products: staticProducts);
}

class ProductLoaded extends ProductState {
  const ProductLoaded({required super.products});
}