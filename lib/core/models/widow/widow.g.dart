// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'widow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Widow _$WidowFromJson(Map<String, dynamic> json) => Widow(
      id: json['id'] as String?,
      fullName: json['fullName'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      state: json['state'] as String?,
      homeTown: json['homeTown'] as String?,
      address: json['address'] as String?,
      lga: json['lga'] as String?,
      occupation: json['occupation'] as String?,
      employmentStatus: json['employmentStatus'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      husbandName: json['husbandName'] as String?,
      husbandOccupation: json['husbandOccupation'] as String?,
      husbandBereavementDate: json['husbandBereavementDate'] as String?,
      yearOfMarriage: json['yearOfMarriage'] as int?,
      numberOfChildren: json['numberOfChildren'] as int?,
      senatorialZone: json['senatorialZone'] as String?,
      categoryBasedOnNeeds: json['categoryBasedOnNeeds'] as String?,
      accountNumber: json['accountNumber'] as String?,
      accountName: json['accountName'] as String?,
      bankName: json['bankName'] as String?,
      ngoMembership: json['ngoMembership'] as String?,
      ngoName: json['ngoName'] as String?,
      receivedBy: json['receivedBy'] as String?,
      registrationDate: json['registrationDate'] == null
          ? null
          : DateTime.parse(json['registrationDate'] as String),
      oneOrTwo: json['oneOrTwo'] as int?,
    );

Map<String, dynamic> _$WidowToJson(Widow instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'dob': instance.dob?.toIso8601String(),
      'state': instance.state,
      'homeTown': instance.homeTown,
      'address': instance.address,
      'lga': instance.lga,
      'occupation': instance.occupation,
      'employmentStatus': instance.employmentStatus,
      'phoneNumber': instance.phoneNumber,
      'husbandName': instance.husbandName,
      'husbandBereavementDate': instance.husbandBereavementDate,
      'husbandOccupation': instance.husbandOccupation,
      'yearOfMarriage': instance.yearOfMarriage,
      'numberOfChildren': instance.numberOfChildren,
      'senatorialZone': instance.senatorialZone,
      'categoryBasedOnNeeds': instance.categoryBasedOnNeeds,
      'accountNumber': instance.accountNumber,
      'accountName': instance.accountName,
      'bankName': instance.bankName,
      'ngoMembership': instance.ngoMembership,
      'ngoName': instance.ngoName,
      'receivedBy': instance.receivedBy,
      'registrationDate': instance.registrationDate?.toIso8601String(),
      'oneOrTwo': instance.oneOrTwo,
    };
