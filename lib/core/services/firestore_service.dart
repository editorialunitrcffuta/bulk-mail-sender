import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/form/personal_data.dart';
import '../models/widow/widow.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  // static final _auth = FirebaseAuth.instance;
  static final _fsInstance = FirebaseFirestore.instance;
  String? _userId;
  final String _usersCollectionPath = 'users';
  final String childrenCollectionPath = "Children";
  final String adminCollectionPath = "Admins";
  DocumentReference<Map<String, dynamic>>? _userDocRef;
  CollectionReference<Map<String, dynamic>>? _usersCollection;
  late CollectionReference<Map<String, dynamic>> _adminCollection;

  CollectionReference<Map<String, dynamic>> get adminCollection => _adminCollection;


  void initialize(String userId) {
    _userId = userId;
    // _usersCollection = _fsInstance.collection(_usersCollectionPath);
     _adminCollection = _fsInstance.collection(adminCollectionPath);
    // _userDocRef = _usersCollection?.doc(userId);
  }



  Future<void> uploadWidowsInformation(
    Map<String, dynamic> jsonData,
    uid,
  ) async {
    await _fsInstance.collection(childrenCollectionPath).doc(uid).set(jsonData);
  }

  Future<List<PersonalDataForm>> getChildrenCollection() async {
    QuerySnapshot<Map<String, dynamic>> response =
        await _fsInstance.collection(childrenCollectionPath).limit(20).get();
    Map<String, List<String>> dataJson = {};

    // await extractAndDownloadData(response, dataJson);
    print("Number of people registered: ${response.docs.length}");
    List<PersonalDataForm> _childrenData = response.docs.map((e) {
      return PersonalDataForm.fromJson(e.data());
    }).toList();
    return _childrenData; // _widowsData;
  }

  Future<void> extractAndDownloadData(
      QuerySnapshot<Map<String, dynamic>> response,
      Map<String, List<String>> dataJson) async {
    for (Map<String, dynamic> doc
        in (response.docs.map((e) => e.data() as Map<String, dynamic>))) {
      for (MapEntry entry in doc.entries) {
        List<String> prevList = dataJson[entry.key] ?? [];
        prevList.add(entry.value?.toString() ?? "");
        dataJson[entry.key] = prevList;
      }
    }

    final data = response.docs.map((e) => (e.data() as Map<String, dynamic>)
        .map((key, value) => MapEntry(key, value?.toString() ?? "")));
    //Todo: change later
    // await saveDataAsJson(data.toList());

    // List<List<String>> data = [];
    // List<String> keysRow = dataJson.keys.toList();
    // data.add(keysRow);
    // for (int i = 0; i < dataJson.length; i++) {
    //   List<String> row = [];
    //   for (int j = 0; j < keysRow.length; j++) {
    //     row.add(dataJson[keysRow[j]]![i]);
    //   }
    //   data.add(row);
    // }
    //
    // await saveDataAsCsv(data);

    print("Number of Data converted: ${data.length}");
  }
}
