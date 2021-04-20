import 'package:com_huthaifa_glints/screens/login/google_button_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: GoogleSigninButton(),
        ),
      ),
    );
  }
}
