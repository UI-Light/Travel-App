import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuth =
      FirebaseAuth.instance; //instance of firebaseAuth class
  final GoogleSignIn googleSignIn =
      GoogleSignIn(); //instance of firebaseAuth class

  GoogleSignInAccount? _user; //field for user that has signed in
  GoogleSignInAccount get user =>
      _user!; //getter method to get the google signin account

  //signin with google
  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn
          .signIn(); //shows pop up and selected account is assigned to google user
      if (googleUser == null) return null;
      _user = googleUser;

      final googleAuth = await googleUser
          .authentication; //obtain auth details from the request

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
  }

  // SignIn with Email and password
  Future signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('this worked');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  //signup to with email and password
  Future signUp({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  //signout
  Future logout() async {
    //await googleSignIn.disconnect();
    firebaseAuth.signOut();
  }
}
