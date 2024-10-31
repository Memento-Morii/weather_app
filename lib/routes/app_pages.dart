import 'package:get/get.dart';
import 'package:weather_app/views/home/bindings/home_binding.dart';
import 'package:weather_app/views/home/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
