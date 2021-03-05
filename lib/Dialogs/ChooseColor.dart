// import 'dart:ui';
//
// import '../Style/MyTextStyle.dart';
// import '../Util/GeneralUtil.dart';
// import '../generated/l10n.dart';
// import 'package:flutter/material.dart';
//
// class MyChooseColorsDialog {
//   static List<Color> myColors = [
//     Colors.black,
//     Colors.amber,
//     Colors.blue,
//     Colors.green,
//     Colors.pink
//   ];
//   Future showMyDialog(Function(Color) onChoise, BuildContext context) =>
//       showDialog(
//           context: context,
//           builder: (context) => SimpleDialog(
//                 title: Text(
//                   S.of(context).colorChoiseAdd,
//                   style:
//                       MyTextStyle.simpleTitleTextStyle(myColor: Colors.black),
//                 ),
//                 children: [
//                   Container(
//                     height: MyUtil.getContextHeight(context) * 0.2,
//                     width: MyUtil.getContextWidth(context) * 0.2,
//                     child: GridView.builder(
//                         itemCount: myColors.length,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 5),
//                         itemBuilder: (context, index) => Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: InkWell(
//                                 onTap: () {
//                                   onChoise(myColors[index]);
//                                   Navigator.pop(context);
//                                 },
//                                 child: Container(
//                                   color: myColors[index],
//                                 ),
//                               ),
//                             )),
//                   )
//                 ],
//               ));
// }
