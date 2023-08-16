import 'dart:async';
import 'package:dio/dio.dart';
import '../../../env/env.dart';
import '../../models/api_response.dart';
import '../../utils/print.dart';
import '../storage_service.dart';
import 'app_interceptor.dart';
import 'dio_response_handler.dart';

class DioApiService {
  int timeOutDurationInSeconds = 30;
  int connectionTimeout = 6000;
  AppInterceptors appInterceptors;
  late Dio dio;

  var options = BaseOptions(
    baseUrl: Env().config.baseUrl,
    connectTimeout: const Duration(seconds: 6000),
    receiveTimeout: const Duration(seconds: 3000),
  );

  DioApiService({required this.appInterceptors}) {
    dio = Dio(options);
    dio.interceptors.add(appInterceptors);
    Map<String, dynamic> headers = {'Accept': 'application/json'};
    dio.options.headers = headers;
  }

  Future<ApiResponse> post(
      {required Map<String, dynamic> body,
      required var url,
      Map<String, dynamic>? headers}) async {
    try {
      var options = BaseOptions();
      options.baseUrl = Env().config.baseUrl;
      if (headers != null && headers.isNotEmpty) {
        options.headers.addAll(headers);
      }

      Response response = await Dio(options)
          .post(url, data: body)
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      return DioResponseHandler.parseResponse(response);
    } on DioException catch (e) {
      printty(e.toString());
      return DioResponseHandler.dioErrorHandler(e);
    }
  }

  Future<ApiResponse> get({required String url}) async {
    try {
      var options = BaseOptions();
      //options.baseUrl = Env().config.baseUrl;
      // options.headers = await getDeviceHeaders();
      Response response = await Dio(options)
          .get(url)
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      return DioResponseHandler.parseResponse(response);
    } on DioException catch (e) {
      return DioResponseHandler.dioErrorHandler(e);
    }
  }

  Future<ApiResponse> put(
      {required Map<String, dynamic> body, required var url}) async {
    try {
      //await HeaderService().getDeviceInfo();
      var options = BaseOptions();
      // options.baseUrl = Env().config.baseUrl;
      //options.headers = await getDeviceHeaders();
      Response response = await Dio(options)
          .put(url, data: FormData.fromMap(body))
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      return DioResponseHandler.parseResponse(response);
    } on DioException catch (e) {
      return DioResponseHandler.dioErrorHandler(e);
    }
  }

  Future<ApiResponse> postWithAuth(
      {var body,
      required var url,
      bool canRetry = true,
      String? contentType}) async {
    try {
      // await HeaderService().getDeviceInfo();
      // dio.options.headers.addAll(await getDeviceHeaders());

      if (contentType != null) {
        dio.options.contentType = contentType;
      }

      dynamic data = body;
      if (body != null) {
        data = FormData.fromMap(body);
      }

      Response response = await dio
          .post(url, data: contentType == null ? data : body)
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      return DioResponseHandler.parseResponse(response);
    } on DioException catch (e) {
      // printty(e.toString());
      // printty(s.toString());
      return DioResponseHandler.dioErrorHandler(e);
    } catch (e) {
      // printty("flsjfklskf: $e");
      return ApiResponse(success: false);
    }
  }

  Future<ApiResponse> getWithAuth(
      {var body, required var url, bool canRetry = true}) async {
    try {
      // await HeaderService().getDeviceInfo();
      //dio.options.headers.addAll(await getDeviceHeaders());
      Response response = await dio
          .get(url)
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      return DioResponseHandler.parseResponse(response);
    } on DioException catch (e) {
      return DioResponseHandler.dioErrorHandler(e);
    }
  }

  Future<ApiResponse> logout() async {
    await StorageService.reset();
    return ApiResponse(
        code: 401, success: false, message: "Unauthorized. Access denied!!!");
  }
}

DioApiService apiService = DioApiService(appInterceptors: AppInterceptors());
