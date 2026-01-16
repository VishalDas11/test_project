import 'package:flutter/material.dart';

import '../../../../core/utils/dailog.dart';
import '../../data/model/product_model.dart';
import 'build_form.dart';


class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showResponsiveDialog(
          context: context,
          title: "Edit Product",
          child: ProductForm(
            product: product,
            isUpdate: true,
            // onSubmit: (updated) {
            //   final index = staticProducts
            //       .indexWhere((e) => e.id == product.id);
            //   staticProducts[index] = updated;
            // },
          ),
        );
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name,
                  style: const TextStyle(fontSize: 18)),
              Text(product.category),
              const Spacer(),
              Text("\$${product.price}"),
              Chip(
                label: Text(product.inStock ? "In Stock" : "Out"),
                backgroundColor:
                product.inStock ? Colors.green : Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


