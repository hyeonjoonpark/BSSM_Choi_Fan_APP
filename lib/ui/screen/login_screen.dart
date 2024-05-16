import 'package:fan_app/ui/widget/navbar.dart';
import 'package:fan_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoggined = true;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: navBar(
          onPress: () {
            Get.offAndToNamed("/");
          },
          icon: Icons.arrow_back_ios_new,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 0.9.sw,
                    margin: EdgeInsets.only(top: 0.27.sh),
                    child: Text(
                      "로그인하기",
                      style: TextStyle(
                        color: MainColors.primary,
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                    width: 0.9.sw,
                    margin: EdgeInsets.only(top: 10.0.h),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "이메일을 입력해주세요",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.9.sw,
                    margin: EdgeInsets.only(top: 10.0.h),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "비밀번호를 입력해주세요",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.9.sw,
                    margin: EdgeInsets.only(top: 10.0.h),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isLoggined = true;
                        });
                        Get.offAndToNamed("/");
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MainColors.primary,
                        ),
                        elevation: MaterialStateProperty.all(0.0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        "로그인",
                        style: TextStyle(
                          color: MainColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
