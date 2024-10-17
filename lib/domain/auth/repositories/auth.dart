import 'package:dartz/dartz.dart';
import '../../../data/auth/models/signin_req_params.dart';
import '../../../data/auth/models/signup_req_params.dart';

abstract class AuthRepository {

  Future<Either<String, Map<String, dynamic>>> signup(SignupReqParams params);
  Future<Either<String, Map<String, dynamic>>> signin(SigninReqParams params);
  Future<bool> isLoggedIn();

}
