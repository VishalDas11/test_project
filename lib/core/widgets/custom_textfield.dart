

import 'package:flutter/material.dart';
import '../theme/theme_extension.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String initialValue;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final double borderRadius;

  const CustomTextField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.borderRadius = 50,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppThemeColors>()!;
    final isDark = theme.brightness == Brightness.dark;

    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: initialValue,
      keyboardType: keyboardType,
      style: TextStyle(color: isDark ? Colors.white : Colors.black87),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
        filled: true,
        fillColor: colors.inputBg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[400]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: isDark ? Colors.grey[700]! : Colors.grey[400]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: colors.primary,
            width: 2,
          ),
        ),
      ),
      validator: validator ?? (v) => v == null || v.isEmpty ? "Required" : null,
      onChanged: onChanged,
    );
  }
}
