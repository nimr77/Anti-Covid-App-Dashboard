import 'package:flutter/material.dart';
import 'package:fst_anti_covid_project/models/Person.dart';

class MyNearbyUser implements Person {
  String id;
  Map<String, double> lastDetect;
  List<MyNearbyScanned> myScanned() =>
      MyNearbyScanned.listOfMe.where((element) => element.userId == this.id);

  @override
  String address;

  @override
  String email;

  @override
  String name;

  @override
  String phoneNumber;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  MyNearbyUser({
    @required this.id,
    @required this.lastDetect,
    @required this.address,
    @required this.email,
    @required this.name,
    @required this.phoneNumber,
  });

  MyNearbyUser copyWith({
    String id,
    Map<String, double> lastDetect,
    String address,
    String email,
    String name,
    String phoneNumber,
  }) {
    return new MyNearbyUser(
      id: id ?? this.id,
      lastDetect: lastDetect ?? this.lastDetect,
      address: address ?? this.address,
      email: email ?? this.email,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  String toString() {
    return 'MyNearbyUser{id: $id, lastDetect: $lastDetect, address: $address, email: $email, name: $name, phoneNumber: $phoneNumber}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyNearbyUser &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          lastDetect == other.lastDetect &&
          address == other.address &&
          email == other.email &&
          name == other.name &&
          phoneNumber == other.phoneNumber);

  @override
  int get hashCode =>
      id.hashCode ^
      lastDetect.hashCode ^
      address.hashCode ^
      email.hashCode ^
      name.hashCode ^
      phoneNumber.hashCode;

  factory MyNearbyUser.fromMap(Map<String, dynamic> map) {
    return new MyNearbyUser(
      id: map['UserId'] as String,
      lastDetect: map['lastDetect'] as Map<String, double>,
      address: map['address'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'id': this.id,
      'lastDetect': this.lastDetect,
      'address': this.address,
      'email': this.email,
      'name': this.name,
      'phoneNumber': this.phoneNumber,
    } as Map<String, dynamic>;
  }

//</editor-fold>
  static final listOfMe = <MyNearbyUser>[];
}

///this the number of scanned that been done for a user
///[location] is can be spilt with (,)
class MyNearbyScanned {
  String userId;
  String location;
  String distance;
  String whenBeenScanned;
  int forHowLong;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  MyNearbyScanned({
    @required this.userId,
    @required this.location,
    @required this.distance,
    @required this.whenBeenScanned,
    @required this.forHowLong,
  });

  MyNearbyScanned copyWith({
    String userId,
    String location,
    String distance,
    String whenBeenScanned,
    int forHowLong,
  }) {
    return new MyNearbyScanned(
      userId: userId ?? this.userId,
      location: location ?? this.location,
      distance: distance ?? this.distance,
      whenBeenScanned: whenBeenScanned ?? this.whenBeenScanned,
      forHowLong: forHowLong ?? this.forHowLong,
    );
  }

  @override
  String toString() {
    return 'MyNearbyScanned{userId: $userId, location: $location, distance: $distance, whenBeenScanned: $whenBeenScanned, forHowLong: $forHowLong}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyNearbyScanned &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          location == other.location &&
          distance == other.distance &&
          whenBeenScanned == other.whenBeenScanned &&
          forHowLong == other.forHowLong);

  @override
  int get hashCode =>
      userId.hashCode ^
      location.hashCode ^
      distance.hashCode ^
      whenBeenScanned.hashCode ^
      forHowLong.hashCode;

  factory MyNearbyScanned.fromMap(Map<String, dynamic> map) {
    return new MyNearbyScanned(
      userId: map['userId'] as String,
      location: map['location'] as String,
      distance: map['distance'] as String,
      whenBeenScanned: map['whenBeenScanned'] as String,
      forHowLong: map['forHowLong'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'userId': this.userId,
      'location': this.location,
      'distance': this.distance,
      'whenBeenScanned': this.whenBeenScanned,
      'forHowLong': this.forHowLong,
    } as Map<String, dynamic>;
  }

//</editor-fold>

  static final listOfMe = <MyNearbyScanned>[];
}
