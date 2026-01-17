import 'package:dio/dio.dart';
import '../../domain/entity/product_entity.dart';
import '../model/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductEntity>> getProducts();
}

class ProductRemoteDataSource implements ProductDataSource {
  final Dio dio;
  final String baseUrl;

  ProductRemoteDataSource({required this.dio, required this.baseUrl});

  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      final response = await dio.get('$baseUrl/products');

      if (response.statusCode == 200) {
        final List data = response.data["products"] as List;
        return data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
