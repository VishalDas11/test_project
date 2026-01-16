import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Dashboard"),
        actions: [
          SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Row(
        children: [
          if (width > 900) _SideBar(),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(16),
            child: child,
          )),
        ],
      ),
    );
  }
}

class _SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedIndex: 0,
      labelType: NavigationRailLabelType.all,
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.dashboard),
          label: Text("Dashboard"),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.inventory),
          label: Text("Products"),
        ),
      ],
    );
  }
}
