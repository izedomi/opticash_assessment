import 'dart:async';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:opticash/app/vm/home_vm.dart';
import '../../../main.dart';
import '../../models/api_response.dart';
import '../../utils/print.dart';
import '../../utils/storage_keys.dart';
import '../storage_service.dart';
import 'dio_response_handler.dart';

class AppInterceptors extends QueuedInterceptorsWrapper {
  Dio dio = Dio();
  CancelToken cancelToken = CancelToken();
  bool isTrustedDevice = true;

  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await StorageService.getAccessToken();
    printty("base url:===> ${options.baseUrl}");
    printty("url path:===> ${options.path}");

    printty("url headers:===> ${options.headers.toString()}");
    printty(token.toString());

    if (token == null) {
      handler.reject(DioException(requestOptions: options));
      logout();
      return;
    }
    options.headers.addAll({"authorization": "Bearer $token"});
    handler.next(options);
    //return super.onRequest(options, handler);
  }

  @override
  FutureOr<dynamic> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }

  @override
  FutureOr<dynamic> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    ApiResponse res = DioResponseHandler.dioErrorHandler(err);

    if (res.code == 401) {
      logout();
      return handler.reject(DioException(
          message: res.message,
          type: DioExceptionType.badResponse,
          requestOptions: err.requestOptions,
          response: Response(
            statusCode: 409,
            requestOptions: err.requestOptions,
          )));
    }

    return handler.next(err);
  }

  Future<void> logout() async {
    Provider.of<UserVM>(navigatorKey.currentContext!, listen: false).logout();
  }
}
