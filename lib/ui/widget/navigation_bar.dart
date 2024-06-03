import 'package:fan_app/provider/bottom_navigation_provider.dart';
import 'package:fan_app/ui/screens/board_screen.dart';
import 'package:fan_app/ui/screens/goods_screen.dart';
import 'package:fan_app/ui/screens/main_screen.dart';
import 'package:fan_app/ui/screens/my_page_screen.dart';
import 'package:fan_app/ui/screens/schedule_screen.dart';
import 'package:flutter/material.dart';

Widget navigationBody(BottomNavigationProvider provider) {
  // 페이지별로 다른 화면을 보여줌
  return provider.currentPage == 0
      ? const SafeArea(
          child: Center(
            child: MainScreen(),
          ),
        )
      : provider.currentPage == 1
          ? const SafeArea(
              child: BoardScreen(),
            )
          : provider.currentPage == 2
              ? const SafeArea(
                  child: Center(
                    child: GoodsScreen(),
                  ),
                )
              : provider.currentPage == 3
                  ? const SafeArea(
                      child: Center(
                        child: ScheduleScreen(),
                      ),
                    )
                  : const SafeArea(
                      child: Center(
                        child: MyPageScreen(),
                      ),
                    );
}
