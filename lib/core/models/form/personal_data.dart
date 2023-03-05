import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalDataForm {
  String id;
  String? fullName;
  String? gender;
  DateTime? dateOfBirth;
  String? stateOfOrigin;
  String? localGovernmentOfOrigin;
  String? homeTown;
  String? phoneNumber;
  String? email;
  String? address;

  /// The State of residence
  String? state;
  String? localGovernment;
  String? levelOfEducation;
  String? typeOfOccupation;
  bool? isSkillful;
  String? skillDescription;
  String? employmentStatus;
  String? skill;
  String? imageUrl;
  DateTime registrationDate;
  String? maritalStatus;
  String? senatorialDistrict;

  PersonalDataForm({
    required this.id,
    this.fullName,
    this.gender,
    this.dateOfBirth,
    this.stateOfOrigin,
    this.localGovernmentOfOrigin,
    this.homeTown,
    this.phoneNumber,
    this.email,
    this.address,
    this.state,
    this.localGovernment,
    this.levelOfEducation,
    this.typeOfOccupation,
    this.isSkillful,
    this.skillDescription,
    this.employmentStatus,
    this.skill,
    this.imageUrl,
    required this.registrationDate,
    this.maritalStatus,
    this.senatorialDistrict,
  });

  //TODO; add type later
  factory PersonalDataForm.fromJson(Map<String, dynamic> json) =>
      PersonalDataForm(
        id: json["id"] as String,
        fullName: json["fullName"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"] != null
            ? DateTime.parse(json["dateOfBirth"] as String)
            : null,
        stateOfOrigin: json["stateOfOrigin"],
        localGovernmentOfOrigin: json["localGovernmentOfOrigin"],
        homeTown: json["homeTown"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        address: json["address"],
        state: json["state"],
        localGovernment: json["localGovernment"],
        levelOfEducation: json["levelOfEducation"],
        typeOfOccupation: json["typeOfOccupation"],
        isSkillful: json["isSkillful"],
        skillDescription: json["skillDescription"],
        registrationDate: (json["registrationDate"] as Timestamp).toDate(),
        employmentStatus: json["employmentStatus"],
        imageUrl: json["imageUrl"],
        skill: json["skill"],
        maritalStatus: json["maritalStatus"],
        senatorialDistrict: json["senatorialDistrict"],
      );

  Map<String, dynamic> _toJson() => {
        'id': id,
        'name': fullName,
        'gender': gender,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'stateOfOrigin': stateOfOrigin,
        'localGovernmentOfOrigin': localGovernmentOfOrigin,
        'homeTown': homeTown,
        'phone': phoneNumber,
        'email': email,
        'address': address,
        'state': state,
        'localGovernment': localGovernment,
        'levelOfEducation': levelOfEducation,
        'typeOfOccupation': typeOfOccupation,
        'isSkillful': isSkillful,
        'skillDescription': skillDescription,
        'registrationDate': registrationDate,
        'employmentStatus': employmentStatus,
        'imageUrl': imageUrl,
        'skill': skill,
        'maritalStatus': maritalStatus,
        'senatorialDistrict': senatorialDistrict,
      };

  Map<String, dynamic> toJson() => _toJson();

  @override
  String toString() {
    return 'PersonalDataForm{id: $id, fullName: $fullName, gender: $gender, dateOfBirth: $dateOfBirth, stateOfOrigin: $stateOfOrigin, localGovernmentOfOrigin: $localGovernmentOfOrigin, homeTown: $homeTown, phoneNumber: $phoneNumber, email: $email, address: $address, state: $state, localGovernment: $localGovernment, levelOfEducation: $levelOfEducation, typeOfOccupation: $typeOfOccupation, isSkillful: $isSkillful, skillDescription: $skillDescription, employmentStatus: $employmentStatus, skill: $skill, imageUrl: $imageUrl, registrationDate: $registrationDate, maritalStatus: $maritalStatus, senatorialDistrict: $senatorialDistrict}';
  }
}
