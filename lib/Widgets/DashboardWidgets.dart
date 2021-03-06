// import '../Classes/Store.dart';
// import 'package:flutter/material.dart';
// import './CustomWidgets.dart';

// class MyCoverWidget extends StatefulWidget {
//   double width;
//   double hight;
//   String imageUrl;
//   MyCoverWidget(this.hight, this.width, this.imageUrl);
//   @override
//   _MyCoverWidgetState createState() => _MyCoverWidgetState();
// }

// class _MyCoverWidgetState extends State<MyCoverWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.imageUrl == null
//         ? MyHtmlImageUploader(widget.hight, widget.width, (coverImage) async {
//             //Uploading the cover image
//             await MyStore.me.uploadCoverImage(coverImage);
//           })
//         : Container(
//             height: widget.hight,
//             width: widget.width,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage(widget.imageUrl), fit: BoxFit.cover)),
//           );
//   }
// }

// class MyLogo extends StatefulWidget {
//   double width;
//   String imageUrl;
//   MyLogo(this.width, this.imageUrl);
//   @override
//   _MyLogoState createState() => _MyLogoState();
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/Pages/HomePage.dart';
import 'package:fst_anti_covid_project/main.dart';

import '../Style/MyTextStyle.dart';
import '../generated/l10n.dart';

class MyCardWidget extends StatelessWidget {
  final Widget title;
  final Widget child;
  final double height;
  final double width;
  final bool borderStyle;
  final double borderWidth;
  MyCardWidget(this.title, this.child, this.height, this.width,
      {this.borderStyle = false, this.borderWidth = 1});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      key: ValueKey<double>(height),
      duration: Duration(milliseconds: 500),
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: borderStyle && borderWidth != 0
              ? Border.all(color: Colors.black45, width: borderWidth)
              : null,
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10),
          boxShadow: borderStyle
              ? []
              : [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 20,
                      offset: Offset(0, 0.7)),
                  BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 5,
                      offset: Offset(0, 0.5))
                ]),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: title,
            ),
          ),
          Expanded(
              flex: 7,
              child: Padding(padding: const EdgeInsets.all(8.0), child: child)),
        ],
      ),
    );
  }
}

///This menu depends on the boolian value that determn if its in full scale
///or not
class MyMenu extends StatefulWidget {
  static bool showFullMenu = false;

  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: MenuElement.elements.length,
        itemBuilder: (context, index) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: !MyMenu.showFullMenu ? 500 : 200),
            child: MyMenu.showFullMenu
                ? TextButton(
                    key: ValueKey<bool>(true),
                    onPressed: () {
                      setState(() {
                        MenuElement.selectedItem = index;
                        MenuElement.elements[index].onTap(context);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Add the color controller
                        Text(
                          MenuElement.elements[index].title(),
                          style: MyTextStyle.simpleButtonTextStyle(
                              myColor: MenuElement.selectedItem == index
                                  ? Colors.deepOrange
                                  : Colors.black54),
                        ),
                        Icon(MenuElement.elements[index].iconData,
                            color: MenuElement.selectedItem == index
                                ? Colors.deepOrange
                                : Colors.black54)
                      ],
                    ))
                : Tooltip(
                    key: ValueKey<bool>(false),
                    message: MenuElement.elements[index].title(),
                    child: IconButton(
                      icon: Icon(MenuElement.elements[index].iconData,
                          color: MenuElement.selectedItem == index
                              ? Colors.deepOrange
                              : Colors.black54),
                      onPressed: () {
                        setState(() {
                          MenuElement.selectedItem = index;
                          MenuElement.elements[index].onTap(context);
                        });
                      },
                    ),
                  ),
          );
        });
  }
}

class MyFilterDialog {
  List<String> filterTitles;
  String selectedFilter;
  MyFilterDialog({@required this.filterTitles, @required this.selectedFilter});
  Future buildThisDialog(BuildContext context, Function(String) onTap) async {
    await showCupertinoDialog(
        context: context,
        builder: (context) => StatefulBuilder(
              builder: (context, state) => SimpleDialog(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        S.of(context).filter,
                        style: MyTextStyle.simpleTitleTextStyle(
                            fontSize: 20, myColor: Colors.black87),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
                children: [
                  TextButton(
                      child: Text(
                        S.of(context).all,
                        style: selectedFilter == null || selectedFilter.isEmpty
                            ? TextStyle(color: Colors.deepOrange)
                            : null,
                      ),
                      onPressed: () {
                        selectedFilter = "";

                        onTap(selectedFilter);
                        Navigator.pop(context);
                      }),
                  for (final x in filterTitles)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        child: Text(
                          x,
                          style: selectedFilter == x
                              ? TextStyle(color: Colors.deepOrange)
                              : null,
                        ),
                        onPressed: () {
                          onTap(x);
                          Navigator.pop(context);
                        },
                      ),
                    )
                ],
              ),
            ));
  }
}

class MenuElement {
  String Function() title;
  Function(BuildContext) onTap;
  IconData iconData;

  static final elements = <MenuElement>[];
  static int selectedItem = 0;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  MenuElement({
    @required this.title,
    @required this.onTap,
    @required this.iconData,
  });

  MenuElement copyWith({
    String Function() title,
    Function(BuildContext) onTap,
    IconData iconData,
  }) {
    return new MenuElement(
      title: title ?? this.title,
      onTap: onTap ?? this.onTap,
      iconData: iconData ?? this.iconData,
    );
  }

  @override
  String toString() {
    return 'MenuElement{title: $title, onTap: $onTap, iconData: $iconData}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MenuElement &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          onTap == other.onTap &&
          iconData == other.iconData);

  @override
  int get hashCode => title.hashCode ^ onTap.hashCode ^ iconData.hashCode;

  factory MenuElement.fromMap(Map<String, dynamic> map) {
    return new MenuElement(
      title: map['title'] as String Function(),
      onTap: map['onTap'] as Function(BuildContext),
      iconData: map['iconData'] as IconData,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'onTap': this.onTap,
      'iconData': this.iconData,
    } as Map<String, dynamic>;
  }

//</editor-fold>
  static void initMyMenu() {
    elements.add(MenuElement(
        title: () => S.current.manageUsers,
        onTap: (_) {
          MyApp.myStateNavigator.currentState.pushNamed(MyUsersPage.route);
        },
        iconData: Icons.supervised_user_circle));
  }
}
