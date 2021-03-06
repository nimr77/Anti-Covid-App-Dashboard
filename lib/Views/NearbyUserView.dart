import 'package:auto_animated/auto_animated.dart';
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

// Build animated item (helper for all examples)
Widget buildAnimatedItem(
        {@required BuildContext context,
        @required Animation<double> animation,
        @required Widget child}) =>
    // For example wrap with fade transition
    FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      // And slide transition
      child: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, -0.1),
          end: Offset.zero,
        ).animate(animation),
        // Paste you Widget
        child: child,
      ),
    );

class NearByUsersList extends StatelessWidget {
  final List<MyNearbyUser> myNearByUsers;

  NearByUsersList({Key key, this.myNearByUsers}) : super(key: key);
  final LiveOptions options = LiveOptions(
    // Start animation after (default zero)
    delay: Duration(seconds: 1),

    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 500),

    // Animation duration (default 250)
    showItemDuration: Duration(seconds: 1),

    // Animations starts at 0.05 visible
    // item fraction in sight (default 0.025)
    visibleFraction: 0.05,

    // Repeat the animation of the appearance
    // when scrolling in the opposite direction (default false)
    // To get the effect as in a showcase for ListView, set true
    reAnimateOnVisibility: false,
  );
  @override
  Widget build(BuildContext context) {
    return LiveList.options(
      itemBuilder: (context, index, animation) => buildAnimatedItem(
          context: context,
          animation: animation,
          child: Column(
            children: [
              MySingleNearbyUserView(
                myNearbyUser: myNearByUsers[index],
              ),
              if (myNearByUsers.length - 1 > index) Divider()
            ],
          )),
      itemCount: myNearByUsers.length,
      options: options,
    );
  }
}
