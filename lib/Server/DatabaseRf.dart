import 'package:firebase/firestore.dart';
import 'package:fst_anti_covid_project/Server/FirebaseApp.dart';

class MyDatabaseRF {
  static CollectionReference food = MyFirebaseApp.db!.collection("Food");
  static CollectionReference category =
      MyFirebaseApp.db!.collection("Category");
  static CollectionReference extra = MyFirebaseApp.db!.collection("Extra");
  static CollectionReference extraGroups =
      MyFirebaseApp.db!.collection("ExtraGroups");
  static CollectionReference orders = MyFirebaseApp.db!.collection("orders");
  static CollectionReference feedBack =
      MyFirebaseApp.db!.collection("FeedBack");
  static CollectionReference reviews = MyFirebaseApp.db!.collection("Reviews");
  static CollectionReference statistics =
      MyFirebaseApp.db!.collection("Statistics");
  static CollectionReference cartState =
      MyFirebaseApp.db!.collection("CartState");
}
