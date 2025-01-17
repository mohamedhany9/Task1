import 'package:get/get.dart';
import 'package:taskgithub/presentation/homePage/controllers/home_binding.dart';
import 'package:taskgithub/presentation/homePage/views/home_page.dart';
import 'package:taskgithub/presentation/splashPage/controllers/splash_binding.dart';
import 'package:taskgithub/presentation/splashPage/views/splash_page.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [

    GetPage(
      name: _Paths.splash,
      page: () => const SplashScreen(),
      bindings: [
        SplashBindings(),
      ],
    ),

    GetPage(
      name: _Paths.home,
      page: () =>  const HomeScreen(),
      bindings: [
        HomeBindings(),
      ],
    ),
  ];
}