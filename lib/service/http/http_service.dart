import 'dart:io';

import 'package:dio/dio.dart';

abstract class HttpService {
  void init();

  Future<Response> getRequest(String urlPath, Map<String, dynamic> data);

  void fireAndForgetGetRequest(String urlPath, Map<String, dynamic> data);

  Future<Response> postRequest(String urlPath, Map<String, dynamic> data);

  void fireAndForgetPostRequest(String urlPath, Map<String, dynamic> data);
  Future<Response> putRequestFullUrl(
    String baseUrl,
    String urlPath,
    File data,
  );
}
