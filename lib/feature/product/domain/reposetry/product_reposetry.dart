import 'package:fpdart/fpdart.dart';

import '../entity/product_entity.dart';

abstract class ProductRepository {
  Future<Either<String, List<ProductEntity>>> getProducts();
}
