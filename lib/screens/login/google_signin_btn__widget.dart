import 'package:com_huthaifa_glints/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GoogleSigninButton extends StatelessWidget {
  const GoogleSigninButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _loginState = Provider.of<LoginState>(context, listen: true);

    return !_loginState.isSignedIn
        ? _loginState.isSigningIn
            ? CircularProgressIndicator()
            : GestureDetector(
                onTap: () => _loginState.googleSignIn(),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  height: 50,
                  width: 280,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Container(
                      margin: EdgeInsets.fromLTRB(0, 7, 0, 12),
                      child: Image.asset("assets/images/google_icon.png"),
                    ),
                    title: Text('Sign in with Google', textAlign: TextAlign.center),
                  ),
                ),
              )
        : ElevatedButton(
            child: Text('Tap to Logout'),
            onPressed: () => _loginState.signOut(),
          );
  }
}
