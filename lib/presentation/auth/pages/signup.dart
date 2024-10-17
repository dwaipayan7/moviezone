import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:moviezone/common/helper/navigation/app_navigation.dart';
import 'package:moviezone/core/configs/themes/app_colors.dart';
import 'package:moviezone/domain/auth/usecases/signup.dart';
import 'package:moviezone/presentation/auth/pages/signin_dart.dart';
import 'package:moviezone/presentation/auth/pages/signup.dart';
import 'package:reactive_button/reactive_button.dart';

import '../../../common/helper/message/display_message.dart';
import '../../../data/auth/models/signup_req_params.dart';
import '../../../service_locator.dart';
import '../../home/pages/home.dart'; // Ensure this package is properly added

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
              _signUpButton(context),
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

  Widget _signUpButton(BuildContext context) {
    return ReactiveButton(
      title: "Sign Up",
      activeColor: AppColors.primary,
      onPressed: () async {
        // Add sign-in logic here

       await sl<SignupUseCase>().call(
            params: SignupReqParams(
                email: _emailController.text.trim(),
                password: _passwordController.text.trim()
        ));
      },
      onSuccess: () {
        // Success logic here
        AppNavigator.pushReplacement(context, HomePage());
      },
      onFailure: (err) {
        // Error handling logic here
        // Success logic here
        // AppNavigator.pushAndRemove(context, HomePage());
        DisplayMessage.errorMessage(err, context);

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
                AppNavigator.push(context,  SigninPage());
              },
          ),
        ],
      ),
    );
  }
}
