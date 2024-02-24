import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/utils/dio_helper.dart';
import 'package:flutter_application_1/features/homescreen/data/data_models/suggested_job_model.dart';

class SuggestedRemoteRequest {
  static final Dio _dio = DioHelper.dio;
  static const String dioUrl = DioHelper.apiUrl;
  static Future<List<SuggestedJobModel>?> getSuggestedJob(String token) async {
    try {
      List<SuggestedJobModel> suggestedJobsModels = [];

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('${dioUrl}jobs/sugest/2');
      // log('${response.data}');
      var data = response.data['data'];
      log('$data');
      // for (dynamic item in data) {
      // suggestedJobsModels.add(SuggestedJobModel.fromJson(data));
      // }
      if (data != null && data is Map) {
        SuggestedJobModel suggestedJobModel = SuggestedJobModel.fromJson(data);
        return [suggestedJobModel];
      } else if (data != null && data is List) {
        List<SuggestedJobModel> suggestedJobsModels = [];
        for (var item in data) {
          if (item is Map) {
            suggestedJobsModels.add(SuggestedJobModel.fromJson(item));
          }
        }
      }
      return suggestedJobsModels;
    } catch (e) {
      log('error in remote request');
      return null;
    }
  }
}
