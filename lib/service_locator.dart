
import 'package:get_it/get_it.dart';
import 'package:moviezone/core/network/dio_client.dart';
import 'package:moviezone/domain/auth/repositories/auth.dart';
import 'package:moviezone/domain/auth/usecases/is_logged_in.dart';
import 'package:moviezone/domain/auth/usecases/signup.dart';
import 'data/auth/repositories/auth.dart';
import 'data/auth/sources/auth/auth_api_service.dart';
import 'domain/auth/usecases/signin.dart';

final sl = GetIt.instance;

void setupServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());

  //Service
  sl.registerSingleton<AuthService>(
    AuthApiServiceImpl()
  );

  //Repositories
  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );


  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
      SigninUseCase()
  );

  sl.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase()
  );

}