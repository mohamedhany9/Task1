import 'package:get/get.dart';
import 'package:taskgithub/routes/app_pages.dart';


class SplashController extends GetxController {

  @override
  void onInit() {

    Future.delayed(const Duration(seconds: 3), () {
        Get.toNamed(Routes.home);
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
