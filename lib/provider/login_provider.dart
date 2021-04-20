import 'package:com_huthaifa_glints/functions/login_functions.dart';
import 'package:com_huthaifa_glints/models/user_model.dart';
import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier {
  bool _isSigningIn = false;
  bool get isSigningIn => _isSigningIn;
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;
  AppUser _appUser = AppUser();
  AppUser get user => _appUser;

  void googleSignIn() async {
    _isSigningIn = true;
    notifyListeners();
    _appUser = await LoginFunctions().loginuser();
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
