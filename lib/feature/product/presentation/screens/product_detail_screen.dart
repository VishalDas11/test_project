import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/theme_extension.dart';
import '../../domain/entity/product_entity.dart';
import '../bloc/product_cubit.dart';
import '../bloc/product_state.dart';
import '../widget/add_product_form.dart';

class ProductDetailsPage extends StatelessWidget {
  final int productId;

  const ProductDetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    //theme extension
    final colors = Theme.of(context).extension<AppThemeColors>()!;

    return Scaffold(
      backgroundColor: colors.scaffoldBg,
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: colors.appBarBg,
        foregroundColor: colors.appBarText,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors.primary,
        foregroundColor: colors.buttonText,
        onPressed: () => _showProductForm(context),
        child: const Icon(Icons.edit),
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is! ProductLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          final product = state.products.firstWhere(
                (p) => p.id == productId,
            orElse: () => ProductEntity(
              id: -1,
              name: '',
              category: '',
              price: 0,
              inStock: false,
            ),
          );

          if (product.id == -1) {
            return const Center(child: Text("Product not found"));
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              color: colors.inputBg, // card background from theme
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: colors.textPrimary, // use theme color
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Category: ${product.category}",
                      style: TextStyle(fontSize: 18, color: colors.textPrimary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Price: \$${product.price}",
                      style: TextStyle(fontSize: 18, color: colors.textPrimary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.inStock ? "In Stock" : "Out of Stock",
                      style: TextStyle(
                        fontSize: 18,
                        color: product.inStock
                            ? Colors.green
                            : Colors.red, // optional: you can make stock color dynamic too
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showProductForm(BuildContext context) {
    final cubit = context.read<ProductCubit>();

    if (cubit.state is! ProductLoaded) return;

    final product = (cubit.state as ProductLoaded).products.firstWhere(
          (p) => p.id == productId,
      orElse: () => ProductEntity(
        id: -1,
        name: '',
        category: '',
        price: 0,
        inStock: false,
      ),
    );

    if (product.id == -1) return;

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => ProductFormDialog(product: product,),
    );
  }
}
