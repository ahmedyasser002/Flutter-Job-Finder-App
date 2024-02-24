import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/utils/dio_helper.dart';

class LoginRemoteRequest {
  static final Dio _dio = DioHelper.dio;
  static const String dioUrl = DioHelper.apiUrl;
  static Future<dynamic> login(String email, String password) async {
    try {
      final response = await _dio.post('${dioUrl}auth/login',
          data: {'email': email, 'password': password});
      log('$response');
      return response;
    } catch (e) {
      log('failed');
      return false;
    }
  }
}
