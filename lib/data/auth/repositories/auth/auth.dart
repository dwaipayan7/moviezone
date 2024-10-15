import 'package:dartz/dartz.dart';
import 'package:moviezone/data/auth/sources/auth/auth_api_service.dart';
import 'package:moviezone/domain/auth/repositories/auth.dart';

import '../../models/auth/signup_req_params.dart';

class AuthRepositoryImpl extends AuthRepository{

  AuthApiService authApiService;

  AuthRepositoryImpl({
    required this.authApiService
});


  @override
  Future<Either> signup(SignupReqParams params) async{

    return await authApiService.signup(params);
  }

}