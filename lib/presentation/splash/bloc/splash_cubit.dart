import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviezone/domain/auth/usecases/is_logged_in.dart';

import '../../../service_locator.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplayInitial());

  void appStarted() async{
   await Future.delayed(Duration(seconds: 2));

   var isLoggedIn = await sl<IsLoggedInUseCase>().call();
   if(isLoggedIn){
     emit(Authenticated());
   }else{
     emit(UnAuthenticated());
   }
  }

}
