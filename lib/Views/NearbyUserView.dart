import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/Functions/ValidateStrings.dart';
import 'package:fst_anti_covid_project/generated/l10n.dart';
import 'package:fst_anti_covid_project/models/MyNeabyUsers.dart';

import 'PersonView.dart';

///View
///name
///phone
///email
///address
///last upload time
///total number of contact
/// and actions button
class MySingleNearbyUserView extends StatelessWidget {
  final MyNearbyUser myNearbyUser;

  const MySingleNearbyUserView({Key key, this.myNearbyUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // the person view
          MyPersonView(
            person: myNearbyUser,
          ),
          // total number of contact
          Text(
              "${S.of(context).totalNumberOfScans}: ${myNearbyUser.myScanned().length}"),
          // last time been scanned
          Text(
              "${S.of(context).lastTimeBeenScanned}: ${MyValidatorString.showGoodTime(DateTime.parse(myNearbyUser.myScanned().last.whenBeenScanned))}")
        ],
      ),
    );
  }
}
