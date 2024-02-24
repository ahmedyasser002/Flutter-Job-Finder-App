import 'package:dio/dio.dart';

class DioHelper {
  static Dio? _dio;
  static const String apiUrl = 'https://project2.amit-learning.com/api/';

  static Dio get dio {
    _dio ??= Dio();
    return _dio!;
  }
}
