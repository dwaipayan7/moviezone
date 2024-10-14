import 'package:dartz/dartz.dart';
import 'package:moviezone/data/auth/models/auth/signup_req_params.dart';

abstract class AuthRepository{

  Future<Either> signup(SignupReqParams params);



}