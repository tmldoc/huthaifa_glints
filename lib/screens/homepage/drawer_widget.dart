import 'package:com_huthaifa_glints/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _loginState = Provider.of<LoginState>(context, listen: true);
    return Container(
      width: MediaQuery.of(context).size.width * .65,
      color: Colors.grey.shade600,
      child: ListView(
        children: [
          Container(
            child: _loginState.isSignedIn
                ? Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        child: CircleAvatar(backgroundImage: NetworkImage(_loginState.user.image)),
                      ),
                      Text(
                        _loginState.user.userName,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gilroy',
                        ),
                      ),
                      Text(
                        '@' + _loginState.user.nickName,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gilroy',
                        ),
                      ),
                      Text(
                        _loginState.user.email,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gilroy',
                        ),
                      ),
                    ],
                  )
                : Text(
                    'Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
          ),
          ListTile(
            onTap: () {
              _loginState.signOut();
              Navigator.of(context).pop();
            },
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: Text("Logout", style: TextStyle(color: Colors.black)),
          )
        ],
      ),
    );
  }
}
