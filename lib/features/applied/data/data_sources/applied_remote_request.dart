import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/utils/dio_helper.dart';

class AppliedRemoteRequest {
  static final Dio _dio = DioHelper.dio;
  static const String dioUrl = DioHelper.apiUrl;
  static Future getAppliedJob(String token) async {
    try {
      List appliedJobs = [];

      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('${dioUrl}apply/2');
      // log('${response.data}');
      var data = response.data['data'];
      log('$data');
        for (Map item in data) {
            appliedJobs.add(item['jobs_id']);
        }
      return appliedJobs;
    } catch (e) {
      log('error in remote request');
      return null;
    }
  }
}
