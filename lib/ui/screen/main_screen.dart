import 'package:fan_app/ui/widget/navbar.dart';
import 'package:fan_app/ui/widget/teacher_list.dart';
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
    {
      "image":
          "https://i.namu.wiki/i/ZnBMAAGJaiFKqDmASXCt-977Xuq6gLA-G8AsD4K1BKCVBEzrjISoW9QyfcSKPnacwuBpCGSSyBtCJv8E-UocNQ.webp",
      "name": "최병준 선생님"
    },
    {
      "image":
          "https://img.sbs.co.kr/newsnet/etv/upload/2022/02/15/30000743641_1280.jpg",
      "name": "차수민 선생님"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsJILP5EjF59E4CwEcnqaAjiLaE2Yn2ibPpeWxjdLFOw&s",
      "name": "박제현 선생님"
    },
    {
      "image":
          "https://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2022/03/21/d073425d-9762-4c03-b203-814838f33327.jpg",
      "name": "박건우 선생님"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYXG4f-9uDgL2LsGuP-o_LLPlmgTgX_UQIj451D-3p9w&s",
      "name": "이세준 선생님"
    },
  ];

  List<Map<String, String>> somaNewJeans = [
    {
      "image":
          "https://www.yeongnam.com/mnt/file/202311/20231121001110427_1.jpg",
      "name": "박민하 선생님"
    },
    {
      "image": "https://i.ytimg.com/vi/LcS-451yDxI/maxresdefault.jpg",
      "name": "이정하 선생님"
    },
    {
      "image": "https://i.ytimg.com/vi/k3jV6DMTCSE/maxresdefault.jpg",
      "name": "김상화 선생님"
    },
    {
      "image": "https://i.ytimg.com/vi/SiDYYqj9Knk/maxresdefault.jpg",
      "name": "진예빈 선생님"
    },
    {
      "image": "https://i.ytimg.com/vi/hWCOlJOySog/maxresdefault.jpg",
      "name": "이나영 선생님"
    },
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
                            // decoration: const BoxDecoration(
                            //   color: MainColors.grey,
                            // ),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.05.sw,
                              vertical: 0.02.sh,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "부소마 GOD",
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
                          list(somaGOD),
                          SizedBox(
                            height: 0.02.sh,
                          ),
                          Container(
                            // decoration: const BoxDecoration(
                            //   color: MainColors.grey,
                            // ),
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.05.sw,
                              vertical: 0.02.sh,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "부소마 뉴진스",
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
                          list(somaNewJeans),
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
