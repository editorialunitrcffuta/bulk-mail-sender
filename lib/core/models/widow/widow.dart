import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:math';

import '../../../utils/data_helper.dart';

part 'widow.g.dart';

@JsonSerializable(explicitToJson: true)
class Widow extends Equatable {
  String? id;
  String? fullName;
  DateTime? dob;
  String? state;
  String? homeTown;
  String? address;
  String? lga;
  String? occupation;
  String? employmentStatus;
  String? phoneNumber;
  String? husbandName;
  String? husbandBereavementDate;
  String? husbandOccupation;
  int? yearOfMarriage;
  int? numberOfChildren;
  String? senatorialZone;
  String? categoryBasedOnNeeds,
      accountNumber,
      accountName,
      bankName,
      ngoMembership,
      ngoName,
      receivedBy;
  DateTime? registrationDate;
  int? oneOrTwo;

  Widow(
      {this.id,
      this.fullName,
      this.dob,
      this.state,
      this.homeTown,
      this.address,
      this.lga,
      this.occupation, //todo:graph 2
      this.employmentStatus,
      this.phoneNumber,
      this.husbandName,
      this.husbandOccupation,
      this.husbandBereavementDate,
      this.yearOfMarriage,
      this.numberOfChildren,
      this.senatorialZone,
      this.categoryBasedOnNeeds,
      this.accountNumber,
      this.accountName,
      this.bankName,
      this.ngoMembership,
      this.ngoName,
      this.receivedBy,
      this.registrationDate,
      this.oneOrTwo});

  factory Widow.fromJson(Map<String, dynamic> json) => _$WidowFromJson(json);

  Map<String, dynamic> toJson() => _$WidowToJson(this);

  String generateId(int index) {
    String genId = "";
    for (String word in lga?.split(' ') ?? []) {
      genId += word.substring(0, 1).toUpperCase();
    }
    return genId + "${index.matchLength(5)}";
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        fullName,
        dob,
        state,
        homeTown,
        address,
        lga,
        occupation,
        employmentStatus,
        phoneNumber,
        husbandName,
        husbandBereavementDate,
        husbandOccupation,
        yearOfMarriage,
        numberOfChildren,
        senatorialZone,
        accountNumber,
        accountName,
        bankName,
        ngoName,
        ngoMembership,
        ngoName,
        receivedBy,
        registrationDate,
        oneOrTwo,
      ];

  int? get yearsInMarriage {
    if (husbandBereavementDate != null &&
        yearOfMarriage != null &&
        husbandBereavementDate!.toDate != null) {
      return husbandBereavementDate!.toDate!.year - yearOfMarriage!;
    } else {
      return null;
    }
  }

  int? get age {
    if (dob != null) {
      return DateTime.now().year - dob!.year;
    } else {
      return null;
    }
  }

  @override
  String toString() {
    return 'Widow(id: $id, fullName: $fullName, dob: $dob, state: $state, homeTown: $homeTown, address: $address, lga: $lga, occupation: $occupation, employmentStatus: $employmentStatus, phoneNumber: $phoneNumber, husbandName: $husbandName, husbandBereavementDate: $husbandBereavementDate, husbandOccupation: $husbandOccupation, yearOfMarriage: $yearOfMarriage, numberOfChildren: $numberOfChildren, senatorialZone: $senatorialZone, categoryBasedOnNeeds: $categoryBasedOnNeeds, accountNumber: $accountNumber, accountName: $accountName, bankName: $bankName, ngoMembership: $ngoMembership, ngoName: $ngoName, receivedBy: $receivedBy, registrationDate: $registrationDate, oneOrTwo: $oneOrTwo)';
  }
}

extension on int {
  String matchLength(int digits) {
    int standardLength = pow(10, digits).floor().toString().length;
    if (toString().length < standardLength) {
      int zeros = standardLength - toString().length;
      return "${'0' * zeros}${toString()}";
    }
    return toString();
  }
}

extension on String {
  DateTime? get toDate {
    try {
      int day = int.parse(split(' ').first);
      int month = monthNum(split(' ')[1].replaceAll(',', ''));
      int year = int.parse(split(' ').last.trim());
      return DateTime(year, month, day);
    } catch (e) {
      print("Error Occurred while parsing date: $e");
    }
  }
}
