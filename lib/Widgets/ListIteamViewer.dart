import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';

// Build animated item (helper for all examples)
Widget buildAnimatedItem(
        {required BuildContext context,
        required Animation<double> animation,
        required Widget child}) =>
    // For example wrap with fade transition
    FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        // Paste you Widget
        child: child,
      ),
    );

class MyListItemViewer<T> extends StatelessWidget {
  final List<T>? items;
  final Widget Function(BuildContext context, T)? builder;
  MyListItemViewer({Key? key, this.items, this.builder}) : super(key: key);
  final LiveOptions options = LiveOptions(
    // Start animation after (default zero)
    delay: Duration(milliseconds: 50),

    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 200),

    // Animation duration (default 250)
    showItemDuration: Duration(milliseconds: 250),

    // Animations starts at 0.05 visible
    // item fraction in sight (default 0.025)
    visibleFraction: 0.02,

    // Repeat the animation of the appearance
    // when scrolling in the opposite direction (default false)
    // To get the effect as in a showcase for ListView, set true
    reAnimateOnVisibility: false,
  );
  @override
  Widget build(BuildContext context) {
    return this.items!.isEmpty
        ? Material(
            color: Colors.transparent,
            child: Column(
              children: [
                Icon(
                  Icons.error,
                  color: Colors.grey,
                  size: MediaQuery.of(context).size.aspectRatio * 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "No Element to show",
                    style: TextStyle(color: Colors.grey, fontSize: 30),
                    overflow: TextOverflow.fade,
                    textScaleFactor:
                        MediaQuery.of(context).size.width * 0.0008 +
                            MediaQuery.of(context).textScaleFactor * 0.05,
                  ),
                )
              ],
            ),
          )
        : LiveList.options(
            itemBuilder: (context, index, animation) => buildAnimatedItem(
                context: context,
                animation: animation,
                child: Column(
                  children: [
                    builder!(context, items![index]),
                    if (items!.length - 1 > index) Divider()
                  ],
                )),
            itemCount: items!.length,
            options: options,
          );
  }
}
