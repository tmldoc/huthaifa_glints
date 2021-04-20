import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_huthaifa_glints/functions/id_generator.dart';
import 'package:com_huthaifa_glints/functions/tweet_functions.dart';
import 'package:com_huthaifa_glints/models/tweet_model.dart';
import 'package:com_huthaifa_glints/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewTweet extends StatefulWidget {
  @override
  _NewTweetState createState() => _NewTweetState();
}

class _NewTweetState extends State<NewTweet> {
  bool _isLoading = false;
  TextEditingController _tweetController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Post A New Tweet'),
      content: _isLoading
          ? CircularProgressIndicator()
          : Container(
              child: TextFormField(
                maxLines: 10,
                minLines: 1,
                autofocus: true,
                maxLength: 280,
                controller: _tweetController,
              ),
            ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            setState(() {
              _isLoading = true;
            });
            Tweet _tweet = Tweet(
                id: generateId(),
                body: _tweetController.text,
                timeStamp: Timestamp.now(),
                appUser: Provider.of<LoginState>(context, listen: false).user);
            await publishNewTweet(_tweet).then(
              (value) {
                setState(() {
                  _isLoading = false;
                });
                Navigator.pop(context);
              },
            );
            setState(() {
              _isLoading = false;
            });
          },
          child: Text(
            'Publish',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
