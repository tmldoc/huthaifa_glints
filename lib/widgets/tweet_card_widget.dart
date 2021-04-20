import 'package:com_huthaifa_glints/provider/login_provider.dart';
import 'package:com_huthaifa_glints/widgets/delete_tweet_widget.dart';
import 'package:com_huthaifa_glints/widgets/edit_tweet_widget.dart';
import 'package:intl/intl.dart';
import 'package:com_huthaifa_glints/models/tweet_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TweetCard extends StatelessWidget {
  final Tweet tweet;
  const TweetCard({
    required this.tweet,
  });

  @override
  Widget build(BuildContext context) {
    final String _userId = Provider.of<LoginState>(context, listen: false).user.id;

    ///this "canEdit" boolean, will decide if tweets are editable or not, based on if the publisher ID == current UserID, so editing or deleting is disabled.
    final bool canEdit = tweet.appUser.id == _userId ? true : false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shadowColor: Colors.blue,
        child: Column(
          children: [
            ListTile(
              isThreeLine: true,
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(tweet.appUser.image),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@' + tweet.appUser.userName,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat("hh:mm:ss a - MMM d, yyyy")
                              .format(DateTime.fromMillisecondsSinceEpoch(tweet.timeStamp.millisecondsSinceEpoch)),
                        ),
                        ///If the tweet was edited, we'll show this small text
                        tweet.edited ? Text('edited') : Container(),
                      ],
                    )
                  ],
                ),
              ),
              title: Text(
                '"' + tweet.body + '"',
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
