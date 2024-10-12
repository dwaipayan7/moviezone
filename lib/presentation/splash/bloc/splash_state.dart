part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

class DisplayInitial extends SplashState {}

class Authenticated extends SplashState{}

class UnAuthenticated extends SplashState{}
