
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/feature/product/presentation/screens/product_detail_screen.dart';
import 'package:test_project/feature/product/presentation/widget/product_card.dart';
import '../../../../core/theme/theme_extension.dart';
import '../../../../core/widgets/top_appbar.dart';
import '../../domain/entity/product_entity.dart';
import '../bloc/product_cubit.dart';
import '../bloc/product_state.dart';
import '../widget/add_product_form.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});
  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final searchController = TextEditingController();

  String searchQuery = '';
  String? categoryFilter;
  bool? inStockFilter;

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return Scaffold(
      appBar: TopAppBar(
        searchController: searchController,
        onSearchChanged: (value) => setState(() => searchQuery = value),
        selectedCategory: categoryFilter,
        onCategoryChanged: (value) => setState(() => categoryFilter = value),
        selectedStock: inStockFilter == null ? null : inStockFilter! ? "In" : "Out",
        onStockChanged: (value) {
          setState(() {
            if (value == "In") {
              inStockFilter = true;
            } else if (value == "Out") {
              inStockFilter = false;
            } else {
              inStockFilter = null;
            }
          });
        },
      ),
      body: SafeArea(
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductError) {
              return Center(child: Text(state.message));
            }

            if (state is ProductLoaded) {
              List<ProductEntity> products = state.products;

              // Search filter
              if (searchQuery.isNotEmpty) {
                products = products
                    .where((p) => p.name.toLowerCase().contains(searchQuery.toLowerCase()))
                    .toList();
              }

              // Category filter
              if (categoryFilter != null) {
                products = products.where((p) => p.category == categoryFilter).toList();
              }

              // Stock filter
              if (inStockFilter != null) {
                products = products.where((p) => p.inStock == inStockFilter).toList();
              }

              return LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 800;

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.add),
                            label: const Text("Add Product"),
                            onPressed: () => _showProductForm(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeColors.primary,
                              foregroundColor: themeColors.buttonText,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: isMobile
                            ? _buildGrid(products)
                            : _buildTable(products, context, themeColors),
                      ),
                    ],
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildGrid(List<ProductEntity> products) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300, // max width of each card
        childAspectRatio: 0.9,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (_, i) => ProductCard(product: products[i]),
    );
  }

  Widget _buildTable(List<ProductEntity> products, BuildContext context, AppThemeColors themeColors) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const [
          DataColumn(label: Text("ID")),
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Category")),
          DataColumn(label: Text("Price")),
          DataColumn(label: Text("Stock")),
          DataColumn(label: Text("Actions")),
        ],
        rows: products.map((p) {
          return DataRow(
            onSelectChanged: (_) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsPage(productId: p.id),
                ),
              );
            },
            cells: [
              DataCell(Text(p.id.toString())),
              DataCell(Text(p.name)),
              DataCell(Text(p.category)),
              DataCell(Text("\$${p.price}")),
              DataCell(
                Text(
                  p.inStock ? "In Stock" : "Out of Stock",
                  style: TextStyle(
                    color: p.inStock ? Colors.green : Colors.red, // Can also extend theme if needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataCell(
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: themeColors.primary),
                      onPressed: () => _showProductForm(context, product: p),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => context.read<ProductCubit>().deleteProduct(p.id),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  void _showProductForm(BuildContext context, {ProductEntity? product}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => ProductFormDialog(product: product),
    );
  }
}
