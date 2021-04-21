import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_huthaifa_glints/models/tweet_model.dart';

CollectionReference _tweetCollectionReference = FirebaseFirestore.instance.collection('tweets');

publishNewTweet(Tweet tweet) async {
  return await _tweetCollectionReference.doc(tweet.id).set(tweet.toMap()).catchError((onError) {
    print(onError);
    throw (onError);
  });
}

editTweet(Tweet tweet) async {
  return await _tweetCollectionReference.doc(tweet.id).update(tweet.toMap()).catchError((onError) {
    print(onError);
    throw (onError);
  });
}

deleteTweet(String tweetId) async {
  return await _tweetCollectionReference.doc(tweetId).delete().catchError((onError) {
    print(onError);
    throw (onError);
  });
}
