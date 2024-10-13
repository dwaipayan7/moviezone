import 'package:flutter/material.dart';
import 'package:moviezone/core/configs/themes/app_colors.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackground,
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _signInText(),
              SizedBox(height: 26,),
              _emailField()
            ],
          )
      ),
    );
  }

  Widget _signInText(){
    return Text(
      'Sign In',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24
      ),
    );
  }

  Widget _emailField(){
    return TextField(
      decoration: InputDecoration(
        hintText: "Email"
      ),
    );
  }

}
