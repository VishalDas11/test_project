import 'package:go_router/go_router.dart';
import 'package:test_project/app_router/router_names.dart';

import '../feature/products/data/model/product_model.dart';
import '../feature/products/presentation/screens/product_detail_screen.dart';
import '../feature/products/presentation/screens/product_list_screen.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.products,
  routes: [
    GoRoute(
      path: AppRoutes.products,
      name: AppRoutes.products,
      builder: (context, state) => const ProductListPage(),
    ),
    GoRoute(
      path: AppRoutes.productDetails,
      name: AppRoutes.productDetails,
      builder: (context, state) {
        final product = state.extra as ProductModel;
        return ProductDetailsPage(product: product);
      },
    ),
  ],
);
