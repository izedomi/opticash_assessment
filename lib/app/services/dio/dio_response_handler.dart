import 'package:dio/dio.dart';
import '../../models/api_response.dart';
import '../../utils/app_text.dart';
import '../../utils/print.dart';

class DioResponseHandler {
  static ApiResponse parseResponse(Response res) {
    printty("Response Code: ${res.statusCode}");
    printty("Response Body: ${res.data}");

    try {
      late dynamic response = res.data;

      if (res.statusCode == 200 ||
          res.statusCode == 201 ||
          res.statusCode == 202) {
        try {
          return ApiResponse(
              code: res.statusCode,
              success: true,
              message: response["message"].toString(),
              data: response ?? "Success");
        } catch (e) {
          printty(e.toString());
          return ApiResponse(
            code: res.statusCode,
            success: false,
            message: e.toString(),
          );
        }
      } else if (res.statusCode == 422) {
        return _parseBadRequestError(response);
      } else if (res.statusCode! >= 400 || res.statusCode! <= 404) {
        return ApiResponse(
            code: res.statusCode,
            success: false,
            message: response["message"] ?? AppText.errorMsg);
      } else {
        return ApiResponse(
            code: res.statusCode, success: false, message: response["message"]);
      }
    } catch (e) {
      return ApiResponse(
          code: res.statusCode, success: false, message: AppText.errorMsg);
    }
  }

  static ApiResponse dioErrorHandler(DioException e) {
    final dioError = e;

    switch (dioError.type) {
      case DioExceptionType.badResponse:
        printty("error code: ${dioError.response!.statusCode}");
        printty("error data: ${dioError.response!.data}");

        try {
          if (dioError.response!.statusCode == 422 ||
              dioError.response!.statusCode == 417) {
            return _parseBadRequestError(dioError.response);
          }

          printty(dioError.response!.data["message"]);
          return ApiResponse(
              code: dioError.response?.statusCode,
              success: false,
              message: dioError.response!.data["message"] ??
                  dioError.message ??
                  dioError.response?.statusMessage ??
                  AppText.errorMsg);
        } catch (e) {
          return ApiResponse(
              code: dioError.response!.statusCode,
              success: false,
              message: AppText.errorMsg);
        }

      case DioExceptionType.cancel:
        printty("1");
        return ApiResponse(
            code: 500, success: false, message: AppText.errorMsg);
      case DioExceptionType.connectionTimeout:
        printty("2");
        return ApiResponse(
            code: 500, success: false, message: "Connection Timed Out");
      case DioExceptionType.unknown:
        printty("3");
        return ApiResponse(
            code: 500, success: false, message: AppText.errorMsg);
      case DioExceptionType.sendTimeout:
        printty("4");
        return ApiResponse(
            code: 500, success: false, message: "Sender Connection Timed Out");
      case DioExceptionType.receiveTimeout:
        printty("5");
        return ApiResponse(
            code: 500,
            success: false,
            message: "Reciever Connection Timed Out");
      default:
        return ApiResponse(
            code: 500, success: false, message: AppText.errorMsg);
    }
  }

  static ApiResponse _parseBadRequestError(dynamic response) {
    String? error;
    try {
      // if (response["message"]
      //     .toString()
      //     .toLowerCase()
      //     .contains("more error".toString().toLowerCase())) {
      //   if (response["errors"] != null) {
      //     for (var v in response["errors"].values) {
      //       if (error == null || error.isEmpty) {
      //         error = v[0].toString();
      //       } else {
      //         error += "\n + ${v[0]}";
      //       }
      //     }
      //   }
      // }

      if (response.data["errors"] != null) {
        for (var v in response.data["errors"].values) {
          if (error == null || error.isEmpty) {
            error = v[0].toString();
          } else {
            error += "\n + ${v[0]}";
          }
        }
      }
    } catch (e) {
      error = e.toString();
    }
    return ApiResponse(success: false, message: error ?? response["message"]);
  }
}
