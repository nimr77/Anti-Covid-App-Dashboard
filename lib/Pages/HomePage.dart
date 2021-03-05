import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fst_anti_covid_project/Service/FirebaseApp.dart';
import 'package:fst_anti_covid_project/Views/MyUserView.dart';
import 'package:fst_anti_covid_project/Widgets/TemplateCRUDPAge.dart';
import 'package:fst_anti_covid_project/models/MyUser.dart';

class MyUsersPage extends StatefulWidget {
  static String route = "Users";
  @override
  _MyUsersPageState createState() => _MyUsersPageState();
}

class _MyUsersPageState extends State<MyUsersPage> {
  String search = "";
  bool loading = true;
  @override
  void initState() {
    if (MyUser.listOfMe.isEmpty) {
      loading = true;
      MyFirebaseApp.loadingUsers().then((value) {
        setState(() {
          loading = false;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      child: MyTamplatViewPage(
        key: ValueKey(loading),
        title: Text("Users"),
        useSearchIcon: true,
        searchText: search,
        onSearch: (str) {
          setState(() {
            search = str;
          });
        },
        child: loading
            ? SpinKitCubeGrid(
                color: Colors.grey,
              )
            : ListUsersInDatabase(
                myUsers: MyUser.listOfMe
                    .where((element) => search.isEmpty
                        ? true
                        : element.name
                            .toUpperCase()
                            .contains(search.toUpperCase()))
                    .toList(),
              ),
      ),
    );
  }
}
