import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/generated/l10n.dart';
import 'package:fst_anti_covid_project/models/Person.dart';

class MyPersonView extends StatefulWidget {
  final Person person;

  const MyPersonView({Key? key, required this.person}) : super(key: key);

  @override
  _MyPersonViewState createState() => _MyPersonViewState();
}

class _MyPersonViewState extends State<MyPersonView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
        title: Text(this.widget.person.name),
        // trailing: SimpleActionButton(
        //   elevation: 0,
        //   width: 100,
        //   height: 30,
        //   isLoading: widget.person.isLoading,
        //   onTap: () {
        //     NearbyUsersControllers.getUploadsForUser(widget.person)
        //         .then((value) {
        //       setState(() {});
        //     });
        //     setState(() {});
        //   },
        //   child: Center(child: Text(S.of(context).getUploads)),
        // ),
        subtitle: SizedBox(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                "${S.of(context).userPhone}: ${this.widget.person.phoneNumber ?? " - "}",
                maxLines: 1,
              ),
              SelectableText(
                "${S.of(context).userEmail}: ${this.widget.person.email ?? " - "}",
                maxLines: 1,
              ),
              SelectableText(
                this.widget.person.address ?? "-",
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
