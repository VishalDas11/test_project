// import 'package:flutter/material.dart';
//
// class AppColors {
//   // 🔹 General
//   static const primary = Color(0xFF0D47A1); // Blue
//   static const primaryDark = Color(0xFF0A3570);
//   static const secondary = Color(0xFF1976D2);
//   static const secondaryDark = Color(0xFF145DA0);
//
//   // 🔹 Backgrounds
//   static const backgroundLight = Color(0xFFF5F5F5);
//   static const backgroundDark = Color(0xFF121212);
//
//   // 🔹 AppBar
//   static const appBarLight = Colors.white;
//   static const appBarDark = Color(0xFF1F1F1F);
//
//   // 🔹 Sidebar
//   static const sidebarLight = Color(0xFFEEEEEE);
//   static const sidebarDark = Color(0xFF212121);
//
//   // 🔹 Sidebar active item
//   static const sidebarItemActiveLight = Color(0xFFBBDEFB); // Light blue
//   static const sidebarItemActiveDark = Color(0xFF1565C0); // Darker blue
//
//   // 🔹 Fields (TextField, Dropdown, Search)
//   static const fieldLight = Colors.white;
//   static const fieldDark = Color(0xFF2C2C2C);
//
//   // 🔹 Text
//   static const textLight = Colors.black87;
//   static const textDark = Colors.white;
//
//   // 🔹 Buttons
//   static const buttonLight = Color(0xFF1976D2);
//   static const buttonDark = Color(0xFF0D47A1);
//   static const buttonTextLight = Colors.white;
//   static const buttonTextDark = Colors.white;
//
//   // 🔹 Unified button text
//   static const buttonText = Colors.white;
//
//   static const inputBgLight = Colors.white;          // Light mode
//   static const inputBgDark = Color(0xFF2C2C2C);     // Dark mode
//
//   // 🔹 Other colors
//   static const inStock = Colors.green;
//   static const outStock = Colors.red;
// }

import 'package:flutter/material.dart';

class AppColors {
  // Primary
  static const Color primary = Color(0xFF1976D2); // light primary
  static const Color primaryDark = Color(0xFF90CAF9); // dark primary

  // Scaffold background
  static const Color scaffoldLight = Color(0xFFF5F5F5); // light scaffold
  static const Color scaffoldDark = Color(0xFF121212); // dark scaffold

  // AppBar
  static const Color appBarLight = Color(0xFFFFFFFF); // light appbar
  static const Color appBarDark = Color(0xFF1F1F1F); // dark appbar
  static const Color appBarText = Color(0xFF000000); // text color for appbar (same for both)

  // Buttons
  static const Color buttonText = Color(0xFFFFFFFF); // text on buttons

  // Input fields
  static const Color inputBgLight = Color(0xFFFFFFFF); // light input background
  static const Color inputBgDark = Color(0xFF1E1E1E); // dark input background

  // Sidebar
  static const Color sidebarLight = Color(0xFFEEEEEE);
  static const Color sidebarDark = Color(0xFF1B1B1B);

  static const Color sidebarItemActiveLight = Color(0xFFBBDEFB);
  static const Color sidebarItemActiveDark = Color(0xFF1565C0);

  static const Color sidebarItemTextLight = Color(0xFF000000);
  static const Color sidebarItemTextDark = Color(0xFFFFFFFF);

  static const Color sidebarItemInactiveLight = Color(0x99000000); // 60% black
  static const Color sidebarItemInactiveDark = Color(0x99FFFFFF); // 60% white

  static const fieldLight = Colors.white;
  static const fieldDark = Color(0xFF2C2C2C);
}

