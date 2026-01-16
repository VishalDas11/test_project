import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/feature/products/presentation/bloc/product_state.dart';
import '../../data/model/product_model.dart';

// --- State classes ---


// --- Cubit class ---
class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoaded(products: staticProducts));

  void addProduct(ProductModel product) {
    final updatedList = List<ProductModel>.from(state.products)..add(product);
    emit(ProductLoaded(products: updatedList));
  }

  void updateProduct(ProductModel updated) {
    final updatedList = state.products.map((p) {
      return p.id == updated.id ? updated : p;
    }).toList();

    emit(ProductLoaded(products: updatedList));
  }
}