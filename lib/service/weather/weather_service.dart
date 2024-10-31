import '../../data/weather_model/weather_model.dart';

abstract class WeatherService {
  Future<WeatherModel> getWeatherInfo({required String query});
}
