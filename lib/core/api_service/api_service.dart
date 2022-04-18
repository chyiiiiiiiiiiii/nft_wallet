import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../initialization.dart';
import '../error/exceptions.dart';
import 'cookie_jar_manager.dart';

enum Method { get, post, put, patch, delete, head }

typedef NormalCallback = void Function();
typedef ObjectCallback<T> = void Function(T t);
typedef ListCallback<T> = void Function(List<T> list);

typedef DecodeJsonCallback<T> = T Function(Map data);

class ApiService {
  late Dio _dio;
  late CancelToken cancelToken;

  final CookieJarManager cookieJarManager;

  ApiService({required this.cookieJarManager}) {
    setOptions();
    setHttpClientAdapter();
    setInterceptors();
  }

  Dio getDio() {
    return _dio;
  }

  void setOptions() {
    const String baseUrl = '';
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 * 1000,
      headers: {},
      responseType: ResponseType.json,
    );

    _dio = Dio(options);
  }

  void setHttpClientAdapter() {
    _dio.httpClientAdapter = Http2Adapter(
      ConnectionManager(
        idleTimeout: 10 * 1000,
        // Ignore bad certificate
        onClientCreate: (_, config) => config.onBadCertificate = (_) => true,
      ),
    );
  }

  Future<void> setInterceptors() async {
    // Cookie
    _dio.interceptors.add(CookieManager(await cookieJarManager.cookieJar));
    // Retry
    _dio.interceptors.add(RetryInterceptor(
      dio: _dio,
      logPrint: logger.d, // specify log function (optional)
      retries: 3, // retry count (optional)
      retryDelays: const [
        Duration(seconds: 1), // wait seconds before first retry
        Duration(seconds: 10),
        Duration(seconds: 30),
      ],
    ));
    //Log
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  String _getRequestMethod(Method method) {
    String m;
    switch (method) {
      case Method.get:
        m = "GET";
        break;
      case Method.post:
        m = "POST";
        break;
      case Method.put:
        m = "PUT";
        break;
      case Method.patch:
        m = "PATCH";
        break;
      case Method.delete:
        m = "DELETE";
        break;
      case Method.head:
        m = "HEAD";
        break;
    }
    return m;
  }

  Options _checkOptions(method, {Map<String, dynamic>? headers}) {
    Options options = Options();
    options.receiveTimeout = 20 * 1000;
    options.method = method;
    options.headers = headers;
    return options;
  }

  /// decode解析的時候，字串最外層必須是大括號包著，也就是物件，最外層不能直接使用[]陣列的形式
  Map<String, dynamic> _decodeJsonString(String data) {
    return json.decode(data);
  }

  ///-----------------------------------------------------------------
  /// 共用方法

  Future<Response> dioRequest(
    String method,
    String url, {
    FormData? formData,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    final Response response = await _dio.request(
      url,
      data: formData,
      queryParameters: queryParameters,
      options: _checkOptions(
        method,
        headers: headers,
      ),
      cancelToken: cancelToken,
    );
    return response;
  }

  //-----------------------------------------------------------------

  Future<void> _request(
    String method,
    String url, {
    FormData? postFormData,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await dioRequest(method, url,
          formData: postFormData, queryParameters: queryParameters, headers: headers, cancelToken: cancelToken);
      final int statusCode = response.statusCode ?? 0;

      if (statusCode == 200) {
        // String jsonString = response.toString();
        // Map<String, dynamic> data = _decodeJsonString(jsonString);
        // var result = BaseEntity.fromJson(data);
        // int code = result.code;
        // String message = result.message;

        // throw ServerException(errorCode: 1);
      } else {
        throw ServerException(errorCode: 999);
      }
    } catch (e) {
      throw ServerException(errorCode: 9999);
    }

    cancelToken?.cancel();
  }

  // Future<T?> _requestObject<T>(
  //   String method,
  //   String url, {
  //   FormData? postFormData,
  //   Map<String, dynamic>? queryParameters,
  //   Map<String, dynamic>? headers,
  //   CancelToken? cancelToken,
  // }) async {
  //   try {
  //     Response response = await dioRequest(method, url,
  //         formData: postFormData, queryParameters: queryParameters, headers: headers, cancelToken: cancelToken);

  //     final int statusCode = response.statusCode ?? 0;

  //     if (statusCode == 200) {
  //       // String jsonString = response.toString();
  //       // Map<String, dynamic> data = _decodeJsonString(jsonString);
  //       // var result = BaseEntity<T>.fromJson(data);
  //       // int code = result.code;
  //       // String message = result.message;

  //       // throw ServerException(errorCode: 1);
  //     } else {
  //       throw ServerException(errorCode: 999);
  //     }
  //   } catch (e) {
  //     throw ServerException(errorCode: 9999);
  //   }

  //   cancelToken?.cancel();
  //   return null;
  // }

  // Future<List<T>> _requestList<T>(
  //   String method,
  //   String url, {
  //   FormData? postFormData,
  //   Map<String, dynamic>? queryParameters,
  //   Map<String, dynamic>? headers,
  //   CancelToken? cancelToken,
  // }) async {
  //   try {
  //     Response response = await dioRequest(method, url,
  //         formData: postFormData, queryParameters: queryParameters, headers: headers, cancelToken: cancelToken);

  //     final int statusCode = response.statusCode ?? 0;

  //     if (statusCode == 200) {
  //       // String jsonString = response.toString();
  //       // Map<String, dynamic> data = _decodeJsonString(jsonString);
  //       // var result = BaseEntityWithList<T>.fromJson(data);
  //       // int code = result.code;
  //       // String message = result.message;

  //       // throw ServerException(errorCode: 1);
  //     } else {
  //       throw ServerException(errorCode: 999);
  //     }
  //   } catch (e) {
  //     throw ServerException(errorCode: 9999);
  //   }

  //   cancelToken?.cancel();
  //   return [];
  // }

  //-----------------------------------------------------------------

  Future request(
    Method method,
    String url, {
    FormData? postFormData,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    cancelToken = CancelToken();
    return await _request(
      _getRequestMethod(method),
      url,
      postFormData: postFormData,
      queryParameters: queryParameters,
      headers: headers,
      cancelToken: cancelToken,
    );
  }

  // Future<T?> requestObject<T>(
  //   Method method,
  //   String url, {
  //   FormData? postFormData,
  //   Map<String, dynamic>? queryParameters,
  //   Map<String, dynamic>? headers,
  // }) async {
  //   cancelToken = CancelToken();
  //   return await _requestObject<T>(
  //     _getRequestMethod(method),
  //     url,
  //     postFormData: postFormData,
  //     queryParameters: queryParameters,
  //     headers: headers,
  //     cancelToken: cancelToken,
  //   );
  // }

  // Future<List<T>> requestList<T>(
  //   Method method,
  //   String url, {
  //   FormData? postFormData,
  //   Map<String, dynamic>? queryParameters,
  //   Map<String, dynamic>? headers,
  // }) async {
  //   cancelToken = CancelToken();
  //   return await _requestList<T>(
  //     _getRequestMethod(method),
  //     url,
  //     postFormData: postFormData,
  //     queryParameters: queryParameters,
  //     headers: headers,
  //     cancelToken: cancelToken,
  //   );
  // }

  //-----------------------------------------------------------------

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests({CancelToken? token}) {
    token == null ? cancelToken.cancel("") : token.cancel("");
  }
}
