
import 'package:flutter/material.dart';
import 'theme_extension.dart';

/// ✅ DARK THEME
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF0F172A),
  extensions: <ThemeExtension<dynamic>>[
    AppThemeColors(
      // General
      primary: const Color(0xFF3B82F6),        // main blue
      buttonText: Colors.white,

      // Scaffold / Surface
      scaffoldBg: const Color(0xFF0F172A),
      surface: const Color(0xFF111827),        // cards, dialogs, switches
      border: const Color(0xFF334155),

      // AppBar
      appBarBg: const Color(0xFF020617),
      appBarText: Colors.white,

      // Input fields
      inputBg: const Color(0xFF1F2937),
      inputText: Colors.white,
      inputBorder: const Color(0xFF334155),

      // Text
      textPrimary: Colors.white,
      textSecondary: const Color(0xFF94A3B8),

      // Status
      success: const Color(0xFF22C55E),
      error: const Color(0xFFEF4444),

      // Sidebar
      sidebarBg: const Color(0xFF020617),
      sidebarItemActive: const Color(0xFF3B82F6),
      sidebarItemInactive: const Color(0xFF94A3B8),
      iconColor: Colors.white60
    ),
  ],
);

/// ✅ LIGHT THEME
final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF5F7FA),
  extensions: <ThemeExtension<dynamic>>[
    AppThemeColors(
      // General
      primary: const Color(0xFF2563EB),       // modern blue
      buttonText: Colors.white,

      // Scaffold / Surface
      scaffoldBg: const Color(0xFFF5F7FA),
      surface: Colors.orange,
      border: const Color(0xFFE5E7EB),

      // AppBar
      appBarBg: const Color(0xFF2563EB),
      appBarText: Colors.white,

      // Input fields
      inputBg: Colors.white,
      inputText: const Color(0xFF111827),
      inputBorder: const Color(0xFFD1D5DB),

      // Text
      textPrimary: const Color(0xFF111827),
      textSecondary: const Color(0xFF6B7280),

      // Status
      success: const Color(0xFF16A34A),
      error: const Color(0xFFDC2626),

      // Sidebar
      sidebarBg: const Color(0xFF1E293B),
      sidebarItemActive: const Color(0xFF2563EB),
      sidebarItemInactive: const Color(0xFFCBD5E1),
      iconColor: Colors.black
    ),
  ],
);
