import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moviezone/common/helper/message/display_message.dart';
import 'package:moviezone/common/helper/navigation/app_navigation.dart';
import 'package:moviezone/core/configs/themes/app_colors.dart';
import 'package:moviezone/domain/auth/usecases/signin.dart';
import 'package:moviezone/presentation/auth/pages/signup.dart';
import 'package:moviezone/presentation/home/pages/home.dart';
import 'package:reactive_button/reactive_button.dart';

import '../../../data/auth/models/signin_req_params.dart';
import '../../../service_locator.dart'; // Ensure this package is properly added

class SigninPage extends StatelessWidget {
   SigninPage({super.key});

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
              _signInText(),
              const SizedBox(height: 40),
              _emailField(),
              const SizedBox(height: 20),
              _passwordField(),
              const SizedBox(height: 50),
              _signInButton(context),
              const SizedBox(height: 30),
              _signupText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      'Sign In',
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
      style: TextStyle(color: Colors.white),
    );
  }

  Widget _signInButton(BuildContext context) {
    return ReactiveButton(
      title: "Sign In",
      activeColor: AppColors.primary,
      onPressed: () async {
        // Add sign-in logic here
        sl<SigninUseCase>().call(
          params: SigninReqParams(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim()
          )
        );
      },
      onSuccess: () {
        // Success logic here
       AppNavigator.pushAndRemove(context, HomePage());
      },
      onFailure: (err) {
        // Error handling logic here
        DisplayMessage.errorMessage(err, context);
        print(err);
      },
    );
  }

  Widget _signupText(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(color: Colors.white70),
          ),
          TextSpan(
            text: "Sign Up",
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context,  SignUpPage());
              },
          ),
        ],
      ),
    );
  }
}
