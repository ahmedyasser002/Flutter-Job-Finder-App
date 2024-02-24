import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/utils/dio_helper.dart';
import 'package:flutter_application_1/features/saved_notifications/data/data_models/saved_job_model.dart';

class SavedRemoteRequest {
  static final Dio _dio = DioHelper.dio;
  static const String dioUrl = DioHelper.apiUrl;
  static Future<void> addFavorite(int id , String token) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.post('${dioUrl}favorites', data: {'job_id':id});
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
  static Future<dynamic> getAllFavorites(String token)async{
    try{

    
    List savedModels = [];
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.get('${dioUrl}favorites');
    var data = response.data['data'];
      log('$data');
        for (Map item in data) {
            savedModels.add(SavedJobModel.fromJson(item));
        }
      return savedModels;
    } catch (e) {
      log('error in remote request');
      return null;
    }



  }
}
