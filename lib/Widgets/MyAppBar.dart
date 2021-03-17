import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/main.dart';

import '../Util/GeneralUtil.dart';
import 'DashboardWidgets.dart';

// ignore: must_be_immutable

class MyAppBar {
  static int selectedIndex = 0;
  static PreferredSize myAppBar(
      State thisState, ScaffoldState Function() scaffoldState,
      {Color myColor = Colors.white, bool showHome = false}) {
    MyMenuItem.initMenu(thisState);
    return PreferredSize(
      preferredSize: Size(MyUtil.getContextWidth(thisState.context), 50),
      child: AppBar(
        key: ValueKey<int>(selectedIndex),
        elevation: 4,
        backgroundColor: myColor,
        leading: !showHome
            ? InkWell(
                onTap: () {
                  if (MediaQuery.of(MyApp.myStateNavigator.currentContext)
                          .size
                          .width >
                      450)
                    thisState.setState(() {
                      MyMenu.showFullMenu = !MyMenu.showFullMenu;
                    });
                  else {
                    if (!scaffoldState().isDrawerOpen) {
                      MyMenu.showFullMenu = true;
                      scaffoldState().openDrawer();
                    } else {
                      scaffoldState().openEndDrawer();
                    }
                  }
                },
                child: Icon(
                  MyMenu.showFullMenu
                      ? Icons.menu_open_sharp
                      : Icons.menu_rounded,
                  color: Colors.grey,
                ),
              )
            : IconButton(
                onPressed: () {
                  selectedIndex = 0;
                  Navigator.pop(thisState.context);
                },
                icon: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
              ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 8),
              child: DropdownButton<String>(
                items: [
                  for (final x in MyMenuItem.menu)
                    DropdownMenuItem(
                      child: x.child,
                      onTap: () {
                        thisState.setState(() {
                          selectedIndex = MyMenuItem.menu.indexWhere(
                              (element) => element.value == x.value);
                        });
                        //
                      },
                      value: x.value,
                    )
                ],
                onChanged: (v) {
                  MyMenuItem.menu
                      .firstWhere((element) => element.value == v)
                      .onChange();
                },
                value: MyMenuItem.menu.isEmpty
                    ? ""
                    : MyMenuItem.menu[selectedIndex].value,
                icon: Icon(Icons.person_rounded),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.message_outlined,
                color: Colors.grey,
              ),
            ),
          ),
        ].reversed.toList(),
      ),
    );
  }
}

///This is for the menu of the app
class MyMenuItem {
  Widget child;
  Function() onChange;
  String value;
  static List<MyMenuItem> menu = <MyMenuItem>[];

  MyMenuItem(
      {@required this.child, @required this.onChange, @required this.value});

  static initMenu(State thisState) {
    menu.clear();
  }
}
