import 'package:com_huthaifa_glints/provider/login_provider.dart';
import 'package:com_huthaifa_glints/screens/tweet_history/tweet_history_screen.dart';
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
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: CircleAvatar(backgroundImage: NetworkImage(_loginState.user.image)),
              ),
              Text(
                _loginState.user.userName,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                '@' + _loginState.user.nickName,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                _loginState.user.email,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          )),
          ListTile(
            leading: Icon(
              Icons.history,
              color: Colors.black,
            ),
            title: Text("History", style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      // UserTitle(email: email, image: userProfilePicture, name: fullName),
                      TweetHistoryPage(),
                ),
              );
            },
          ),
          ListTile(
            onTap: () {
              _loginState.signOut();
              Navigator.of(context).pop();
            },
            leading: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: Text("Logout", style: TextStyle(color: Colors.black)),
          )
        ],
      ),
    );
  }
}
