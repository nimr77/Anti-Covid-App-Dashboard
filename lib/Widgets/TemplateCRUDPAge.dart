import 'package:flutter/material.dart';

import '../Style/MyTextStyle.dart';
import '../Util/GeneralUtil.dart';
import '../generated/l10n.dart';
import 'DashboardWidgets.dart';
import 'GlobalUI.dart';
import 'InputWidgets.dart';
import 'MyAppBar.dart';

class MyTemplatePage extends StatefulWidget {
  final Widget title;
  final Function() onAdding;
  final Function(String) onSearch;
  final Widget child;
  final List<Widget> muilti;
  final bool useSearchIcon;
  final String searchText;
  final bool useScrolling;
  final bool showMenu;
  final bool showAppBar;
  MyTemplatePage(
      {@required this.title,
      @required this.child,
      this.showMenu = true,
      this.showAppBar = true,
      this.muilti,
      this.onAdding,
      this.onSearch,
      this.useSearchIcon = false,
      this.searchText,
      this.useScrolling = true,
      key})
      : super(key: key);
  @override
  MyTemplatePageState createState() => MyTemplatePageState();
}

class MyTemplatePageState extends State<MyTemplatePage> {
  TextEditingController mySearch = TextEditingController();
  String changeSearch;
  @override
  void initState() {
    super.initState();
    UIGlobal.myScafState = GlobalKey<ScaffoldState>();
  }

  @override
  void setState(fn) {
    super.setState(fn);
    mySearch = TextEditingController(text: changeSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UIGlobal.myScafState,
      appBar: widget.showAppBar ? MyAppBar.myAppBar(this) : false,
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
                      flex: 3,
                    ),
                    if (widget.muilti != null)
                      for (var tB in widget.muilti) Expanded(child: tB),
                    widget.onAdding != null
                        ? Expanded(
                            child: TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    widget.onAdding();
                                  });
                                },
                                icon: Icon(Icons.add),
                                label: Container(
                                  child: Text(
                                    S.of(context).addNewElement,
                                    overflow: TextOverflow.fade,
                                  ),
                                )),
                            flex: 2,
                          )
                        : Container(),
                    if (widget.onSearch != null && !widget.useSearchIcon)
                      Expanded(
                        child: MyInputWidget.formInputBoxStand(
                            mySearch, S.of(context).search,
                            myIcon: Icons.search_outlined),
                        flex: 2,
                      ),
                    if (widget.onSearch != null && widget.useSearchIcon)
                      Expanded(
                        child: SearchIcon(
                            height: MyUtil.getContextHeight(context) * 0.1,
                            width: MyUtil.getContextWidth(context) * 0.07,
                            searchText: changeSearch,
                            onTextChange: (str) {
                              Future.delayed(
                                  Duration(milliseconds: 200),
                                  () => setState(() {
                                        widget.onSearch(str);
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
              MyUtil.getContextHeight(context) * 0.9,
              MyUtil.getContextWidth(context) * 0.935,
              borderWidth: 0,
              borderStyle: true,
            ),
          ),
          if (widget.showMenu)
            Align(alignment: Alignment.centerLeft, child: MyMenuWidget())
        ],
      ),
    );
  }
}

class MyMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyCardWidget(
        Text(
          S.of(context).menu,
          style: MyTextStyle.simpleTitleTextStyle(
              myColor: Colors.black87, fontSize: 20),
          textScaleFactor: MyUtil.getContextWidth(context) * 0.0007,
        ),
        MyMenu(),
        MyUtil.getContextHeight(context) * 0.89,
        MyMenu.showFullMenu ? 270 : 80);
  }
}

class SearchIcon extends StatefulWidget {
  final double height;
  final double width;
  final Function(String) onTextChange;
  final Function(String) onSubmit;
  final String searchText;
  SearchIcon(
      {@required this.height,
      @required this.width,
      @required this.onTextChange,
      this.onSubmit,
      this.searchText});
  @override
  _SearchIconState createState() => _SearchIconState();
}

class _SearchIconState extends State<SearchIcon> {
  bool showIcon = true;
  TextEditingController cont;
  @override
  void initState() {
    cont = TextEditingController(text: widget.searchText);
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
    cont.text = widget.searchText;
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
                label: Text(S.of(context).search),
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
                    if (widget.onSubmit != null) widget.onSubmit(str);
                  });
                },
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: S.of(context).search),
              ),
      ),
    );
  }
}
