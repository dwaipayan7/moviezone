import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:moviezone/core/constants/api_url.dart';
import 'package:moviezone/core/network/dio_client.dart';

import '../../../service_locator.dart';

abstract class AuthApiService{
  Future<Either> signup();
}

class AuthApiServiceImpl extends AuthApiService{
  @override
  Future<Either> signup() async{
   try{

     var response = sl<DioClient>().post(

       ApiUrl.signup,
       data:

     );

   } on DioException catch(e){
     return Left(e.response!.data['message']);
   }
  }

}