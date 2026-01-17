import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/bloc/theme_cubit.dart';
import '../../../../core/theme/theme_extension.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return SwitchListTile(
              title: Text(
                "Dark Mode",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: themeColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              value: themeMode == ThemeMode.dark,
              activeThumbColor: themeColors.primary,
              activeTrackColor: themeColors.primary.withOpacity(0.5),
              inactiveThumbColor: themeColors.appBarText,
              onChanged: (val) =>
                  context.read<ThemeCubit>().toggleTheme(val),
            );
          },
        ),
      ),
    );
  }
}
