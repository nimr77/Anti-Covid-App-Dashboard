import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          if (title != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(height: 65, child: title),
            ),
          Expanded(
              flex: 7,
              child: Padding(padding: const EdgeInsets.all(8.0), child: child)),
        ],
      ),
    );
  }
}
