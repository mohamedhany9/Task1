import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:taskgithub/core/styles/styles_manager.dart';
import 'package:taskgithub/core/values/app_colors.dart';
import 'package:taskgithub/presentation/homePage/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
   HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.obs;
    final List<Widget> imageSliders = controller.imgList.value!
        .map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: ThemeColors.appColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Row(
              children: <Widget>[
                Image.asset('assets/images/Rectangle1.png', fit: BoxFit.cover, width: 50.0),
                SizedBox(width: 20.w,),
                Text(
                  item.name,
                  style: AppTextStyle.sfRegular.copyWith(
                      fontSize: 16.sp, color: ThemeColors.blackColor),
                ),
              ],
            )),
      ),
    ))
        .toList();
    return Scaffold(
      backgroundColor: ThemeColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text("Repos",style: AppTextStyle.sfRegular.copyWith(fontSize: 20.sp,color: ThemeColors.blackColor),)),
              SizedBox(height: 10.h,),

              CarouselSlider(
                options: CarouselOptions(
                  height: 100.h,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                ),
                items: imageSliders,
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Git Repo",style: AppTextStyle.sfSemiBold.copyWith(fontSize: 20.sp,color: ThemeColors.blackColor),),
                    SizedBox(height: 10.h,),
                    ListView.builder(
                        itemCount: controller.services.value!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        margin: EdgeInsets.only(
                            bottom: 16.h),
                        decoration: BoxDecoration(
                          color: ThemeColors.appColor,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset('assets/images/Rectangle1.png',
                                height: 40.h,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              controller.services.value![index].name,
                              style: AppTextStyle.sfRegular.copyWith(
                                  fontSize: 16.sp, color: ThemeColors.blackColor),
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
