import 'package:flutter/material.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int _index = 0;
  int get currentPage => _index; // get current page

  // update current page
  updateCurrentPage(int index) {
    _index = index;
    notifyListeners();
  }
}
