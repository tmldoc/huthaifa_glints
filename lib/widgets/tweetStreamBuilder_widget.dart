import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_huthaifa_glints/models/tweet_model.dart';
import 'package:com_huthaifa_glints/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'tweet_card_widget.dart';

class TweetStreamBuilder extends StatelessWidget {
  final bool historyView;
  const TweetStreamBuilder({
    Key? key,
    required this.historyView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _userId = Provider.of<LoginState>(context, listen: false).user.id;
    return Center(
        child: StreamBuilder<QuerySnapshot>(
            stream: historyView
                ? FirebaseFirestore.instance
                    .collection('tweets')
                    .orderBy('timeStamp', descending: true)
                    .where("appUser.id", isEqualTo: _userId)
                    .snapshots()
                : FirebaseFirestore.instance.collection('tweets').orderBy('timeStamp', descending: true).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) return Text('No data yet');
              return ListView(
                children: [
                  for (QueryDocumentSnapshot tweet in snapshot.data!.docs)
                    TweetCard(
                      tweet: Tweet.fromMap(
                        tweet.data(),
                      ),
                    )
                ],
              );
            }));
  }
}
