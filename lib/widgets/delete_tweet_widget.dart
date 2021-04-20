import 'package:com_huthaifa_glints/functions/tweet_functions.dart';
import 'package:flutter/material.dart';

class DeleteTweet extends StatefulWidget {
  final String tweetId;
  const DeleteTweet({required this.tweetId});
  @override
  _DeleteTweetState createState() => _DeleteTweetState();
}

class _DeleteTweetState extends State<DeleteTweet> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Tweet'),
      content: _isLoading
          ? CircularProgressIndicator()
          : Container(
              child: Text('Are you sure you want to delete this tweet?'),
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

            await deleteTweet(widget.tweetId).then(
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
            'Delete',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
