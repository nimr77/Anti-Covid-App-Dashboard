import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Style/MyTextStyle.dart';
import '../Util/GeneralUtil.dart';

class MyAddingDialog {
  Widget child;
  String title;
  double height;
  double width;
  MyAddingDialog({
    @required this.child,
    this.height,
    this.width,
    this.title,
  });
  Future showMyDialog(BuildContext context) => showCupertinoDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: title != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: MyTextStyle.simpleTitleTextStyle(
                            myColor: Colors.black),
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
                : null,
            elevation: 2,
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(5)),
            children: [
              Container(
                width: width ?? MyUtil.getContextWidth(context) * 0.9,
                height: height ?? MyUtil.getContextHeight(context) * 0.9,
                child: this.child,
              )
            ],
          ));
}
