import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/utils/dio_helper.dart';
import 'package:flutter_application_1/features/create_account/data/user_model.dart';

// class RemoteDataSource {
//   static final Dio _dio = DioHelper.dio;
//   static const String dioUrl = DioHelper.apiUrl;

//   static Future<void> createAccount(UserModel user) async {
//     try {
//       // Use _dio to make the API call to create an account
//       // You can customize the request, handle responses, etc.
//       final response =
//           await _dio.post('${dioUrl}auth/register', data: user.toJson());
//       print(response.data);
      
//     } catch (e) {
//       // Handle errors
//       print('Error creating account: $e');
//       throw e;
//     }
//   }
// }

class RegisterRemoteDataSource {
  // ... your existing code ...
    static final Dio _dio = DioHelper.dio;
  static const String dioUrl = DioHelper.apiUrl;

  static Future<void> createAccount(UserModel user) async {
 
      final response = await _dio.post('${dioUrl}auth/register', data: user.toJson());

      if (response.statusCode == 200) {
        // The request was successful, handle the response data here
        log('Account created successfully: ${response.data}');
      } else {
        // The server returned an error status code
        log('Failed to create account. Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } 
  }

