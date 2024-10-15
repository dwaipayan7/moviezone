import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moviezone/common/helper/navigation/app_navigation.dart';
import 'package:moviezone/core/configs/themes/app_colors.dart';
import 'package:moviezone/data/auth/models/auth/signup_req_params.dart';
import 'package:moviezone/data/auth/repositories/auth/auth.dart';
import 'package:moviezone/data/auth/sources/auth/auth_api_service.dart';
import 'package:moviezone/domain/auth/usecases/signup.dart';
import 'package:moviezone/presentation/auth/pages/signin_dart.dart';
import 'package:moviezone/presentation/auth/pages/signup.dart';
import 'package:reactive_button/reactive_button.dart'; // Ensure this package is properly added

class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackground,
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 100, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _signupText(),
              const SizedBox(height: 40),
              _emailField(),
              const SizedBox(height: 20),
              _passwordField(),
              const SizedBox(height: 50),
              _signInButton(),
              const SizedBox(height: 30),
              _signInText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signupText() {
    return const Text(
      'Sign Up',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _signInButton() {
    return ReactiveButton(
      title: "Sign Up",
      activeColor: AppColors.primary,
      onPressed: () async {
        // Add sign-in logic here
        SignupUseCase(
            authRepository:
            AuthRepositoryImpl(
                authApiService: AuthApiServiceImpl())
        ).call(
          params: SignupReqParams(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim()
          )
        );
      },
      onSuccess: () {
        // Success logic here
      },
      onFailure: (err) {
        // Error handling logic here
      },
    );
  }

  Widget _signInText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Do you have account? ",
            style: TextStyle(color: Colors.white70),
          ),
          TextSpan(
            text: "Sign In",
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, const SigninPage());
              },
          ),
        ],
      ),
    );
  }
}
