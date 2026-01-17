
import 'package:flutter/material.dart';
import '../helper.dart';
import '../../core/theme/theme_extension.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showFilters;
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<String?>? onCategoryChanged;
  final String? selectedCategory;
  final ValueChanged<String?>? onStockChanged;
  final String? selectedStock; // "In", "Out", or null

  const TopAppBar({
    super.key,
    this.showFilters = true,
    this.searchController,
    this.onSearchChanged,
    this.onCategoryChanged,
    this.selectedCategory,
    this.onStockChanged,
    this.selectedStock,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return AppBar(
      toolbarHeight: showFilters ? 60 : kToolbarHeight,
      backgroundColor: themeColors.appBarBg,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Title on desktop/web
              if (!Responsive.isMobile(context))
                Text(
                  "Product Dashboard",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: themeColors.appBarText,
                  ),
                ),
              if (!Responsive.isMobile(context)) const Spacer(),
              // Search Field
              Expanded(
                child:
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: searchController,
                    onChanged: onSearchChanged,
                    decoration: InputDecoration(
                      hintText: "Search products...",
                      filled: true,
                      fillColor: themeColors.inputBg,

                      prefixIcon: Icon(Icons.search, color: themeColors.iconColor),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    style: TextStyle(color: themeColors.inputText),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottom: showFilters
          ? PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              // Category Dropdown
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: DropdownButtonFormField<String>(
                    initialValue: selectedCategory,
                    onChanged: onCategoryChanged,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: themeColors.inputBg,
                      // prefixIcon: Icon(Icons.category, color: themeColors.iconColor),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    hint: Text("Category", style: TextStyle(color: Colors.grey)),
                    items: const [
                      DropdownMenuItem(value: "beauty", child: Text("Beauty")),
                      DropdownMenuItem(value: "fragrances", child: Text("Fragrances")),
                      DropdownMenuItem(value: "furniture", child: Text("Furniture")),
                      DropdownMenuItem(value: "groceries", child: Text("Groceries")),
                    ],
                    dropdownColor: themeColors.inputBg,
                    style: TextStyle(color: themeColors.textPrimary),
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Stock Dropdown
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: DropdownButtonFormField<String>(
                    initialValue: selectedStock,
                    onChanged: onStockChanged,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: themeColors.inputBg,
                      // prefixIcon: Icon(Icons.inventory, color: themeColors.iconColor),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    hint: Text("Stock", style: TextStyle(color: Colors.grey)),
                    items: const [
                      DropdownMenuItem(value: "In", child: Text("In Stock")),
                      DropdownMenuItem(value: "Out", child: Text("Out of Stock")),
                    ],
                    dropdownColor: themeColors.inputBg,
                    style: TextStyle(color: themeColors.textPrimary),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
          : null,

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(showFilters ? 120 : kToolbarHeight);
}
