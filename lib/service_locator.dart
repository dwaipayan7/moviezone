
import 'package:get_it/get_it.dart';
import 'package:moviezone/core/network/dio_client.dart';
import 'package:moviezone/data/auth/repositories/auth/auth.dart';
import 'package:moviezone/data/auth/sources/auth/auth_api_service.dart';
import 'package:moviezone/domain/auth/repositories/auth.dart';
import 'package:moviezone/domain/auth/usecases/signup.dart';

final sl = GetIt.instance;

void setupServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());

  //Service
  sl.registerSingleton<AuthApiService>(
    AuthApiServiceImpl()
  );

  //Repositories
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );


  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

}