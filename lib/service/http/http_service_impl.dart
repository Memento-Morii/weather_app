import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '/common/config/http_config.dart';
import 'http_service.dart';

final String baseUrl = HttpConfig.apiBaseUrl;

class HttpServiceImpl implements HttpService {
  late Dio dio;

  HttpServiceImpl(this.dio);

  @override
  void init() async {
    final clientType = Platform.isAndroid
        ? "Android"
        : Platform.isIOS
            ? "IOS"
            : "";

    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout:
            const Duration(seconds: HttpConfig.defaultConnectionTimeOut),
        receiveTimeout: const Duration(
          seconds: HttpConfig.defaultReceiveTimeOut,
        ),
        headers: {
          "Client-Type": clientType,
        },
      ),
    );

    // dio.interceptors.add(
    //   RetryOnConnectionChangeInterceptor(
    //     requestRetrier: DioConnectivityRequestRetrier(
    //       dio: dio,
    //       connectivity: Connectivity(),
    //     ),
    //   ),
    // );
  }

  @override
  Future<Response> getRequest(String urlPath, Map<String, dynamic> data) async {
    Response response;
    const _extra = <String, dynamic>{};
    final queryParameters = data;
    print(urlPath);
    try {
      response = await dio.get(
        urlPath,
        queryParameters: queryParameters,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void fireAndForgetGetRequest(String urlPath, Map<String, dynamic> data) {
    const _extra = <String, dynamic>{};
    final queryParameters = data;
    try {
      dio.get(
        urlPath,
        queryParameters: queryParameters,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> postRequest(
    String urlPath,
    Map<String, dynamic> data, [
    latencySensitive = true,
    Map<String, dynamic>? queryParams,
  ]) async {
    Response response;
    const _extra = <String, dynamic>{};
    try {
      if (latencySensitive) {
        dio.options.receiveTimeout =
            const Duration(seconds: HttpConfig.defaultReceiveTimeOut);
        dio.options.connectTimeout =
            const Duration(seconds: HttpConfig.defaultConnectionTimeOut);
      } else {
        dio.options.receiveTimeout =
            const Duration(seconds: HttpConfig.longReceiveTimeOut);
        dio.options.connectTimeout =
            const Duration(seconds: HttpConfig.longConnectionTimeOut);
      }
      response = await dio.post(
        urlPath,
        data: data,
        queryParameters: queryParams,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void fireAndForgetPostRequest(String urlPath, Map<String, dynamic> data) {
    const _extra = <String, dynamic>{};
    try {
      dio.post(
        urlPath,
        data: data,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> putRequestFullUrl(
      String baseUrl, String urlPath, File data) async {
    const extra = <String, dynamic>{};
    Response response;

    try {
      final imageFile = data.openRead();
      Dio dio = Dio(BaseOptions(baseUrl: baseUrl));
      response = await dio.put(
        urlPath,
        data: data.openRead(),
        options: Options(extra: extra, headers: {
          'Content-Type': "image/jpeg",
          "Origin": "*",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "*",
        }),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
