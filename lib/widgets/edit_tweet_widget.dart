import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_huthaifa_glints/functions/tweet_functions.dart';
import 'package:com_huthaifa_glints/models/tweet_model.dart';
import 'package:flutter/material.dart';

class EditTweet extends StatefulWidget {
  Tweet tweet;
  EditTweet({required this.tweet});
  @override
  _EditTweetState createState() => _EditTweetState();
}

class _EditTweetState extends State<EditTweet> {
  bool _isLoading = false;
  TextEditingController _tweetController = TextEditingController();

  @override
  void initState() {
    _tweetController.text = widget.tweet.body;
    super.initState();
  }

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
            widget.tweet.body = _tweetController.text;
            widget.tweet.timeStamp = Timestamp.now();
            await editTweet(widget.tweet).then(
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
