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
  List<Map<String, String>> somaGOD = [
    {"image": "", "name": "최병준 선생님"},
    {"image": "", "name": "차수민 선생님"},
    {"image": "", "name": "박제현 선생님"},
    {"image": "", "name": "박건우 선생님"},
  ];

  List<Map<String, String>> somaSES = [
    {"image": "", "name": "박민하 선생님"},
    {"image": "", "name": "이정하 선생님"},
    {"image": "", "name": "김상화 선생님"},
  ];

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
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 1.0.sw,
                      // decoration: const BoxDecoration(
                      //   color: MainColors.grey,
                      // ),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: MainColors.grey,
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.05.sw,
                              vertical: 0.02.sh,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "소마고 GOD",
                                  style: MainTextStyle.bold_20,
                                ),
                                Text(
                                  "자세히 보기 〉",
                                  style: MainTextStyle.bold_12,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: somaGOD
                                  .map((entry) => Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 0.01.sh,
                                          horizontal: 0.02.sh,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.person,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ), // 아이콘과 텍스트 사이의 가로 간격 조정
                                            Text(
                                              entry["name"] ?? "",
                                            ), // 텍스트를 아이콘 오른쪽으로 배치
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: MainColors.grey,
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.05.sw,
                              vertical: 0.02.sh,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "소마고 SES",
                                  style: MainTextStyle.bold_20,
                                ),
                                Text(
                                  "자세히 보기 〉",
                                  style: MainTextStyle.bold_12,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: somaSES
                                  .map((entry) => Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 0.01.sh,
                                          horizontal: 0.02.sh,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.person,
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ), // 아이콘과 텍스트 사이의 가로 간격 조정
                                            Text(
                                              entry["name"] ?? "",
                                            ), // 텍스트를 아이콘 오른쪽으로 배치
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
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
