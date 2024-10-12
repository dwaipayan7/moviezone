import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviezone/common/helper/navigation/app_navigation.dart';
import 'package:moviezone/core/assets/app_images.dart';
import 'package:moviezone/presentation/auth/pages/signin_dart.dart';
import 'package:moviezone/presentation/splash/bloc/splash_cubit.dart';

import '../../home/pages/home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if(state is UnAuthenticated){
            AppNavigator.pushReplacement(context, SigninPage());
          }
          if(state is Authenticated){
            AppNavigator.pushReplacement(context, HomePage());
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.splashBackground)
                  )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xff1A1B20).withOpacity(0),
                        const Color(0xff1A1B20),
                      ]
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
