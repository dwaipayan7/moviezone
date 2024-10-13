import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviezone/presentation/auth/pages/signin_dart.dart';
import 'package:moviezone/presentation/splash/bloc/splash_cubit.dart';
import 'package:moviezone/presentation/splash/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
      )
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>
        SplashCubit()..appStarted()),
      ],

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MovieZone',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashPage(),
        ),
    );
  }
}

