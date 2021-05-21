import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///this a simple Button with [TextStyle] that takes it size from the text length,
///this Button Contains [OutlineInputBorder] with [borderRadius] that equils [_redu] = [25]
///and it contain future loader
class SimpleActionButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Function() onTap;
  final Color myColor;
  final Widget child;
  final double elevation;
  final bool isLoading;
  final double radius;
  final Color loadingColor;
  const SimpleActionButton(
      {Key? key,
      this.height,
      this.width,
      required this.onTap,
      this.myColor = Colors.amber,
      this.elevation = 5,
      this.isLoading = false,
      required this.child,
      this.radius = 5,
      this.loadingColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: MaterialButton(
          key: ValueKey(isLoading),
          onPressed: !isLoading ? onTap : () {},
          elevation: elevation,
          color: myColor,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius)),
          child: Container(
            height: height,
            width: width,
            child: !isLoading
                ? child
                : ClipRRect(
                    child: SpinKitThreeBounce(
                      color: loadingColor,
                    ),
                  ),
          ),
        ));
  }
}
