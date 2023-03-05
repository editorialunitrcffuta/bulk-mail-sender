import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../app/app_setup.locator.dart';
import '../../utils/date_formatter.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';

class AuthRepo {
  FirebaseFirestore firestoreService = FirebaseFirestore.instance;
  final _fsService = locator<FirestoreService>();
  final _authService = locator<AuthService>();

  login({String? email, String? password}) async {
    User? currentUser =
        await _authService.login(email: email, password: password);
    DateTime now = DateTime.now();
    if (currentUser != null) {
      /// create array to save admin login session using setOptions on firebase
      // final snapshot =
      //     await firestoreService.collection('').doc(currentUser.uid).get();
      // final saveTimeStamp =
      await _fsService.adminCollection.doc(currentUser.uid).set({
        "timeStamp": FieldValue.arrayUnion(
          [DateFormatter.dateFormatter(now)],
        ),
      });
      // if (snapshot.exists) {
      //   print("Login successful");
      //   // firestoreService.setUser(snapshot.data() as Map<String, dynamic>);
      // }
      //TODO: implement checking db for current user
    }
  }
}
