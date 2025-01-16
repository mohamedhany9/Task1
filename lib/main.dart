import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskgithub/presentation/homePage/controllers/home_binding.dart';
import 'package:taskgithub/routes/app_pages.dart';

void main() async{
  // await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        rebuildFactor: (old, data) => true,
        builder: (context, child) {
          return  GetMaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: AppPages.initial,
                getPages: AppPages.routes,
                initialBinding: HomeBindings(),
              );
        });
  }
}

