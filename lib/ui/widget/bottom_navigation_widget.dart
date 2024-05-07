import 'package:fan_app/provider/bottom_navigation_provider.dart';
import 'package:fan_app/utils/colors/colors.dart';
import 'package:flutter/material.dart';

Widget bottomNavigationBarWidget(BottomNavigationProvider provider) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '메뉴1',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.people,
        ),
        label: '메뉴2',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        label: '메뉴3',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
        ),
        label: '메뉴4',
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: '메뉴5',
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
