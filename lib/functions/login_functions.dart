import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_huthaifa_glints/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

///Class holding login functions, then handling the results of this login. First we authenticate with google, if authenticated susseccfully, I'll take the data returned fromt he user credential, and create a user with this data in our database. If the user doesn't exist, we create a user then return it, if it exists, we return the user.
class LoginFunctions {
  ///Trigers sign in with google function
  Future<UserCredential?> signInWithGoogle() async {
    // Triggers the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await (GoogleSignIn().signIn());

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ) as GoogleAuthCredential;

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
      return null;
    }
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  ///Retrieves user from firebase, or creates a new one if the user doesn't exsits.
  Future<AppUser> loginuser() async {
    UserCredential? _userCredential = await signInWithGoogle();
    if (_userCredential == null) return AppUser();
    return await (users
        .where('email', isEqualTo: _userCredential.user?.email)
        .get()
        .then((QuerySnapshot firebaseResult) async {
      //if the user exists, we will get one value, and not an empty "docs" list, we take the first index, because it's only one result.
      if (firebaseResult.docs.isNotEmpty) {
        return AppUser.fromMap(firebaseResult.docs[0].data());
      } else {
        return await createUser(_userCredential);
      }
    }).catchError(
      (error) {
        print('Failed to sign in or signup, error:  $error');
        throw error;
      },
    ));
  }

  Future<AppUser> createUser(UserCredential userCredential) async {
    AppUser _appUser = AppUser();
    User? _firebaseUser = userCredential.user;
    if (_firebaseUser == null) return _appUser;

    _appUser.id = _firebaseUser.uid;
    _appUser.email = _firebaseUser.email ?? "error in email";
    _appUser.userName = _firebaseUser.displayName ?? "error in usename";
    _appUser.image = _firebaseUser.photoURL ?? 'https://upload.wikimedia.org/wikipedia/commons/d/df/GLINTS_LOGO293.png';

    await users.doc(_appUser.id).set(_appUser.toMap()).catchError(
      (error) {
        print('Failed to sign in or signup, error:  $error');
        throw error;
      },
    );
    return _appUser;
  }

  //Signs out user from google and current FirebaseAuth instance
  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();

    print("User Signed Out");
  }
}
