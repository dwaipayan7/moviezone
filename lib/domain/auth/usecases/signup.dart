import 'package:dartz/dartz.dart';
import 'package:moviezone/core/usecase/usecase.dart';
import 'package:moviezone/data/auth/models/auth/signup_req_params.dart';
import 'package:moviezone/domain/auth/repositories/auth.dart';

import '../../../service_locator.dart';

class SignupUseCase extends UseCase<Either, SignupReqParams>{


  @override
  Future<Either> call({SignupReqParams? params}) async{
    return await sl<AuthRepository>().signup(params!);
  }


}