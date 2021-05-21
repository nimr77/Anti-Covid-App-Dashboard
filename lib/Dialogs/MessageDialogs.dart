// import 'package:flutter/material.dart';
//
//
// class MyMessegesDialog {
//   static bool pressOk = false;
//   static bool pressCancel = true;
//
//   static Future showMyParentsMessege(String messege, BuildContext context,
//       {String titleMess = ''}) async {
//     if (titleMess.isEmpty) titleMess = S.of(context).defeultMessegeTitle;
//     pressOk = false;
//     pressCancel = true;
//     await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return SimpleDialog(
//             shape: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(2)),
//             elevation: 3,
//             title: Text(
//               titleMess,
//               style: MyTextStyle.simpleTitleTextStyle(myColor: Colors.black54),
//             ),
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(messege,
//                     style: MyTextStyle.simpleBodyTextStyle(),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 10,
//                     textScaleFactor: MyUtil.getContextWidth(context) * 0.00095 +
//                         MyUtil.getContextHeight(context) * 0.000001),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextButton(
//                       child: Text(S.of(context).Ok),
//                       onPressed: () {
//                         pressCancel = false;
//                         pressOk = true;
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         });
//   }
//
//   static Future showMyYesOrNoMessege(String messege, BuildContext context,
//       {String titleMess = ''}) async {
//     if (titleMess.isEmpty) titleMess = S.of(context).defeultMessegeTitle;
//     pressOk = false;
//     pressCancel = true;
//     await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return SimpleDialog(
//             shape: OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.transparent),
//                 borderRadius: BorderRadius.circular(2)),
//             elevation: 3,
//             title: Text(
//               titleMess,
//               style: MyTextStyle.simpleTitleTextStyle(myColor: Colors.black54),
//             ),
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(messege,
//                     style: MyTextStyle.simpleBodyTextStyle(),
//                     overflow: TextOverflow.ellipsis,
//                     maxLines: 10,
//                     textScaleFactor: MyUtil.getContextWidth(context) * 0.00095 +
//                         MyUtil.getContextHeight(context) * 0.000001),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextButton(
//                       child: Text(S.of(context).yes),
//                       onPressed: () {
//                         pressOk = true;
//                         pressCancel = false;
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextButton(
//                       child: Text(S.of(context).no),
//                       onPressed: () {
//                         pressOk = false;
//                         pressCancel = true;
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         });
//   }
// }
