import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/utils/dio_helper.dart';

class ApplyRemoteRequest {
  static final Dio _dio = DioHelper.dio;
  static const String dioUrl = DioHelper.apiUrl;

  static Future<void> applyJob({
    required String token,
    required String name,
    required String email,
    required String mobile,
    required String workType,
    required int jobID,
    required int userID,
    required File? otherFile,
    required File? cvFile,
  }) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';

    // Convert files to MultipartFile
    MultipartFile? cvFileMultipartFile;
    MultipartFile? otherFileMultipartFile;

    if (cvFile != null) {
      List<int> cvFileBytes = await cvFile.readAsBytes();
      cvFileMultipartFile = MultipartFile.fromBytes(cvFileBytes, filename: cvFile.path.split('/').last);
    }

    if (otherFile != null) {
      List<int> otherFileBytes = await otherFile.readAsBytes();
      otherFileMultipartFile = MultipartFile.fromBytes(otherFileBytes, filename: otherFile.path.split('/').last);
    }

    try {
      final response = await _dio.post(
        '${dioUrl}apply',
        data: FormData.fromMap({
          'cv_file': cvFileMultipartFile,
          'name': name,
          'email': email,
          'mobile': mobile,
          'work_type': workType,
          'other_file': otherFileMultipartFile,
          'jobs_id': jobID,
          'user_id': userID,
        }),
      );

      if (response.statusCode == 200) {
        // The request was successful, handle the response data here
        log('Job application successful: ${response.data}');
      } else {
        // The server returned an error status code
        log('Failed to apply for the job. Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      log('Error applying for job: $e');
      throw e;
    }
  }
}
