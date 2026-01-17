import 'package:flutter/material.dart';
import '../../../../core/theme/theme_extension.dart';
import '../../../../core/widgets/side_bar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;
    final theme = Theme.of(context);

    return Scaffold(
      drawer: isDesktop ? null : Drawer(child: const Sidebar()),
      body: Row(
        children: [
          // Sidebar visible on desktop only
          if (isDesktop) const Sidebar(),
          Expanded(
            child: child,
          ),
        ],
      ),
      appBar: isDesktop
          ? null
          : AppBar(
        backgroundColor: themeColors.appBarBg,
        foregroundColor: themeColors.appBarText,
        title: Text(
          "Dashboard",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: themeColors.appBarText,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: themeColors.appBarText),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
    );
  }
}
