import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/Dialogs/AddingDialog.dart';
import 'package:fst_anti_covid_project/Functions/ValidateStrings.dart';
import 'package:fst_anti_covid_project/Widgets/ListIteamViewer.dart';
import 'package:fst_anti_covid_project/Widgets/TemplateCRUDPAge.dart';
import 'package:fst_anti_covid_project/generated/l10n.dart';
import 'package:fst_anti_covid_project/models/MyNeabyUsers.dart';
import 'package:fst_anti_covid_project/models/MyUser.dart';

class UploadView extends StatefulWidget {
  final UserUploads userUploads;

  const UploadView({Key key, this.userUploads}) : super(key: key);

  @override
  _UploadViewState createState() => _UploadViewState();
  static Future getAsDialog(BuildContext context, UserUploads userUploads) =>
      MyAddingDialog(
        child: UploadView(
          userUploads: userUploads,
        ),
      ).showMyDialog(context);
}

class _UploadViewState extends State<UploadView> {
  String search = "";
  @override
  Widget build(BuildContext context) {
    return MyTemplatePage(
        showMenu: false,
        showAppBar: false,
        searchText: search,
        onSearch: (str) {
          setState(() {
            search = str;
          });
        },
        title: ListTile(
          title: Text(MyUser.listOfMe
              .firstWhere((element) => element.id == widget.userUploads.userId)
              .name),
          subtitle: Text(
              "${S.of(context).uploadDate}: ${MyValidatorString.showGoodTime(DateTime.fromMillisecondsSinceEpoch(widget.userUploads.when))}"),
        ),
        child: MyListItemViewer<MyNearbyUser>(
          items: widget.userUploads.getContactUsers(),
        ));
  }
}
