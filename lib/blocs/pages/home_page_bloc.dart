import 'package:flutter/material.dart';

class HomePageBloc extends ChangeNotifier {
  int _bottomNavBarIndex = 0;
  int get bottomNavBarIndex => _bottomNavBarIndex;
  set bottomNavBarIndex(int value) {
    _bottomNavBarIndex = value;
    notifyListeners();
  }
}
