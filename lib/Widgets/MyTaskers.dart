import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fst_anti_covid_project/Dialogs/AddingDialog.dart';

import './ListIteamViewer.dart';

/// its still under development
class MyTask<T> {
  String title;
  String? id;
  String onCompleteMessage;
  Stream<MyTask<T>>? task;
  int currentProgress;
  int ofWhatTotal;
  Function(BuildContext context, T) onComplete;

  MyTask(
      {required this.title,
      required this.id,
      required this.onCompleteMessage,
      this.task,
      required this.currentProgress,
      required this.ofWhatTotal,
      required this.onComplete});

  static final _listOfMe = StreamController<List<MyTask>>();

  static Future addingTask(MyTask myTask) async {
    currentListOfTasks.add(myTask);
    _listOfMe.sink.add(currentListOfTasks);
  }

  static Future removeTask(MyTask myTask) async {
    currentListOfTasks.removeWhere((element) => element.id == myTask.id);
    _listOfMe.sink.add(currentListOfTasks);
  }

  static final currentListOfTasks = <MyTask>[];
}

/// this will contain the task progress as it is and show the loading beside the title, and the tasked stream
class MyTaskForm extends StatelessWidget {
  final MyTask myTask;

  const MyTaskForm({Key? key, required this.myTask}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MyTask>(
      stream: myTask.task!.asBroadcastStream(),
      builder: (context, snap) {
        bool done = snap.data!.currentProgress == snap.data!.ofWhatTotal;

        return AnimatedSwitcher(
          duration: Duration(milliseconds: 700),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            key: ValueKey(done.toString() + myTask.id!),
            child: done
                ? Row(
                    children: [
                      Expanded(child: Text("${snap.data!.onCompleteMessage}")),
                      Icon(
                        Icons.done,
                        color: Colors.green,
                      )
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${snap.data!.title} ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: LinearProgressIndicator(
                          value: snap.data!.currentProgress /
                              snap.data!.ofWhatTotal,
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
      initialData: myTask,
    );
  }
}

class MyListOfTasks extends StatefulWidget {
  @override
  _MyListOfTasksState createState() => _MyListOfTasksState();
}

class _MyListOfTasksState extends State<MyListOfTasks> {
  @override
  void initState() {
    // MyTask._listOfMe.stream.asBroadcastStream().forEach((element) {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyListItemViewer<MyTask>(
      key: ValueKey("Uploader"),
      items: MyTask.currentListOfTasks,
      builder: (_, myTask) => MyTaskForm(
        myTask: myTask,
        key: ValueKey(myTask.id),
      ),
    );
    // return StreamBuilder<List<MyTask>>(
    //     stream: MyTask._listOfMe.stream.asBroadcastStream(),
    //     initialData: MyTask.currentListOfTasks,
    //     builder: (_, snap) {
    //       return
    //     });
  }
}

// show tasks in a dialog
//show them in a mini bar
Future showTasksInMiniModelBar(BuildContext context) => showModalBottomSheet(
    shape: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    context: context,
    builder: (_) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyListOfTasks(),
        ));
Future showTasksAsDialog(BuildContext context) => MyAddingDialog(
        child: MyListOfTasks(),
        title: "",
        height: MediaQuery.of(context).size.height * 0.4)
    .showMyDialog(context);

Future showThisTaskInLoadingEsy(MyTask myTask) async {
  EasyLoading.show(
      indicator: Container(
        height: 100,
        width: 150,
        child: SpinKitCircle(
          color: Colors.white,
        ),
      ),
      status: myTask.title);
  await for (final x in myTask.task!) {
    EasyLoading.showProgress((x.currentProgress / x.ofWhatTotal),
        status: x.title);
  }
  await EasyLoading.showSuccess(myTask.onCompleteMessage,
      dismissOnTap: false, duration: Duration(milliseconds: 2000));
}
