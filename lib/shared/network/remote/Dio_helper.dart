// ignore_for_file: file_names, prefer_if_null_operators, unused_import

import 'package:dio/dio.dart';
import 'package:market/shared/Components/constants.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
    dio=Dio(
      BaseOptions(
        baseUrl:'https://student.valuxapps.com/api/' ,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type':'application/json'
        }
      ),
    );

  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization':token ,
      'lang': lang,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

   static Future<Response<dynamic>> postData(
      {required String url,
      Map<String, dynamic>? query,
      String lang = 'en',
      String? token,
      // required String? email,

        required Map<String, dynamic> data}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization' : token!=null?token:'',
      // 'email':email,
     };
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
    );
  }



}

