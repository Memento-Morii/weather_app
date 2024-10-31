import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:weather_app/service/weather/weather_service_impl.dart';
import 'http/http_service.dart';
import 'http/http_service_impl.dart';

class MainServices extends GetxService {
  late HttpService _httpServiceImpl;

  @override
  void onInit() async {
    initializeHttpService();
    initializeWeatherService();
    super.onInit();
  }

  initializeHttpService() {
    Get.put(HttpServiceImpl(Dio()), permanent: true);
    _httpServiceImpl = Get.find<HttpServiceImpl>();
    _httpServiceImpl.init();
  }

  initializeWeatherService() async {
    Get.put(WeatherServiceImpl());
  }
}
