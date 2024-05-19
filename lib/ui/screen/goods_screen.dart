import 'package:fan_app/models/teacher_goods_model.dart';
import 'package:fan_app/ui/widget/navbar.dart';
import 'package:fan_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GoodsScreen extends StatefulWidget {
  const GoodsScreen({super.key});

  @override
  State<GoodsScreen> createState() => _GoodsScreenState();
}

class _GoodsScreenState extends State<GoodsScreen> {
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
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 0.9.sw,
                  margin: EdgeInsets.only(top: 10.0.h),
                  child: Text(
                    "굿즈샵 쇼핑하기",
                    style: TextStyle(
                      color: MainColors.primary,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                // GridView.builder를 사용하기 전에 Container로 감싸고, 높이를 지정해줍니다.
                SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true, // 추가
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10, // 가로 간격
                      mainAxisSpacing: 10, // 세로 간격
                    ),
                    itemCount: goods.length, // 아이템의 총 개수
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          print("${index + 1}번째 사진");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(goods[index]["image"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 100.w,
                                color: Colors.white.withOpacity(
                                  0.9,
                                ), // 텍스트 배경을 약간 어둡게 하여 가독성 향상
                                child: Column(
                                  children: [
                                    Text(
                                      goods[index]["name"] ?? "",
                                      style: const TextStyle(
                                        color: MainColors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      "#${goods[index]["teacher"]}",
                                      style: const TextStyle(
                                        color: MainColors.primary,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 5.0),
                                    Text(
                                      "${goods[index]["price"].toString()}p",
                                      style: const TextStyle(
                                        color: MainColors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
