import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_huthaifa_glints/models/tweet_model.dart';

CollectionReference _tweetCollectionReference = FirebaseFirestore.instance.collection('tweets');

publishNewTweet(Tweet tweet) async {
  return await _tweetCollectionReference.doc(tweet.id).set(tweet.toMap());
}

editTweet(Tweet tweet) async {
  return await _tweetCollectionReference.doc(tweet.id).update({"body": tweet.body, "timeStamp": tweet.timeStamp});
}

deleteTweet(String tweetId) async {
  return await _tweetCollectionReference.doc(tweetId).delete();
}
