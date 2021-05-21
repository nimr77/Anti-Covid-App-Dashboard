import 'package:flutter/widgets.dart';

class MenuItemSmall {
  String title;
  IconData icon;
  Function() onTap;

  MenuItemSmall({required this.title, required this.icon, required this.onTap});

  static final listOfMe = <MenuItemSmall>[];
  static int? selectedIndex;
  static void initMenu() {
    listOfMe.clear();
    selectedIndex = 0;
  }
}
