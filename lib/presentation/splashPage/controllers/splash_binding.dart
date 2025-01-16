import 'package:get/get.dart';
import 'package:taskgithub/presentation/splashPage/controllers/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}