import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/core/widgets/custom_button.dart';
import '../../../core/constants/utils.dart';
import '../../../core/constants/validations.dart';
import '../../../core/routes/routes_name.dart';
import '../../../core/theme/theme_extension.dart';
import '../../../core/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  bool isLoading = false;

  Future<void> submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2)); // fake API

    setState(() => isLoading = false);
    context.goNamed(RouteNames.home);

    showSuccessMessage(context, "Login Successful");
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;
    final themeColors = Theme.of(context).extension<AppThemeColors>()!;

    return Scaffold(
      backgroundColor: themeColors.scaffoldBg,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isDesktop ? 420 : double.infinity,
            ),
            child: Card(
              color: themeColors.inputBg,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 16),

                      Icon(Icons.lock_outline,
                          size: 48, color: themeColors.primary),
                      const SizedBox(height: 12),
                      Text(
                        "Welcome Back",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: themeColors.textPrimary,
                        ),
                      ),

                      const SizedBox(height: 32),

                      /// Email
                      CustomTextField(
                        label: "Email",
                        initialValue: email,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (v) => email = v,
                        validator: validateEmail,
                      ),

                      const SizedBox(height: 16),

                      /// Password
                      CustomTextField(
                        label: "Password",
                        initialValue: password,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (v) => password = v,
                        validator: validatePassword,
                      ),

                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(color: themeColors.primary),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// Login Button
                      CustomButton(
                        text: "Login",
                        isLoading: isLoading,
                        onPressed: submit,
                        backgroundColor: themeColors.primary,
                        textColor: themeColors.buttonText,
                        borderRadius: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
