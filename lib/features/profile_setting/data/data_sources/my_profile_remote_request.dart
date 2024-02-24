import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/utils/dio_helper.dart';
import 'package:flutter_application_1/features/profile_setting/data/data_models/portfolio_model.dart';

class MyProfileRemoteRequest {
  static final Dio _dio = DioHelper.dio;
  static const String dioUrl = DioHelper.apiUrl;

  static Future<void> editProfile({
    required String token,
    required String bio,
    required String address,
    required String mobile,
  }) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.put(
      '${dioUrl}user/profile/edit',
      queryParameters: {
        'bio': bio,
        'address': address,
        'mobile': mobile,
      },
      // options: Options(contentType: Headers.formUrlEncodedContentType)
    );

    if (response.statusCode == 200) {
      // The request was successful, handle the response data here
      log('Profile edited successfully: ${response.data}');
    } else {
      // The server returned an error status code
      log('Failed to edit profile. Status code: ${response.statusCode}');
      log('Response data: ${response.data}');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  static Future<void> updateName({required String token, required name}) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.post(
      '${dioUrl}auth/user/update',
      data: {'name': name},
    );

    if (response.statusCode == 200) {
      // The request was successful, handle the response data here
      log('Profile edited successfully: ${response.data}');
    } else {
      // The server returned an error status code
      log('Failed to edit profile. Status code: ${response.statusCode}');
      log('Response data: ${response.data}');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  static Future<void> updatePassword(
      {required String token, required password}) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    final response = await _dio.post(
      '${dioUrl}auth/user/update',
      data: {'password': password},
    );

    if (response.statusCode == 200) {
      // The request was successful, handle the response data here
      log('Profile edited successfully: ${response.data}');
    } else {
      // The server returned an error status code
      log('Failed to edit profile. Status code: ${response.statusCode}');
      log('Response data: ${response.data}');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  static Future<void> addPortfolio(
      {required String token,
      required File cvFile,
      required File image}) async {
    _dio.options.headers['Authorization'] = 'Bearer $token';
    MultipartFile? cvFileMultipartFile;
    MultipartFile? imageFileMultipartFile;

    List<int> cvFileBytes = await cvFile.readAsBytes();
    List<int> imgFileBytes = await image.readAsBytes();

    cvFileMultipartFile = MultipartFile.fromBytes(cvFileBytes,
        filename: cvFile.path.split('/').last);
    imageFileMultipartFile = MultipartFile.fromBytes(imgFileBytes,
        filename: image.path.split('/').last);

    final response = await _dio.post(
      '${dioUrl}user/profile/portofolios',
      data: FormData.fromMap(
          {'cv_file': cvFileMultipartFile, 'image': imageFileMultipartFile}),
    );

    if (response.statusCode == 200) {
      // The request was successful, handle the response data here
      log('Profile edited successfully: ${response.data}');
    } else {
      // The server returned an error status code
      log('Failed to edit profile. Status code: ${response.statusCode}');
      log('Response data: ${response.data}');
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  static Future<dynamic> getPortfolios(String token) async {
    try {
      List savedModels = [];
      _dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await _dio.get('${dioUrl}user/profile/portofolios');
      var data = response.data['data']['portfolio'];
      log('$data');
      for (Map item in data) {
        savedModels.add(PortfolioModel.fromJson(item));
      }
      return savedModels;
    } catch (e) {
      log('error in remote request');
      return null;
    }
  }
}
