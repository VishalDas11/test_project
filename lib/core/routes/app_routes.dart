
import 'package:go_router/go_router.dart';
import 'package:test_project/core/routes/routes_name.dart';
import 'package:test_project/feature/auth/presentation/login_screen.dart';
import 'package:test_project/feature/product/presentation/screens/product_list_page.dart';
import 'package:test_project/feature/product/presentation/screens/setting_screen.dart';
import '../../feature/product/presentation/screens/product_dashboard_page.dart';
import '../../feature/product/presentation/screens/product_detail_screen.dart';

// Centralized route names

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.login,
    routes: [
      GoRoute(
        path: RouteNames.login,
        name: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      // Product List Page
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        builder: (context, state) => const DashboardLayout(child: ProductListPage()),
      ),

      // Product Details Page
      GoRoute(
        path: RouteNames.productDetails,
        name: RouteNames.productDetails,
        builder: (context, state) {
          final id = state.extra as int;

          return ProductDetailsPage(productId: id);
        },
      ),

      // Settings Page
      GoRoute(
        path: RouteNames.settings,
        name: RouteNames.settings,
        builder: (context, state) =>
            const DashboardLayout(child: SettingScreen()),
      ),
    ],
  );
}
