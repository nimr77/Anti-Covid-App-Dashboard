import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/Controllers/MyNearByControllers.dart';
import 'package:fst_anti_covid_project/Widgets/MyButtons.dart';
import 'package:fst_anti_covid_project/Widgets/TableView.dart';
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

  const MyUserView({Key? key, required this.myUser}) : super(key: key);

  @override
  _MyUserViewState createState() => _MyUserViewState();
}

class _MyUserViewState extends State<MyUserView> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        width: 420,
        height: 180,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            boxShadow: [
              BoxShadow(
                  color: Colors.black87.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 10)
            ]),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: ListTile(
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
                    elevation: 0,
                    width: 100,
                    height: 30,
                    isLoading: widget.myUser.isLoading,
                    onTap: () {
                      NearbyUsersControllers.getUploadsForUser(widget.myUser)
                          .then((value) {
                        setState(() {});
                      });
                      setState(() {});
                    },
                    child: Center(child: Text(S.of(context).getUploads)),
                  ),
                  subtitle: SizedBox(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SelectableText(
                          "${S.of(context).userPhone}: ${this.widget.myUser.phoneNumber ?? " - "}",
                          maxLines: 1,
                        ),
                        SelectableText(
                          "${S.of(context).userEmail} ${this.widget.myUser.email ?? " - "}",
                          maxLines: 1,
                        ),
                        SelectableText(
                          this.widget.myUser.address ?? "-",
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (NearbyUsersControllers.getForThisUserUploads(widget.myUser.id)
                  .isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                          "${S.of(context).totalUploads}: ${NearbyUsersControllers.getForThisUserUploads(widget.myUser.id).length}"),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}

class ListUsersInDatabase extends StatelessWidget {
  final List<MyUser> myUsers;

  const ListUsersInDatabase({Key? key, required this.myUsers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableViewObject(
        list: [for (final x in myUsers) x.toMap()],
        keys: ['name', 'phoneNumber', 'address'],
        titles: ['Name', 'Phone', 'Address']);
  }
}
