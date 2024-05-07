import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count; // get count

  // count를 1 증가시키는 함수
  add() {
    _count++;
    notifyListeners();
  }

  // count를 1 감소시키는 함수
  remove() {
    _count--;
    notifyListeners();
  }
}