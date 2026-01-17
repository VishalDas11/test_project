import 'package:fpdart/fpdart.dart';
import '../../domain/entity/product_entity.dart';
import '../../domain/reposetry/product_reposetry.dart';
import '../data_source/product_data_source.dart';
import '../model/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource remoteDataSource;

  // Local in-memory cache for add/update/delete
  final List<ProductEntity> _products = [];

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, List<ProductEntity>>> getProducts() async {
    try {
      // Fetch from API
      final remoteProducts = await remoteDataSource.getProducts();

      final allProducts = [...remoteProducts];

      for (final localProduct in _products) {
        final index = allProducts.indexWhere((p) => p.id == localProduct.id);
        if (index != -1) {
          allProducts[index] = localProduct; // Update existing
        } else {
          allProducts.add(localProduct); // Add new
        }
      }

      return right(allProducts);
    } catch (e) {
      return left("Failed to load products: $e");
    }
  }

}
