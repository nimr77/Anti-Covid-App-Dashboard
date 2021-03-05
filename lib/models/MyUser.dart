import 'package:fst_anti_covid_project/models/Person.dart';

class MyUser implements Person {
  String id;
  String name;
  String email;
  String phoneNumber;
  String token;

  @override
  String address;
}

// class MyUser {
//   String id;
//   String name;
//   String email;
//   String phoneNumber;
//   String requestId;
//   String phoneCode;
//   // List<Map> myTempListID;
//   // TempID currentID;
//   // int currentIdIndex;
//   static MyUser me;
//   MyUser(this.name, this.email, this.phoneNumber) {
//     me = this;
//   }
//
//   ///this will send the data from the [MyUser.me] to the [MyaAPIUtil.SMSAPI]
//   ///and the user will get sms from the server, and the app must show a dialog to
//   ///get the data from the user see [CheckCode]
//   Future<bool> sendThePhoneNumberToValidate() async {
//     try {
//       this.requestId =
//           await MyDataBaseActions.sendPhoneNumber(MyUser.me.phoneNumber);
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//     return true;
//   }
//
//   ///This will get the cTemp list from the code
//   ///it will use [TempID.createFromListMap] static function to set the result of
//   ///[MyDataBaseActions.verifyUserPhoneNumber]
//   Future<bool> sendCodeAndGetListTempID() async {
//     TempID.createFromListMap(await MyDataBaseActions.verifyUserPhoneNumber(
//         this.phoneNumber, this.requestId, this.phoneCode));
//     return true;
//   }
//
//   ///This will handel the  the user after doing the input in the [MyUser.me] object
//   ///and Set the data into [MyaAPIUtil.UserChecked] and set the value of [MyaAPIUtil.UserChecked] to true
//   ///if everything is good otherwise its false
//   Future handleVarifyingTheUser() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     if (await sendCodeAndGetListTempID()) {
//       await sp.setString(
//           MyaAPIUtil.WhereToSaveTempID, json.encode(TempID.toListMap()));
//       await sp.setBool(MyaAPIUtil.UserChecked, true);
//       await sp.setString("UserPhone", this.phoneNumber);
//     } else {
//       await sp.setBool(MyaAPIUtil.UserChecked, false);
//     }
//   }
//
//   ///This will check if the userID is checked
//   static Future<bool> getIfUserChecked() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     if (sp.containsKey(MyaAPIUtil.UserChecked)) {
//       return sp.getBool(MyaAPIUtil.UserChecked);
//     }
//     return false;
//   }
//
//   // ///This will get the current ID from the list, if all expired or
//   // ///no More IDs will return false
//   // static bool getTheID() {
//   //   var currentTime = DateTime.now();
//   //   for (var element in TempID.allID) {
//   //     var start = DateTime.fromMillisecondsSinceEpoch(element.startTime);
//   //     var end = DateTime.fromMillisecondsSinceEpoch(element.endTime);
//   //     if (currentTime.isAfter(start) || currentTime.isAtSameMomentAs(start)) {
//   //       if (currentTime.isBefore(end)) {
//   //         // MyUser.me.currentID = element;
//   //         MyUser.me.currentIdIndex = TempID.allID.indexOf(element);
//   //         return true;
//   //       }
//   //     }
//   //   }
//   //   return false;
//   // }
//
//   ///this will keep Streaming and getting the Data from the list
//   ///and assign them throw [getTheID] function
//   ///it will get true when it been assign
//   ///false when it couldn't assign
//   // static Stream<bool> idHandlerWithTime() async* {
//   //   if (MyUser.me != null && TempID.allID.length != 0) {
//   //     while (true) {
//   //       if (!getTheID()) break;
//   //       yield true;
//   //       await Future.delayed(Duration(minutes: 15));
//   //     }
//   //   }
//   //   yield false;
//   // }
//
//   ///This will send a new request for the temp ID as should be as expected the last Temp Id
//   ///and set it into the [SharedPreferences]
//   // Future handlerNewTempID() async {
//   //   try {
//   //     TempID.allID.clear();
//   //     TempID.createFromListMap(
//   //         await MyDataBaseActions.requestNewTempID(this.currentID.tempId));
//   //     var sp = await SharedPreferences.getInstance();
//   //     await sp.setString(
//   //         MyaAPIUtil.WhereToSaveTempID, json.encode(TempID.toListMap()));
//   //     // this.currentID = TempID.allID[0];
//   //   } catch (e) {}
//   // }
//
//   // ///This Future will run forever
//   // ///if it stops, then there is an error
//   // ///TODO add a checker if it stopped
//   // Future startAdvertisingTheUser() async {
//   //   if (this.currentID != null) {
//   //     await MyNearByFunctions.restartWorking();
//   //     await idHandlerWithTime().listen((event) async {
//   //       if (!event) {
//   //         //Request new TempID
//   //         ///   await MyNearByFunctions.stopWorking();
//   //         await Future.delayed(Duration(seconds: 15));
//   //         await handlerNewTempID();
//   //         startAdvertisingTheUser();
//   //       } else {
//   //         //Here we Restart the advertising
//   //         await MyNearByFunctions.restartWorking();
//   //       }
//   //     }).asFuture();
//   //   }
//   //   // startAdvertisingTheUser();
//   // }
//
//   ///This will handel uploading the file
//   /// it will get the token by using [MyDataBaseActions.getToken]
//   /// and then prepare the file to be uploaded [MyDataFileJsonFunction.prepareTheFileToBeUploaded]
//   /// and then uploading the file [MyDataBaseActions.sendFile]
//   Future uploadTheFile() async {
//     try {
//       String token = await MyDataBaseActions.getToken();
//       File theFile = await MyDataFileJsonFunction.prepareTheFileToBeUploaded();
//       await MyDataBaseActions.sendFile(theFile, token);
//     } catch (e) {
//       MyGlobalKeys.myGlobalScaKey.currentState.showSnackBar(SnackBar(
//         content: Text(S.current.CantConnectToTheServer),
//         duration: Duration(seconds: 4),
//       ));
//     }
//   }
//
//   Map toMap() => {
//         "UserName": this.name,
//         "UserPhone": this.phoneNumber,
//         "UserEmail": this.email,
//         "id": this.id
//       };
// }
