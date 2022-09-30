class AuthService {
  final User user =
      User(userName: "Sumith", photoURL: null, email: "sumithpd@gmail.com");
  //FirebaseAuth.instance.currentUser

  /// Anonymous Firebase login
  Future<void> anonymousLogin() async {}

  Future<void> googleLogin() async {}

  Future<void> signOut() async {}
  void loginUser(String userName) {
    try {} catch (e) {
      print(e);
    }
  }

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
