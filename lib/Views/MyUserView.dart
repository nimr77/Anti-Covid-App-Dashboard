import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/Controllers/MyNearByControllers.dart';
import 'package:fst_anti_covid_project/Functions/ValidateStrings.dart';
import 'package:fst_anti_covid_project/Widgets/CustomWidgets.dart';
import 'package:fst_anti_covid_project/Widgets/MyButtons.dart';
import 'package:fst_anti_covid_project/generated/l10n.dart';
import 'package:fst_anti_covid_project/models/MyUser.dart';

///View
///name
///phone
///email
///address
///last upload time
///total number of contact
/// and actions button

class MyUserView extends StatefulWidget {
  final MyUser myUser;

  const MyUserView({Key key, this.myUser}) : super(key: key);

  @override
  _MyUserViewState createState() => _MyUserViewState();
}

class _MyUserViewState extends State<MyUserView> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black87.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 15)
        ]),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                onPressed: () {
                  // notification body
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.grey,
                ),
              ),
              title: Text(this.widget.myUser.name),
              trailing: SimpleActionButton(
                isLoading: widget.myUser.isLoading,
                onTap: () {
                  NearbyUsersControllers.getUploadsForUser(widget.myUser)
                      .then((value) {
                    setState(() {});
                  });
                  setState(() {});
                },
                child: Text(S.of(context).getUploads),
              ),
              subtitle: Column(
                children: [
                  Text(this.widget.myUser.phoneNumber ?? "-"),
                  Text(this.widget.myUser.email ?? "-"),
                  Text(this.widget.myUser.address ?? "-"),
                ],
              ),
            ),
            Row(
              children: [
                for (final x in NearbyUsersControllers.getForThisUserUploads(
                    widget.myUser.id))
                  ShowUpAnimation(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(MyValidatorString.showGoodTime(
                            DateTime.fromMillisecondsSinceEpoch(x.when)))),
                  )
              ],
            )
          ],
        ),
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}

class ListUsersInDatabase extends StatelessWidget {
  final List<MyUser> myUsers;

  const ListUsersInDatabase({Key key, this.myUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Wrap(
        children: [
          for (final x in this.myUsers)
            ShowUpAnimation(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyUserView(
                  key: ValueKey(x.id),
                  myUser: x,
                ),
              ),
            )
        ],
      ),
    );
  }
}
