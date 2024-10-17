part of 'splash_cubit.dart';


sealed class SplashState {}

class DisplayInitial extends SplashState {}

class Authenticated extends SplashState{}

class UnAuthenticated extends SplashState{}
