import 'package:dio/dio.dart';
import 'package:espace_client/widgets/LoginPage/core/Api/ApiInspector.dart';
import 'package:espace_client/widgets/LoginPage/core/Api/EndPoint.dart';
import 'package:espace_client/widgets/LoginPage/core/Errors/exceptions.dart';

class DioConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return response;
    } on DioException catch (e) {
      print("---!!!!!!!!---");
      print(e.response?.statusCode);
      print(e.message);
      print(e.type);
      print(e.response?.data);
      print("---!!!!!!!!---");
      handleDioExceptions(e);
      return e.response?.data;
    }
  }
}
