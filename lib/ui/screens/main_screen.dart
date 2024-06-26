import 'package:fan_app/models/teacher_goods_model.dart';
import 'package:fan_app/models/teacher_list_model.dart';
import 'package:fan_app/ui/widget/goods_list.dart';
import 'package:fan_app/ui/widget/navbar.dart';
import 'package:fan_app/ui/widget/teacher_list.dart';
import 'package:fan_app/utils/colors/colors.dart';
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
  bool isLoggined = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: navBar(
          onPress: () => Get.offAndToNamed("/login"),
          icon: isLoggined ? Icons.people : Icons.login_rounded,
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
                child: Center(
                  child: Image.asset(
                    width: 1.0.sw,
                    "assets/images/logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 1.0.sw,
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.05.sw,
                              vertical: 0.02.sh,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "부소마 샤이니",
                                  style: TextStyle(
                                    color: MainColors.primary,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Noto_Sans_KR",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "자세히 보기 〉",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: MainColors.primary,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Noto_Sans_KR",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          teacherList(somaShiny),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.05.sw,
                              vertical: 0.02.sh,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "부소마 뉴진스",
                                  style: TextStyle(
                                    color: MainColors.primary,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Noto_Sans_KR",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "자세히 보기 〉",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: MainColors.primary,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Noto_Sans_KR",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          teacherList(somaNewJeans),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.05.sw,
                              vertical: 0.02.sh,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "굿즈",
                                  style: TextStyle(
                                    color: MainColors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Noto_Sans_KR",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "자세히 보기 〉",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: MainColors.black,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Noto_Sans_KR",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          goodsList(goods),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
