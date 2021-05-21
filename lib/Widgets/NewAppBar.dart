import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'ListIteamViewer.dart';
import 'Models/Menu.dart';

class MyNewAppBar extends PreferredSize implements StatelessWidget {
  final List<Widget>? inTheRow;
  final bool isAdmin;
  final List<MenuItemSmall> listOfMenu;
  final int? selectedIndex;
  MyNewAppBar(Size size, this.listOfMenu, this.selectedIndex,
      {this.inTheRow, this.isAdmin = false, key})
      : super(
            child: _MyNewAppBarWidget(
              inTheRow: inTheRow,
              isAdmin: isAdmin,
              listOfMenu: listOfMenu,
              selectedIndex: selectedIndex,
            ),
            preferredSize: size,
            key: key);
}

class _MyNewAppBarWidget extends StatefulWidget {
  final List<Widget>? inTheRow;
  final bool isAdmin;
  final List<MenuItemSmall>? listOfMenu;
  final int? selectedIndex;

  const _MyNewAppBarWidget(
      {Key? key,
      this.inTheRow,
      this.isAdmin = false,
      this.listOfMenu,
      this.selectedIndex})
      : super(key: key);
  @override
  _MyNewAppBarWidgetState createState() => _MyNewAppBarWidgetState();
}

class _MyNewAppBarWidgetState extends State<_MyNewAppBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isMenuOpen = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _controller);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () async {
            _controller.forward();
            await showAnimatedDialog(
                animationType: DialogTransitionType.slideFromLeftFade,
                barrierDismissible: true,
                context: context,
                builder: (_) {
                  return Align(
                    alignment: Alignment.topLeft.add(Alignment(0, 0.3)),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(3),
                      child: SizedBox(
                          height:
                              50 * (widget.listOfMenu!.length.toDouble() + 1),
                          width: 300,
                          child: MyListItemViewer<MenuItemSmall>(
                            items: widget.listOfMenu,
                            builder: (_, val) => InkWell(
                              onTap: () => val.onTap(),
                              child: Container(
                                width: 270,
                                height: 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ///Add the color controller
                                    Text(
                                      val.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .button!
                                          .copyWith(
                                              color: widget.listOfMenu!
                                                          .indexOf(val) ==
                                                      widget.selectedIndex
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Colors.black87),
                                    ),
                                    Icon(val.icon,
                                        color:
                                            widget.listOfMenu!.indexOf(val) ==
                                                    widget.selectedIndex
                                                ? Theme.of(context).primaryColor
                                                : Colors.black87)
                                  ],
                                ),
                              ),
                            ),
                          )),
                    ),
                  );
                });
            _controller.reverse();
          },
          borderRadius: BorderRadius.circular(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animation,
              color: Colors.grey,
            ),
          ),
        ),
        //the Logo
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/icon.png",
                scale: 1.5,
              ),
            ),
          ],
        ),

        if (widget.inTheRow != null)
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [for (final c in widget.inTheRow!) c],
            ),
          ),
        // Expanded(
        //     child: Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     // the button
        //     AdminButton()
        //   ],
        // ))
      ],
    );
  }
}
