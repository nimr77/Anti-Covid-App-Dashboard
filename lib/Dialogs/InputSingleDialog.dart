// import 'package:flutter/material.dart';
//
// import '../Style/MyTextStyle.dart';
// import '../generated/l10n.dart';
//
// class InputSingleDialog {
//   String title;
//   Function(String) onsubmit;
//   TextEditingController controller = TextEditingController();
//   InputSingleDialog(
//     this.title,
//     this.onsubmit,
//   );
//   Future showTheDialog(BuildContext context,
//       {List<String Function(String)> validators}) {
//     GlobalKey<FormState> myKey = GlobalKey<FormState>();
//     String validate(String input) {
//       if (input.isEmpty)
//         return S.of(context).notValideText;
//       else if (validators != null)
//         for (var item in validators) {
//           if (item(input) != null) return item(input);
//         }
//       return null;
//     }
//
//     void sumint() {
//       if (myKey.currentState.validate()) {
//         onsubmit(controller.text);
//         Navigator.pop(context);
//       }
//     }
//
//     return showDialog(
//         context: context,
//         builder: (context) => SimpleDialog(
//               title: Text(
//                 title,
//                 style: MyTextStyle.simpleTitleTextStyle(myColor: Colors.black),
//               ),
//               children: [
//                 Form(
//                   key: myKey,
//                   child: TextFormField(
//                     controller: controller,
//                     validator: validate,
//                     decoration: InputDecoration(hintText: title),
//                   ),
//                 ),
//               ],
//             ));
//   }
// }
