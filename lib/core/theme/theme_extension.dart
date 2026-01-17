
import 'package:flutter/material.dart';

@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color primary;
  final Color buttonText;

  final Color scaffoldBg;
  final Color surface;
  final Color border;

  final Color appBarBg;
  final Color appBarText;

  final Color inputBg;
  final Color inputText;
  final Color inputBorder;

  final Color textPrimary;
  final Color textSecondary;

  final Color success;
  final Color error;

  final Color sidebarBg;
  final Color sidebarItemActive;
  final Color sidebarItemInactive;
  final Color iconColor;

  const AppThemeColors({
    required this.primary,
    required this.buttonText,
    required this.scaffoldBg,
    required this.surface,
    required this.border,
    required this.appBarBg,
    required this.appBarText,
    required this.inputBg,
    required this.inputText,
    required this.inputBorder,
    required this.textPrimary,
    required this.textSecondary,
    required this.success,
    required this.error,
    required this.sidebarBg,
    required this.sidebarItemActive,
    required this.sidebarItemInactive,
    required this.iconColor
  });

  @override
  AppThemeColors copyWith({
    Color? primary,
    Color? buttonText,
    Color? scaffoldBg,
    Color? surface,
    Color? border,
    Color? appBarBg,
    Color? appBarText,
    Color? inputBg,
    Color? inputText,
    Color? inputBorder,
    Color? textPrimary,
    Color? textSecondary,
    Color? success,
    Color? error,
    Color? sidebarBg,
    Color? sidebarItemActive,
    Color? sidebarItemInactive,
    Color? iconColor,
  }) {
    return AppThemeColors(
      primary: primary ?? this.primary,
      buttonText: buttonText ?? this.buttonText,
      scaffoldBg: scaffoldBg ?? this.scaffoldBg,
      surface: surface ?? this.surface,
      border: border ?? this.border,
      appBarBg: appBarBg ?? this.appBarBg,
      appBarText: appBarText ?? this.appBarText,
      inputBg: inputBg ?? this.inputBg,
      inputText: inputText ?? this.inputText,
      inputBorder: inputBorder ?? this.inputBorder,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      success: success ?? this.success,
      error: error ?? this.error,
      sidebarBg: sidebarBg ?? this.sidebarBg,
      sidebarItemActive:
      sidebarItemActive ?? this.sidebarItemActive,
      sidebarItemInactive:
      sidebarItemInactive ?? this.sidebarItemInactive,
      iconColor: iconColor ?? this.iconColor
    );
  }

  @override
  AppThemeColors lerp(
      ThemeExtension<AppThemeColors>? other,
      double t,
      ) {
    if (other is! AppThemeColors) return this;

    return AppThemeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      buttonText: Color.lerp(buttonText, other.buttonText, t)!,
      scaffoldBg: Color.lerp(scaffoldBg, other.scaffoldBg, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      border: Color.lerp(border, other.border, t)!,
      appBarBg: Color.lerp(appBarBg, other.appBarBg, t)!,
      appBarText: Color.lerp(appBarText, other.appBarText, t)!,
      inputBg: Color.lerp(inputBg, other.inputBg, t)!,
      inputText: Color.lerp(inputText, other.inputText, t)!,
      inputBorder: Color.lerp(inputBorder, other.inputBorder, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary:
      Color.lerp(textSecondary, other.textSecondary, t)!,
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      sidebarBg: Color.lerp(sidebarBg, other.sidebarBg, t)!,
      sidebarItemActive:
      Color.lerp(sidebarItemActive, other.sidebarItemActive, t)!,
      sidebarItemInactive:
      Color.lerp(sidebarItemInactive, other.sidebarItemInactive, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }
}
