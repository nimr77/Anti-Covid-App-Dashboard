import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fst_anti_covid_project/Controllers/MyNearByControllers.dart';
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
class MySingleNearbyUserView extends StatefulWidget {
  final MyNearbyUser myNearbyUser;

  const MySingleNearbyUserView({Key? key, required this.myNearbyUser})
      : super(key: key);

  @override
  _MySingleNearbyUserViewState createState() => _MySingleNearbyUserViewState();
}

class _MySingleNearbyUserViewState extends State<MySingleNearbyUserView> {
  bool loading = false;
  // MyNearbyUser myNearbyUser;
  @override
  void initState() {
    loading = widget.myNearbyUser.name == null;
    if (loading)
      NearbyUsersControllers.reloadThisUserInfoIfNeeded(widget.myNearbyUser)
          .then((value) {
        print(value);
        setState(() {
          loading = widget.myNearbyUser.name == null;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: SizedBox(
        key: ValueKey(loading),
        height: 100,
        child: loading
            ? SpinKitCubeGrid(
                color: Colors.grey,
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // the person view
                    MyPersonView(
                      person: widget.myNearbyUser,
                    ),
                    // total number of contact
                    Text(
                        "${S.of(context).totalNumberOfScans}: ${widget.myNearbyUser.myScanned().length}"),
                    // last time been scanned
                    if (widget.myNearbyUser.myScanned().isNotEmpty)
                      Text(
                          "${S.of(context).lastTimeBeenScanned}: ${MyValidatorString.showGoodTime(DateTime.parse(widget.myNearbyUser.myScanned().last.whenBeenScanned))}")
                  ],
                ),
              ),
      ),
    );
  }
}
