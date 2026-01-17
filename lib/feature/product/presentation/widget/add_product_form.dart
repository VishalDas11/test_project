

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/theme_extension.dart';
import '../../../../core/widgets/custom_textfield.dart';
import '../../domain/entity/product_entity.dart';
import '../bloc/product_cubit.dart';

class ProductFormDialog extends StatefulWidget {
  final ProductEntity? product;

  const ProductFormDialog({super.key, this.product});

  @override
  State<ProductFormDialog> createState() => _ProductFormDialogState();
}

class _ProductFormDialogState extends State<ProductFormDialog> {
  final _formKey = GlobalKey<FormState>();

  late String name;
  late String category;
  late double price;
  late bool inStock;

  @override
  void initState() {
    super.initState();
    name = widget.product?.name ?? '';
    category = widget.product?.category ?? '';
    price = widget.product?.price ?? 0;
    inStock = widget.product?.inStock ?? true;
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.product != null;
    final theme = Theme.of(context);
    final colors = theme.extension<AppThemeColors>()!;

    return Dialog(
      backgroundColor: theme.dialogBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isEdit ? "Edit Product" : "Add Product",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                CustomTextField(
                  label: "Name",
                  initialValue: name,
                  onChanged: (v) => name = v,
                ),

                const SizedBox(height: 12),

                CustomTextField(
                  label: "Category",
                  initialValue: category,
                  onChanged: (v) => category = v,
                ),

                const SizedBox(height: 12),

                CustomTextField(
                  label: "Price",
                  initialValue: price.toString(),
                  keyboardType: TextInputType.number,
                  onChanged: (v) => price = double.tryParse(v) ?? price,
                ),

                const SizedBox(height: 8),

                /// Stock
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: inStock,
                  activeColor: colors.primary,
                  title: Text(
                    "In Stock",
                    style: theme.textTheme.bodyMedium,
                  ),
                  onChanged: (v) => setState(() => inStock = v ?? inStock),
                ),

                const SizedBox(height: 20),

                /// Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary,
                        foregroundColor: colors.buttonText,
                      ),
                      onPressed: ()=> context.pop(),
                      child: Text("Cancel"),
                    ),
                    SizedBox(width: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary,
                        foregroundColor: colors.buttonText,
                      ),
                      onPressed: _submit,
                      child: Text(isEdit ? "Update" : "Add"),
                    ),


                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final cubit = context.read<ProductCubit>();

    final product =
        widget.product?.copyWith(
          name: name,
          category: category,
          price: price,
          inStock: inStock,
        ) ??
            ProductEntity(
              id: DateTime.now().millisecondsSinceEpoch,
              name: name,
              category: category,
              price: price,
              inStock: inStock,
            );

    widget.product == null
        ? cubit.addProduct(product)
        : cubit.updateProduct(product);

    Navigator.pop(context);
  }
}
