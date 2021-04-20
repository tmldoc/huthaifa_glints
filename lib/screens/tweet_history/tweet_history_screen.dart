
import 'package:flutter/material.dart';

class TweetHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Tweet History'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'History',
            ),
          ],
        ),
      ),
    );
  }
}
