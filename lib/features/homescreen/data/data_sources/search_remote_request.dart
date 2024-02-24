import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/utils/dio_helper.dart';
import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';

class SearchRemoteRequest{
  static final Dio _dio = DioHelper.dio;
  static const String dioUrl = DioHelper.apiUrl;
  static Future<List<SuggestedJobModel>?> getSearchResult({required String token , required String name , String? location='' , String? salary=''}) async {
    try {
      List<SuggestedJobModel> searchResults = [];

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.post('${dioUrl}jobs/filter' , data: {
        'name' : name,
        'location' :location,
        'salary' : salary
      });
      // log('${response.data}');
      var data = response.data['data'];
      log('$data');
        for (Map item in data) {
            searchResults.add(SuggestedJobModel.fromJson(item));
        }
      return searchResults;
    } catch (e) {
      log('error in remote request');
      return null;
    }
  }
}