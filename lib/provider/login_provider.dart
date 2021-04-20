import 'package:com_huthaifa_glints/functions/login_functions.dart';
import 'package:com_huthaifa_glints/models/user_model.dart';
import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier {
  ///To display a spinner if the current state is still authenticating.
  bool _isSigningIn = false;
  bool get isSigningIn => _isSigningIn;

  ///To notify the app that our user is signed in, then trigger UI changes
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  ///This is the AppUser object that we will be dealing with.
  AppUser _appUser = AppUser();
  AppUser get user => _appUser;

  void googleSignIn() async {
    _isSigningIn = true;
    notifyListeners();
    _appUser = await LoginFunctions().loginuser();
    ///If for any error to happen, this will not let the user in, because the default email is "", otherwise if the email field isn't empty, we have a susseccfull login.
    if (_appUser.email != "") _isSignedIn = true;
    _isSigningIn = false;
    notifyListeners();
  }

  void signOut() async {
    await LoginFunctions().signOut();
    _isSignedIn = false;
    notifyListeners();
  }
}
