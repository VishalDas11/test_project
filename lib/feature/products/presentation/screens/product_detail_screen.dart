// import 'package:flutter/material.dart';
//
// import '../../../../core/utils/dailog.dart';
// import '../../data/model/product_model.dart';
// import '../widgets/build_form.dart';
//
// class ProductDetailsPage extends StatelessWidget {
//   final ProductModel product;
//
//   const ProductDetailsPage({
//     super.key,
//     required this.product,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Product Details"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.edit),
//             onPressed: () {
//               showResponsiveDialog(
//                 context: context,
//                 title: "Edit Product",
//                 child: ProductForm(
//                   product: product,
//                   onSubmit: (updated) {
//                     final index = staticProducts
//                         .indexWhere((e) => e.id == product.id);
//                     staticProducts[index] = updated;
//                   },
//                 ),
//               );
//             },
//           )
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Card(
//           child: Padding(
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(product.name,
//                     style: Theme.of(context).textTheme.headlineMedium),
//                 const SizedBox(height: 12),
//                 Text("Category: ${product.category}"),
//                 Text("Price: \$${product.price}"),
//                 const SizedBox(height: 8),
//                 Chip(
//                   label: Text(product.inStock ? "In Stock" : "Out of Stock"),
//                   backgroundColor:
//                   product.inStock ? Colors.green : Colors.red,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/dailog.dart';
import '../../data/model/product_model.dart';
import '../bloc/product_bloc.dart';
import '../widgets/build_form.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Open Edit Product Modal
              showResponsiveDialog(
                context: context,
                title: "Edit Product",
                child: ProductForm(
                  product: product,
                  isUpdate: true,
                  // onSubmit: (updated) {
                  //
                  //   IconButton(
                  //     icon: const Icon(Icons.edit),
                  //     onPressed: () {
                  //       showResponsiveDialog(
                  //         context: context,
                  //         title: "Edit Product",
                  //         child: ProductForm(
                  //           product: product,
                  //           onSubmit: (updated) {
                  //             context.read<ProductCubit>().updateProduct(updated);
                  //           },
                  //         ),
                  //       );
                  //     },
                  //   );
                  //
                  // },
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text("ID: ${product.id}"),
                Text("Category: ${product.category}"),
                Text("Price: \$${product.price}"),
                const SizedBox(height: 8),
                Chip(
                  label: Text(product.inStock ? "In Stock" : "Out of Stock"),
                  backgroundColor: product.inStock ? Colors.green : Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
