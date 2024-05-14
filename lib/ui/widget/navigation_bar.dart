import 'package:fan_app/provider/bottom_navigation_provider.dart';
import 'package:fan_app/ui/screen/board_screen.dart';
import 'package:fan_app/ui/screen/main_screen.dart';
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
                    child: Text("Menu 3"),
                  ),
                )
              : provider.currentPage == 3
                  ? const SafeArea(
                      child: Center(
                        child: Text("Menu 4"),
                      ),
                    )
                  : const SafeArea(
                      child: Center(
                        child: Text("Menu 5"),
                      ),
                    );
}
