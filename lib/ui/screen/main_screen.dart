import 'package:fan_app/ui/widget/navbar.dart';
import 'package:fan_app/utils/colors/colors.dart';
import 'package:fan_app/utils/fonts/main_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: navBar(
          onPress: () => Get.offAndToNamed("/"),
          icon: Icons.arrow_back_ios_new_rounded,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 1.0.sw,
                height: 0.24.sh,
                decoration: const BoxDecoration(
                  color: MainColors.primary,
                ),
                child: const Center(
                  child: Text(
                    "자동 슬라이스 배너",
                    style: MainTextStyle.bold_40,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  height: 0.24.sh,
                  decoration: const BoxDecoration(
                    color: MainColors.grey,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 0.05.sw,
                          vertical: 0.02.sh,
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Title",
                              style: MainTextStyle.bold_20,
                            ),
                            Text(
                              "자세히 보기 〉",
                              style: MainTextStyle.bold_20,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 0.2.sw,
                                height: 0.1.sh,
                                decoration: BoxDecoration(
                                  color: MainColors.primary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.r),
                                  ),
                                ),
                              ),
                              Container(
                                width: 0.2.sw,
                                height: 0.1.sh,
                                decoration: BoxDecoration(
                                  color: MainColors.primary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.r),
                                  ),
                                ),
                              ),
                              Container(
                                width: 0.2.sw,
                                height: 0.1.sh,
                                decoration: BoxDecoration(
                                  color: MainColors.primary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.r),
                                  ),
                                ),
                              ),
                              Container(
                                width: 0.2.sw,
                                height: 0.1.sh,
                                decoration: BoxDecoration(
                                  color: MainColors.primary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.r),
                                  ),
                                ),
                              ),
                              Container(
                                width: 0.2.sw,
                                height: 0.1.sh,
                                decoration: BoxDecoration(
                                  color: MainColors.primary,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.r),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
