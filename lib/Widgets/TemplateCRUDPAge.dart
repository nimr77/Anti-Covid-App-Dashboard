import 'package:flutter/material.dart';

import './NewAppBar.dart';
import 'CardWidget.dart';
import 'Models/Menu.dart';

class MyTemplatePage extends StatefulWidget {
  final Widget title;
  final Function()? onAdding;
  final Function(String)? onSearch;
  final Widget child;
  final List<Widget>? muilti;
  final String? searchText;
  final bool useScrolling;
  final bool showMenu;
  final bool showAppBar;
  final bool useGlobalKey;
  final PreferredSize? preferredSizeAppBar;
  final List<Widget>? inTheRow;
  final bool useAdminAppBar;
  MyTemplatePage(
      {required this.title,
      required this.child,
      this.useAdminAppBar = false,
      this.showMenu = false,
      this.showAppBar = true,
      this.muilti,
      this.onAdding,
      this.onSearch,
      this.searchText,
      this.useScrolling = true,
      this.useGlobalKey = true,
      this.inTheRow,
      key,
      this.preferredSizeAppBar})
      : super(key: key);
  @override
  MyTemplatePageState createState() => MyTemplatePageState();
}

class MyTemplatePageState extends State<MyTemplatePage> {
  TextEditingController mySearch = TextEditingController();
  String? changeSearch;
  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
    mySearch = TextEditingController(text: changeSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? (widget.preferredSizeAppBar != null
              ? widget.preferredSizeAppBar
              : MyNewAppBar(
                  Size(MediaQuery.of(context).size.width, 50),
                  MenuItemSmall.listOfMe,
                  MenuItemSmall.selectedIndex,
                  inTheRow: widget.inTheRow,
                  isAdmin: widget.useAdminAppBar,
                ))
          : null,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter.add(Alignment(0.935, 0.1)),
            child: MyCardWidget(
              ///Add the add and the search
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: widget.title,
                      ),
                      flex: 2,
                    ),
                    if (widget.muilti != null)
                      for (var tB in widget.muilti!) Expanded(child: tB),
                    widget.onAdding != null
                        ? Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SizedBox(
                              child: TextButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      widget.onAdding!();
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                  label: Container(
                                    child: Text(
                                      "No element to view",
                                      overflow: TextOverflow.fade,
                                    ),
                                  )),
                              width: 210,
                            ),
                          )
                        : Container(),
                    if (widget.onSearch != null)
                      Expanded(
                        child: SearchIcon(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.07,
                            searchText: changeSearch,
                            onTextChange: (str) {
                              Future.delayed(
                                  Duration(milliseconds: 200),
                                  () => setState(() {
                                        widget.onSearch!(str);
                                        changeSearch = str;
                                      }));
                            }),
                        flex: 1,
                      ),
                  ],
                ),
              ),
              //View and delete
              widget.useScrolling
                  ? Scrollbar(
                      child: SingleChildScrollView(child: widget.child),
                    )
                  : widget.child,
              MediaQuery.of(context).size.height * 0.9,
              MediaQuery.of(context).size.width,
              borderWidth: 0,
              borderStyle: true,
            ),
          ),
          // if (widget.showMenu)
          //   Align(alignment: Alignment.topLeft, child: MyMenuWidget())
        ],
      ),
    );
  }
}

// class MyMenuWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MyCardWidget(
//       null,
//       MyMenu(),
//       MyUtil.getContextHeight(context) * 0.97,
//       MyMenu.showFullMenu ? 270 : 80,
//       borderStyle: true,
//       borderRadius: 0,
//     );
//   }
// }

class SearchIcon extends StatefulWidget {
  final double height;
  final double width;
  final Function(String) onTextChange;
  final Function(String)? onSubmit;
  final String? searchText;
  SearchIcon(
      {required this.height,
      required this.width,
      required this.onTextChange,
      this.onSubmit,
      this.searchText});
  @override
  _SearchIconState createState() => _SearchIconState();
}

class _SearchIconState extends State<SearchIcon> {
  bool showIcon = true;
  TextEditingController? cont;
  @override
  void initState() {
    cont = TextEditingController(text: widget.searchText);
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
    cont!.text = widget.searchText!;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: widget.height,
      width: !showIcon ? widget.width : widget.width * 0.8,
      duration: Duration(milliseconds: 300),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: showIcon
            ? TextButton.icon(
                key: ValueKey<bool>(true),
                onPressed: () {
                  setState(() {
                    showIcon = false;
                  });
                },
                label: Text("Search"),
                icon: Icon(Icons.search_rounded),
              )
            : TextField(
                autofocus: true,
                controller: cont,
                key: ValueKey<bool>(false),
                onChanged: widget.onTextChange,
                onSubmitted: (str) {
                  setState(() {
                    showIcon = true;
                    if (widget.onSubmit != null) widget.onSubmit!(str);
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: "Search"),
              ),
      ),
    );
  }
}

class NoElementWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.error_outline,
              color: Colors.grey,
              size: MediaQuery.of(context).size.aspectRatio * 0.2,
            ),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "No Element to show",
              style: TextStyle(fontSize: 30),
            ),
          )),
        ],
      ),
    );
  }
}
