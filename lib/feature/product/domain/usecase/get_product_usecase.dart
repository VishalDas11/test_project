import 'package:fpdart/fpdart.dart';
import '../entity/product_entity.dart';
import '../reposetry/product_reposetry.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<Either<String, List<ProductEntity>>> call() async {
    return repository.getProducts();
  }
}
