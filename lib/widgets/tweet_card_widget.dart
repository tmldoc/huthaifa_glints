import 'package:com_huthaifa_glints/widgets/delete_tweet_widget.dart';
import 'package:com_huthaifa_glints/widgets/edit_tweet_widget.dart';
import 'package:intl/intl.dart';
import 'package:com_huthaifa_glints/models/tweet_model.dart';
import 'package:flutter/material.dart';

class TweetCard extends StatelessWidget {
  ///this "canEdit" boolean, will decide if tweets are editable or not, based on where the user is viewing them from. If on the home page, it'll be from other users, so editing or deleting is disabled.
  final bool canEdit;
  final Tweet tweet;
  const TweetCard({required this.tweet, required this.canEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shadowColor: Colors.blue,
        child: Column(
          children: [
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(tweet.appUser.image),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '@' + tweet.appUser.userName,
                    ),
                    Text(
                      DateFormat("hh:mm:ss a - MMM d, yyyy")
                          .format(DateTime.fromMillisecondsSinceEpoch(tweet.timeStamp.millisecondsSinceEpoch)),
                    )
                  ],
                ),
              ),
              title: Text(
                tweet.body,
              ),
            ),
            canEdit
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton.icon(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => DeleteTweet(
                            tweetId: tweet.id,
                          ),
                        ),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        label: Text('Delete'),
                      ),
                      TextButton.icon(
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => EditTweet(tweet: tweet),
                        ),
                        icon: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        label: Text('Edit'),
                      )
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
