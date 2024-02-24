import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/utils/dio_helper.dart';
import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';

class RecentJobRemoteRequest {
  static final Dio _dio = DioHelper.dio;
  static const String dioUrl = DioHelper.apiUrl;
  static Future<List<SuggestedJobModel>?> getRecentJob(String token) async {
    try {
      List<SuggestedJobModel> recentJobsModels = [];

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('${dioUrl}jobs');
      // log('${response.data}');
      var data = response.data['data'];
      log('$data');
        for (Map item in data) {
            recentJobsModels.add(SuggestedJobModel.fromJson(item));
        }
      return recentJobsModels;
    } catch (e) {
      log('error in remote request');
      return null;
    }
  }
}
