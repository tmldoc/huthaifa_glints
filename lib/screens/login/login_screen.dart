import 'package:com_huthaifa_glints/screens/login/google_button_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network('https://upload.wikimedia.org/wikipedia/commons/d/df/GLINTS_LOGO293.png'),
            Text(
              'Twitter Clone Submission\n by: Huthaifa Muayyad',
              style: TextStyle(fontSize: 22),
            ),
            GoogleSigninButton(),
          ],
        ),
      ),
    );
  }
}
