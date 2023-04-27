import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../../app/app.dart';
import '../../app/app_setup.locator.dart';
import '../models/widow/widow.dart';
import '../services/database_service.dart';

class GetUsersListRepo {
  final _store = locator<DatabaseService>();
  static final GetUsersListRepo _instance = GetUsersListRepo._();
  List<MembersModel> _widowsData = [];
  

  List<MembersModel> get widowData => _widowsData;

  // Future<List<OccupationDataHolder>> get occupationData {
  //   return compute(extractOccupationData, _widowsData);
  // }
  //
  // Future<List<GraphDataHolder>> get localGovData {
  //   return compute(extractLocalGovData, _widowsData);
  // }
  //
  // Future<List<AgeRangeDataHolder>> get ageRangeData {
  //   return compute(extractAgeRangeData, _widowsData);
  // }
  //
  // Future<List<GraphDataHolder>> get employmentStatusData {
  //   return compute(extractEmploymentStatusData, _widowsData);
  // }
  //
  // Future<List<GraphDataHolder>> get childrenData {
  //   return compute(extractChildrenData, _widowsData);
  // }
  //
  // Future<List<GraphDataHolder>> get yearsInMarriageData {
  //   return compute(extractYearsInMarriageData, _widowsData);
  // }

  GetUsersListRepo._();

  static Future<GetUsersListRepo> getInstance() async {
    await _instance.initialise();
    return _instance;
  }

  Future<void> initialise() async {
    await getMembersData();
  }

  Future<void> getMembersData() async {
    // print('Getting widows data');
    //
    // late List<Map<String, dynamic>> dataJson;
    //
    // if (!App.useLocalData) {
    //   // try {
    //   //   // QuerySnapshot<Map<String, dynamic>> snapshot =
    //   //   //     await _store.getWidowsCollection();
    //   //   //
    //   //   // // await downloadData(snapshot);
    //   //   //
    //   //   // dataJson = snapshot.docs.map((e) => e.data()).toList();
    //   // } catch (e) {
    //   //   print("Error Occurred while loading data: ${e.toString()}");
    //   // }
    // } else {
    //   String data =
    //       await rootBundle.loadString("assets/files/Forged Widows Data.json");
    //   dataJson = await compute((String data) {
    //     return (jsonDecode(data) as List<dynamic>)
    //         .map((e) => e as Map<String, dynamic>)
    //         .toList();
    //   }, data);
    //
    //   // await forgeData(dataJson);
    // }
    //
    // _widowsData = await compute((List<Map<String, dynamic>> dataJson) {
    //   return dataJson.map((data) {
    //     return Widow.fromJson(data);
    //   }).toList();
    // }, dataJson);

    print('Success');
  }
}
