import 'package:cmarket/Models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  //Model generator

  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //Anonimously
  /*Future signInAnon() async {
    try {
      AuthResult result = await auth.signInAnonymously();
      FirebaseUser user = result.user;

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }*/

//SignIn Email & Pwd

Future signInEmailPwd(String email, String pwd) async{
  try {
    AuthResult result = await auth.signInWithEmailAndPassword(email: email, password: pwd);
    FirebaseUser user = result.user;
    return _userFromFirebase(user);
  } catch (e) {
    print(e.toString());
    return null;
  }
}

  //Stream
  Stream<User> get user {
    return auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebase(user));
  }

  //SignOut
  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  //Email&Pwd
  Future registerInEPwd(String email, String pwd) async {
    try {
      AuthResult result = await auth.createUserWithEmailAndPassword(email: email, password: pwd);
      FirebaseUser user= result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
