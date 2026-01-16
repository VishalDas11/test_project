import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/product_model.dart';
import '../bloc/product_bloc.dart';

class ProductForm extends StatefulWidget {
  final ProductModel? product; // null = add, not null = edit
  final void Function(ProductModel)? onSubmit;
  final bool isUpdate;

  const ProductForm({super.key, this.product, required this.isUpdate, this.onSubmit});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController categoryController;
  late TextEditingController priceController;
  bool inStock = true;

  @override
  void initState() {
    super.initState();
    nameController =
        TextEditingController(text: widget.product?.name ?? "");
    categoryController =
        TextEditingController(text: widget.product?.category ?? "");
    priceController =
        TextEditingController(text: widget.product?.price.toString() ?? "");
    inStock = widget.product?.inStock ?? true;
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      final product = ProductModel(
        id: widget.product?.id ?? DateTime.now().millisecondsSinceEpoch,
        name: nameController.text,
        category: categoryController.text,
        price: double.parse(priceController.text),
        inStock: inStock,
      );

     widget.isUpdate == true ? context.read<ProductCubit>().updateProduct(product) : context.read<ProductCubit>().addProduct(product);
      // Call the onSubmit callback passed from the parent
      // widget.onSubmit(product);

      // Close the dialog
      Navigator.pop(context);
    }
  }


  @override
  Widget build(BuildContext context) {
    final isEdit = widget.product != null;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildField(
            controller: nameController,
            label: "Product Name",
          ),
          _buildField(
            controller: categoryController,
            label: "Category",
          ),
          _buildField(
            controller: priceController,
            label: "Price",
            keyboard: TextInputType.number,
          ),
          SwitchListTile(
            title: const Text("In Stock"),
            value: inStock,
            onChanged: (v) => setState(() => inStock = v),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: submit,
              child: Text(isEdit ? "Update Product" : "Add Product"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboard,
        validator: (v) =>
        v == null || v.isEmpty ? "$label is required" : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
