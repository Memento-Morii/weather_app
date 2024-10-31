import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/theme/text_theme.dart';
import 'package:weather_app/helpers/utils_helpers.dart';

import 'controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controller.searchController,
              ),
              const SizedBox(height: 20),
              controller.isLoading.isTrue
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : TextButton(
                      onPressed: () => controller.searchWeather(),
                      child: const Text('Search'),
                    ),
              const SizedBox(height: 20),
              if (controller.weather.value != null)
                Column(
                  children: <Widget>[
                    Text(
                      controller.weather.value?.temperatureInfo?.tempInCelsius
                              .toString() ??
                          "",
                      style: CustomTextTheme.headlineText1,
                    ),
                    Text(
                      controller.weather.value?.temperatureInfo?.condition?.name
                              .toString() ??
                          "",
                      style:
                          CustomTextTheme.boldText.copyWith(color: Colors.blue),
                    ),
                    Text(
                      UtilsHelpers.concatenateString(
                        [
                          controller.weather.value?.location?.name ?? "",
                          controller.weather.value?.location?.region ?? "",
                          controller.weather.value?.location?.country ?? ""
                        ],
                      ),
                      style: CustomTextTheme.normalText,
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
