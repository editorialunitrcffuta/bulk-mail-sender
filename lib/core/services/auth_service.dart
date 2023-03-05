import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> login({String? email, String? password}) async {
    User? user;
    try {
      if(email != null && password != null){
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        user = userCredential.user;
        if(user != null){
          return user;
        } else {
          throw Exception('Could not find user');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (e.code == 'user-not-found') {
        throw('There is no user record corresponding to the email entered.');
      } else if (e.code == 'invalid-email') {
        throw('The email address is badly formatted!');
      } else if(e.code == "network-request-failed"){
        throw('The password provided is too weak.');
      } else if(e.code == "wrong-password"){
        throw('The password provided is incorrect.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }

  signOut(){
    _auth.signOut();
    print("Signed Out");
  }
}
