import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/data/error_model/error_model.dart';
import 'package:weather_app/data/weather_model/weather_model.dart';
import 'package:weather_app/service/weather/weather_service.dart';
import 'package:weather_app/service/weather/weather_service_impl.dart';

import '../../../helpers/dialog_helpers.dart';
import '../../../service/dio_exceptions.dart';

class HomeController extends GetxController {
  WeatherService weatherService = Get.find<WeatherServiceImpl>();
  late TextEditingController searchController;
  final isLoading = false.obs;
  Rx<WeatherModel?> weather = Rx<WeatherModel?>(null);

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  void searchWeather() async {
    if (searchController.text.isEmpty) {
      return;
    }
    isLoading(true);
    try {
      final response = await weatherService.getWeatherInfo(
        query: searchController.text.trim(),
      );
      weather.value = response;
    } on DioException catch (e) {
      final errResponse = ErrorModel.fromJson(e.response!.data["error"]);
      DialogHelpers.getInstance()!.showSnackBarGetx(
          errResponse.message ?? "Something Went Wrong", ResponseMessage.error);
    } catch (e) {
      inspect(e);
      DialogHelpers.getInstance()!
          .showSnackBarGetx("Something Went Wtong", ResponseMessage.error);
    } finally {
      isLoading(false);
    }
  }
}
