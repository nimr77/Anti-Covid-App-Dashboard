import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class MyAddingDialog {
  Widget child;
  String? title;
  double? height;
  double? width;
  MyAddingDialog({
    required this.child,
    this.height,
    this.width,
    this.title,
  });
  Future showMyDialog(BuildContext context) => showCupertinoDialog(
      context: context,
      builder: (context) => SimpleDialog(
            titlePadding: title != null
                ? EdgeInsets.only(left: 8, bottom: 8)
                : EdgeInsets.only(right: 8),
            title: title != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title!,
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black87),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          })
                    ],
                  ),
            elevation: 2,
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5)),
            children: [
              Container(
                width: width ?? MediaQuery.of(context).size.width * 0.9,
                height: height ?? MediaQuery.of(context).size.height * 0.9,
                child: this.child,
              )
            ],
          ));
}
