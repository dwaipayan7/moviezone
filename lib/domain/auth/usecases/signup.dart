import 'package:dartz/dartz.dart';
import 'package:moviezone/core/usecase/usecase.dart';
import 'package:moviezone/data/auth/models/auth/signup_req_params.dart';
import 'package:moviezone/domain/auth/repositories/auth.dart';

class SignupUseCase extends UseCase<Either, SignupReqParams>{

  final AuthRepository authRepository;

  SignupUseCase({required this.authRepository});

  @override
  Future<Either> call({SignupReqParams? params}) async{
    return await authRepository.signup(params!);
  }


}