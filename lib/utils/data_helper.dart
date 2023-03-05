import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:math' as math;

import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';

final List<int> numOfChildren = [1, 2, 3, 4, 5, 6, 7];
final List<int> yearsInMarriage = List.generate(20, (index) => index + 1);

final List<String> employmentStatuses = [
  'Employed',
  'Self-Employed',
  'Pensioner',
  'Unemployed',
];

final List<String> typeOfOccupationStatus = [
  'Professional',
  'Clerical',
  'Sales',
  'Skilled Manual',
  'Unskilled Manual',
  'Agriculture'
];

final List<String> doYouHaveSkillStatus = ["Yes", "No"];

final List<String> levelOfEducationStatus = [
  'No Education',
  'Primary Education',
  'Secondary Education',
  'Tertiary',
];

final List<String> maritalStatuses = [
  "Single",
  "Married",
  "Separated",
  "Divorced",
  "Widowed"
];

final List<String> genders = ['Male', 'Female'];

final List<String> describeYourSkillStatus = [
  "Digital Media",
  'Catering and Baking',
  'Fashion',
  'Agriculture'
];

final List<String> localGovts = [
  'Owo',
  'Ose',
  'Ondo West',
  'Ondo East',
  'Okitipupa',
  'Odigbo',
  'Irele',
  'Ile Oluji/Oke Igbo',
  'Ilaje',
  'Ifedore',
  'Idanre',
  'Ese Odo',
  'Akure South',
  'Akure North',
  'Akoko North West',
  'Akoko North East',
  'Akoko South West',
  'Akoko South East',
];

// Future<void> downloadData(QuerySnapshot<Map<String, dynamic>> snapshot) async {
//   Object widowsDataJson = snapshot.docs.map((e) => e.data()).toList();
//   log(json.encode(widowsDataJson));
//
//   Uint8List bytes = jsonToUnit8List(widowsDataJson);
//
//   await FileSaver.instance
//       .saveFile("Widows Data", bytes, "json", mimeType: MimeType.JSON);
// }
//
// Future<void> forgeData(List<Map<String, dynamic>> oldDataJson) async {
//   List<Map<String, dynamic>> addData = await compute(_forgeData, oldDataJson);
//   oldDataJson.addAll(addData);
//
//   Uint8List bytes = jsonToUnit8List(oldDataJson);
//
//   await FileSaver.instance.saveFile(
//       "Forged Widows Data ${oldDataJson.length}", bytes, "json",
//       mimeType: MimeType.JSON);
// }

// Future<void> saveDataAsJson(List<Map<String, dynamic>> oldDataJson) async {
//   Uint8List bytes = jsonToUnit8List(oldDataJson);
//
//   await FileSaver.instance.saveFile("Extracted Children Data", bytes, "json",
//       mimeType: MimeType.JSON);
// }
//
// Future<void> saveDataAsCsv(List<List<String>> dataJson) async {
//   List<String> allRows = [];
//   for (List<String> row in dataJson) {
//     allRows.add(row.join(','));
//   }
//   String data = allRows.join('\\n');
//
//   List<int> list = data.codeUnits;
//   Uint8List bytes = Uint8List.fromList(list);
//
//   await FileSaver.instance.saveFile("Extracted Children Data", bytes, "json",
//       mimeType: MimeType.CSV);
// }
//
// List<Map<String, dynamic>> _forgeData(List<Map<String, dynamic>> oldDataJson) {
//   int prevDataLength = oldDataJson.length;
//   List<Map<String, dynamic>> addData = [];
//   List<String> lGAs = localGovts;
//   lGAs.remove("Akoko North East");
//   List<String> occupations = OccupationType.values
//       .map((e) => OccupationDataHolder(type: e).fullTitle)
//       .toList();
//   math.Random rand = math.Random();
//
//   for (String lga in lGAs.toSet()) {
//     int lgaSize = rand.nextInt(prevDataLength) + 100;
//     print("Expected LGA size: $lga: $lgaSize");
//     List<Map<String, dynamic>> lgaData = [];
//     for (int i = 0; i < lgaSize; i++) {
//       int oldDataIndex =
//           rand.nextInt(i < prevDataLength ? i + 1 : prevDataLength - 1);
//       Map<String, dynamic> newData = {}..addAll(oldDataJson[oldDataIndex]);
//       newData["lga"] = lga;
//       newData["id"] = lga.initialized + i.format;
//       newData["numberOfChildren"] = i % 9;
//       newData["employmentStatus"] =
//           employmentStatuses[i % employmentStatuses.length];
//       newData["husbandOccupation"] = occupations[i % occupations.length];
//       newData["occupation"] = occupations[i % occupations.length];
//       lgaData.add(newData);
//     }
//     print("Final LGA size: $lga: $lgaSize");
//     addData.addAll(lgaData);
//   }
//
//   print("Length of generated data: ${addData.length}");
//   return addData;
// }
//
// Future<File> writeJson(String filePath, Object object) async {
//   print("hello world");
//   final File file = File(filePath); //load the json file
//   // await readJson(file); //read data from json file
//
//   return await file
//       .writeAsString(json.encode(object)); //write (the whole list) to json file
// }
//
// Future<List<Map<String, dynamic>>> readJson(File file) async {
//   String contents = await file.readAsString();
//   List<Map<String, dynamic>> jsonResponse = jsonDecode(contents);
//
//   return jsonResponse;
// }
//
// Uint8List jsonToUnit8List(Object json) {
//   String encoded = jsonEncode(json);
//
//   List<int> list = encoded.codeUnits;
//   Uint8List bytes = Uint8List.fromList(list);
//   // String string = String.fromCharCodes(bytes);
//   // print(string);
//
//   return bytes;
// }
//
// Uint8List convertToBytes(Object json) {
//   String encoded = jsonEncode(json);
//
//   List<int> list = encoded.codeUnits;
//   Uint8List bytes = Uint8List.fromList(list);
//   // String string = String.fromCharCodes(bytes);
//   // print(string);
//
//   return bytes;
// }
//
// extension on String {
//   String get initialized => split(" ").map((e) => e.substring(0, 1)).join("");
// }
//
// extension on int {
//   String get format => (1000000 + this).toString().replaceFirst("1", "");
// }
//
int monthNum(String month) {
  return [
        "january",
        "february",
        "march",
        "april",
        "may",
        "june",
        "july",
        "august",
        "september",
        "october",
        "november",
        "december"
      ].indexOf(month.toLowerCase()) +
      1;
}
