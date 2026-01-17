import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/routes/app_routes.dart';
import 'core/services/service.dart';
import 'core/theme/bloc/theme_cubit.dart';
import 'core/theme/theme.dart';
import 'feature/product/presentation/bloc/product_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocator.init(baseUrl: "https://dummyjson.com");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (_) => sl<ProductCubit>()..fetchProducts(),
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: 'Product Dashboard',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
