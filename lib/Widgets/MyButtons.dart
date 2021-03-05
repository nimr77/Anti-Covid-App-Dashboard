import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///this a simple Button with [TextStyle] that takes it size from the text length,
///this Button Contains [OutlineInputBorder] with [borderRadius] that equils [_redu] = [25]
///and it contain future loador
class SimpleActionButton extends StatelessWidget {
  final double height;
  final double width;
  final Function() onTap;
  final Color myColor;
  final Widget child;
  final double elevation;
  final bool isLoading;
  final double radius;
  final Color loadingColor;
  const SimpleActionButton(
      {Key key,
      this.height,
      this.width,
      @required this.onTap,
      this.myColor = Colors.amber,
      this.elevation = 5,
      this.isLoading = false,
      @required this.child,
      this.radius = 5,
      this.loadingColor = Colors.white})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: MaterialButton(
          onPressed: !isLoading ? onTap : () {},
          elevation: elevation,
          color: myColor,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(radius)),
          child: Container(
            key: ValueKey(isLoading),
            height: height,
            width: width,
            child: !isLoading
                ? child
                : SpinKitThreeBounce(
                    color: loadingColor,
                  ),
          ),
        ));
  }
}

///Good button
class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget(
      {Key key,
      @required this.color,
      @required this.text,
      @required this.onPressed})
      : super(key: key);

  final Color color;
  final Text text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: this.color.withOpacity(0.4),
              blurRadius: 40,
              offset: Offset(0, 15)),
          BoxShadow(
              color: this.color.withOpacity(0.4),
              blurRadius: 13,
              offset: Offset(0, 3))
        ],
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: FlatButton(
        onPressed: this.onPressed,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        color: this.color,
        shape: StadiumBorder(),
        child: this.text,
      ),
    );
  }
}

class BlockButtonWidgetActions extends StatefulWidget {
  BlockButtonWidgetActions(
      {Key key,
      @required this.color,
      @required this.widget,
      @required this.onPressed,
      this.border,
      this.loadingColor = Colors.white})
      : super(key: key);

  final Color color;
  final Widget widget;
  Color loadingColor;
  Future Function() onPressed;
  BorderSide border;
  @override
  _BlockButtonWidgetActionsState createState() =>
      _BlockButtonWidgetActionsState();
}

class _BlockButtonWidgetActionsState extends State<BlockButtonWidgetActions> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: widget.color.withOpacity(0.4),
              blurRadius: 40,
              offset: Offset(0, 15)),
          BoxShadow(
              color: widget.color.withOpacity(0.4),
              blurRadius: 13,
              offset: Offset(0, 3))
        ],
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: FlatButton(
        onPressed: () async {
          setState(() {
            loading = true;
          });
          await widget.onPressed();
          setState(() {
            loading = false;
          });
        },
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        color: widget.color,
        shape: StadiumBorder(side: widget.border ?? BorderSide.none),
        child: !loading
            ? this.widget.widget
            : CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 15,
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(widget.loadingColor),
                )),
      ),
    );
  }
}
