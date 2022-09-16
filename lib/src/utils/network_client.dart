import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import 'global_constants.dart';

typedef GetUserAuthTokenCallback = Future<String?> Function();

class NetworkClient {
  static const contentTypeJson = 'application/json';

  final GetUserAuthTokenCallback _getUserAuthToken;
  final Dio _restClient;
  final Dio _fileClient;

  ///
  ///
  ///
  NetworkClient({
    required GetUserAuthTokenCallback getUserAuthToken,
  })  : _getUserAuthToken = getUserAuthToken,
        _restClient = _createDio(baseApiUrl),
        _fileClient = _createDio(baseApiUrl);

  ///
  ///
  ///
  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    bool? sendUserAuth,
  }) async {
    try {
      final resp = await _restClient.get(
        path,
        queryParameters: queryParameters,
        options: await _createDioOptions(
          contentType: contentTypeJson,
          sendUserAuth: sendUserAuth,
        ),
      );

      final jsonData = resp.data;
      return ApiResponse<T>.success(
        statusCode: resp.statusCode,
        rawData: jsonData,
      );
    } on DioError catch (e) {
      return _createResponse<T>(e);
    }
  }

  ///
  ///
  ///
  Future<ApiResponse<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool? sendUserAuth,
  }) async {
    try {
      final resp = await _restClient.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: await _createDioOptions(
          contentType: contentTypeJson,
          sendUserAuth: sendUserAuth,
        ),
      );

      final jsonData = resp.data;
      return ApiResponse<T>.success(
        statusCode: resp.statusCode,
        rawData: jsonData,
      );
    } on DioError catch (e) {
      return _createResponse<T>(e);
    }
  }

  ///
  ///
  ///
  Future<ApiResponse<T>> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool? sendUserAuth,
  }) async {
    try {
      final resp = await _restClient.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: await _createDioOptions(
          contentType: contentTypeJson,
          sendUserAuth: sendUserAuth,
        ),
      );

      final jsonData = resp.data;
      return ApiResponse<T>.success(
        statusCode: resp.statusCode,
        rawData: jsonData,
      );
    } on DioError catch (e) {
      return _createResponse<T>(e);
    }
  }

  ///
  ///
  ///
  Future<ApiResponse<T>> patch<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool? sendUserAuth,
  }) async {
    try {
      final resp = await _restClient.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: await _createDioOptions(
          contentType: contentTypeJson,
          sendUserAuth: sendUserAuth,
        ),
      );

      final jsonData = resp.data;
      return ApiResponse<T>.success(
        statusCode: resp.statusCode,
        rawData: jsonData,
      );
    } on DioError catch (e) {
      return _createResponse<T>(e);
    }
  }

  ///
  ///
  ///
  Future<ApiResponse<T>> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool? sendUserAuth,
  }) async {
    try {
      final resp = await _restClient.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: await _createDioOptions(
          contentType: contentTypeJson,
          sendUserAuth: sendUserAuth,
        ),
      );

      final jsonData = resp.data;
      return ApiResponse<T>.success(
        statusCode: resp.statusCode,
        rawData: jsonData,
      );
    } on DioError catch (e) {
      return _createResponse<T>(e);
    }
  }

  ///
  ///
  ///
  Future<ApiResponse<T>> upload<T>(
    String path, {
    required File file,
    bool? sendUserAuth,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(file.path),
      });

      final resp = await _fileClient.post(
        path,
        data: formData,
        options: await _createDioOptions(
          contentType: contentTypeJson,
          sendUserAuth: sendUserAuth,
        ),
      );

      final jsonData = resp.data;
      return ApiResponse<T>.success(
        statusCode: resp.statusCode,
        rawData: jsonData,
      );
    } on DioError catch (e) {
      return _createResponse<T>(e);
    }
  }

  ///
  ///
  ///
  ApiResponse<T> _createResponse<T>(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Failed to connected to server',
        );
      case DioErrorType.sendTimeout:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Failed to connected to server',
        );
      case DioErrorType.receiveTimeout:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Server not responding',
        );
      case DioErrorType.response:
        final jsonResp = error.response!.data;
        final errorStr = jsonResp['error'] as String;
        final message = jsonResp['message'] as String;
        return ApiResponse<T>.error(
          statusCode: error.response?.statusCode,
          error: errorStr,
          message: message,
        );
      case DioErrorType.cancel:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Request canceled',
        );
      case DioErrorType.other:
        return ApiResponse<T>.error(
          statusCode: 500,
          message: 'Something went wrong, try again later',
        );
    }
  }

  ///
  ///
  ///
  Future<Options> _createDioOptions({
    required String contentType,
    bool? sendUserAuth,
  }) async {
    final headers = <String, String>{};
    if (sendUserAuth != null && sendUserAuth == true) {
      final authToken = await _getUserAuthToken();
      if (authToken != null) {
        headers['authorization'] = authToken;
      }
    }

    final options = Options(
      headers: headers,
      contentType: contentType,
    );
    return options;
  }

  ///
  ///
  ///
  static Dio _createDio(String baseUrl) {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
    );
    final dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
        requestHeader: false,
        responseBody: true,
        requestBody: true,
        logPrint: (message) {
          log(message.toString());
        }));
    return dio;
  }
}

class ApiResponse<T> {
  final dynamic rawData;
  final int? statusCode;
  final String? error;
  final String? message;
  final T? data;
  final bool _isSuccess;

  ApiResponse({
    this.rawData,
    this.data,
    this.statusCode,
    this.error,
    this.message,
    required bool isSuccess,
  }) : _isSuccess = isSuccess;

  ///
  ///
  ///
  ApiResponse.success({
    this.rawData,
    this.data,
    this.statusCode,
  })  : _isSuccess = true,
        error = null,
        message = null;

  ///
  ///
  ///
  ApiResponse.error({
    this.statusCode,
    this.error,
    this.message,
  })  : _isSuccess = false,
        data = null,
        rawData = null;

  ApiResponse<T> copyWith({
    dynamic rawData,
    int? statusCode,
    String? error,
    String? message,
    T? data,
  }) {
    return ApiResponse<T>(
      rawData: rawData ?? this.rawData,
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
      error: error ?? this.error,
      message: message ?? this.message,
      isSuccess: _isSuccess,
    );
  }

  bool get isSuccess => _isSuccess;

  @override
  String toString() {
    return 'status: ${_isSuccess ? 'success' : 'failed'}, message: ${message ?? ''}';
  }
}
