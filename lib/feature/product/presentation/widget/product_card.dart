
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/theme/theme_extension.dart';
import 'package:test_project/feature/product/domain/entity/product_entity.dart';
import 'package:test_project/feature/product/presentation/bloc/product_cubit.dart';
import 'package:test_project/feature/product/presentation/screens/product_detail_screen.dart';
import 'package:test_project/feature/product/presentation/widget/add_product_form.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductEntity product;

  void _showProductForm(BuildContext context, {ProductEntity? product}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => ProductFormDialog(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppThemeColors>()!;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(productId: product.id),
          ),
        );
      },
      child: Card(
        elevation: 4,
        color: theme.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: product.inStock
                ? Colors.green.withOpacity(0.4)
                : Colors.red.withOpacity(0.4),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                "Category: ${product.category}",
                style: theme.textTheme.bodyMedium,
              ),

              const SizedBox(height: 4),

              Text(
                "Price: \$${product.price}",
                style: theme.textTheme.bodyMedium,
              ),

              const SizedBox(height: 4),

              /// Stock
              Text(
                product.inStock ? "In Stock" : "Out of Stock",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: product.inStock ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),


              /// Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  GestureDetector(
                      onTap: ()=>  _showProductForm(context, product: product),
                      child: Icon(Icons.edit, color: colors.primary)),
                  SizedBox(width: 12),
                  GestureDetector(
                      onTap: ()=>  context
                          .read<ProductCubit>()
                          .deleteProduct(product.id),
                      child: Icon(Icons.delete, color: Colors.red),

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
