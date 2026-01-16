import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app_router/router_names.dart';
import '../../../../core/utils/dailog.dart';
import '../../../../core/utils/reponsive.dart';
import '../../data/model/product_model.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_state.dart';
import '../widgets/build_form.dart';
import '../widgets/product_card.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Dashboard"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open Add Product Modal
          showResponsiveDialog(
            context: context,
            title: "Add Product",
            child: ProductForm(
              isUpdate: false,

              // onSubmit: (product) {
              //   context.read<ProductCubit>().addProduct(product);
              // },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          if (Responsive.isDesktop(constraints.maxWidth)) {
            return _ProductTable();
          } else {
            return _ProductGrid();
          }
        },
      ),
    );
  }
}

/// Desktop / Web Table
class _ProductTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final products = state.products;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text("ID")),
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Category")),
              DataColumn(label: Text("Price")),
              DataColumn(label: Text("Stock")),
            ],
            rows: products.map((p) {
              return DataRow(
                onSelectChanged: (_) {
                  showResponsiveDialog(
                    context: context,
                    title: "Edit Product",
                    child: ProductForm(
                      product: p, // product to edit
                      isUpdate: true,
                      // onSubmit: (updated) {
                      //   print("Updated: ${updated.id}, ${updated.name}");
                      //   context.read<ProductCubit>().updateProduct(updated);
                      // },
                    ),
                  );
                },
                cells: [
                  DataCell(Text(p.id.toString())),
                  DataCell(Text(p.name)),
                  DataCell(Text(p.category)),
                  DataCell(Text("\$${p.price}")),
                  DataCell(
                    Chip(
                      label: Text(p.inStock ? "In Stock" : "Out"),
                      backgroundColor: p.inStock ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              );

            }).toList(),
          ),
        );
      },
    );
  }
}

/// Mobile / Tablet Grid
class _ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final products = state.products;

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: products.length,
          itemBuilder: (_, i) {
            final product = products[i];

            return GestureDetector(
              onTap: () {
                // Open Edit modal
                showResponsiveDialog(
                  context: context,
                  title: "Edit Product",
                  child: ProductForm(
                    product: product,
                    isUpdate: true,
                    // onSubmit: (updated) {
                    //   context.read<ProductCubit>().updateProduct(updated);
                    // },
                  ),
                );
              },
              child: ProductCard(product: product),
            );
          },
        );
      },
    );
  }
}
