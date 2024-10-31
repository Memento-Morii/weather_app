import 'package:get/get.dart';

import '../../data/apis.dart';
import '../../data/weather_model/weather_model.dart';
import '../http/http_service_impl.dart';
import 'weather_service.dart';

class WeatherServiceImpl extends WeatherService {
  final HttpServiceImpl httpService = Get.find<HttpServiceImpl>();
  @override
  Future<WeatherModel> getWeatherInfo({required String query}) async {
    try {
      final response = await httpService.getRequest(
        Apis.getWeather,
        {
          "q": query,
          "key": "e06f576e1e734a3b83f115725243110",
        },
      );
      return WeatherModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
