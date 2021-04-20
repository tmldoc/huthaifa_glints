import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_huthaifa_glints/models/tweet_model.dart';
import 'package:flutter/material.dart';

import 'tweet_card_widget.dart';

class TweetStreamBuilder extends StatelessWidget {
  final bool canEdit;
  const TweetStreamBuilder({
    Key? key,
    required this.canEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('tweets').orderBy('timeStamp', descending: true).snapshots(),
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
                      canEdit: canEdit,
                      tweet: Tweet.fromMap(
                        tweet.data(),
                      ),
                    )
                ],
              );
            }));
  }
}
