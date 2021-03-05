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

import '../Style/MyTextStyle.dart';
// class _MyLogoState extends State<MyLogo> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: widget.width,
//         width: widget.width,
//         child: CircleAvatar(
//           backgroundColor: Colors.transparent,
//           backgroundImage: NetworkImage(widget.imageUrl),
//         ));
//   }
// }

import '../Util/GeneralUtil.dart';
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
  static int selectedItem = -1;
  static bool showFullMenu = false;

  ///Contains the title that is a string and an icon with a function
  static final elements = List<Map>();
  @override
  _MyMenuState createState() => _MyMenuState();
}

class _MyMenuState extends State<MyMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: MyMenu.elements.length,
        itemBuilder: (context, index) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: !MyMenu.showFullMenu ? 500 : 200),
            child: MyMenu.showFullMenu
                ? FlatButton(
                    key: ValueKey<bool>(true),
                    height: MyUtil.getContextHeight(context) * 0.08,
                    onPressed: () {
                      setState(() {
                        MyMenu.selectedItem = index;
                        MyMenu.elements[index]['function'](context);
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Add the color controller
                        Text(
                          MyMenu.elements[index]['title'],
                          style: MyTextStyle.simpleButtonTextStyle(
                              myColor: MyMenu.selectedItem == index
                                  ? Colors.deepOrange
                                  : Colors.black54),
                        ),
                        Icon(MyMenu.elements[index]['icon'],
                            color: MyMenu.selectedItem == index
                                ? Colors.deepOrange
                                : Colors.black54)
                      ],
                    ))
                : Tooltip(
                    key: ValueKey<bool>(false),
                    message: MyMenu.elements[index]['title'],
                    child: IconButton(
                      icon: Icon(MyMenu.elements[index]['icon'],
                          color: MyMenu.selectedItem == index
                              ? Colors.deepOrange
                              : Colors.black54),
                      onPressed: () {
                        setState(() {
                          MyMenu.selectedItem = index;
                          MyMenu.elements[index]['function'](context);
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
