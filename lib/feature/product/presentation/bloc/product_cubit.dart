import 'package:bloc/bloc.dart';
import '../../domain/entity/product_entity.dart';
import '../../domain/usecase/get_product_usecase.dart';
import '../bloc/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductCubit({required this.getProductsUseCase}) : super(ProductLoading());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    final result = await getProductsUseCase();
    result.fold(
      (error) => emit(ProductError(error)),
      (products) => emit(ProductLoaded(List<ProductEntity>.from(products))),
    );
  }

  void addProduct(ProductEntity product) {
    if (state is ProductLoaded) {
      final current = (state as ProductLoaded).products;
      emit(ProductLoaded([...current, product]));
    }
  }

  void updateProduct(ProductEntity product) {
    if (state is ProductLoaded) {
      final current = (state as ProductLoaded).products;
      final updated = current
          .map((p) => p.id == product.id ? product : p)
          .toList();
      emit(ProductLoaded(updated));
    }
  }

  void deleteProduct(int id) {
    if (state is ProductLoaded) {
      final current = (state as ProductLoaded).products;
      final updated = current.where((p) => p.id != id).toList();
      emit(ProductLoaded(updated));
    }
  }
}
