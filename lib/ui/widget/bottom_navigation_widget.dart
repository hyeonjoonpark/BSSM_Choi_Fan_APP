import 'package:fan_app/provider/bottom_navigation_provider.dart';
import 'package:fan_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';

Widget bottomNavigationBarWidget(BottomNavigationProvider provider) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '홈',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.article,
        ),
        label: '게시판',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.shop,
        ),
        label: '굿즈샵',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
        ),
        label: '검색',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: '설정',
      ),
    ],
    onTap: (index) {
      provider.updateCurrentPage(index);
    },
    currentIndex: provider.currentPage, // current page
    selectedItemColor: MainColors.primary,
    unselectedItemColor: MainColors.black,
  );
}
