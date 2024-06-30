import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future<User?> authenticate() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      final userCredential = await auth.signInWithPopup(authProvider);
      return userCredential.user;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
