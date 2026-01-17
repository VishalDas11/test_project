
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/routes_name.dart';
import '../../core/theme/theme_extension.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    // Get current route name from GoRouter
    final String? currentRoute = GoRouterState.of(context).name;

    return Container(
      width: 220,
      color: themeColors.sidebarBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Menu",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: themeColors.appBarText,
              ),
            ),
          ),
          const SizedBox(height: 30),
          _SidebarItem(
            title: "Products",
            icon: Icons.inventory_2,
            isActive: currentRoute == RouteNames.home,
            onTap: () => context.goNamed(RouteNames.home),
          ),
          _SidebarItem(
            title: "Settings",
            icon: Icons.settings,
            isActive: currentRoute == RouteNames.settings,
            onTap: () => context.goNamed(RouteNames.settings),
          ),
          _SidebarItem(
            title: "Logout",
            icon: Icons.logout,
            isActive: currentRoute == RouteNames.login,
            onTap: () => context.goNamed(RouteNames.login),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.title,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: isActive
              ? themeColors.sidebarItemActive
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isActive
                  ? themeColors.buttonText // Active item text/icon
                  : themeColors.sidebarItemInactive,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: isActive
                    ? themeColors.buttonText
                    : themeColors.sidebarItemInactive,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
