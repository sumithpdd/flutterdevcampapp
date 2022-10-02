import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // final User user =
  //     User(userName: "Sumith", photoURL: null, email: "sumithpd@gmail.com");
  //I missed this during demo
  //we need to listedn to any authstatechange so that we can redirect user to correct screen.void name(params) {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance.currentUser;

  /// Anonymous Firebase login
  Future<void> anonymousLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException {
      // handle error
    }
  }

  Future<void> googleLogin() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(authCredential);
    } on FirebaseAuthException catch (e) {
      // handle error
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void loginUser(String userName) {}

  Future<bool> isLoggedIn() async {
    return true;
  }
}

class User {
  final String userName;
  String? photoURL;
  final String? email;
  User({required this.userName, required this.photoURL, required this.email});
  get displayName => userName;
}
