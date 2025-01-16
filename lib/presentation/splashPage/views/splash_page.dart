
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskgithub/core/styles/styles_manager.dart';
import 'package:taskgithub/core/values/app_colors.dart';
import 'package:taskgithub/presentation/splashPage/controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.obs;
    return Scaffold(
      backgroundColor: ThemeColors.appColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Center(child:
          Text("Test App",style: AppTextStyle.sfBold.copyWith(fontSize: 40.sp,color: ThemeColors.whiteColor),))),
          Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text("Unknown App - All Copyrights.",style: AppTextStyle.sfRegular.copyWith(fontSize: 16.sp,color: ThemeColors.whiteColor),)),

        ],
      ),
    );
  }
}
