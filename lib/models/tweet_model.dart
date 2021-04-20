
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_huthaifa_glints/models/user_model.dart';

///This is the "Tweet" model, needs an Id, body ,timestamp, user, boolen is edited or not
class Tweet {
  String id;
  String body;
  Timestamp timeStamp;
  AppUser appUser;
  bool edited;
  Tweet({
    required this.id,
    required this.body,
    required this.timeStamp,
    required this.appUser,
    required this.edited,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'body': body,
      'timeStamp': timeStamp,
      'appUser': appUser.toMap(),
      'edited': edited,
    };
  }

  factory Tweet.fromMap(Map<String, dynamic> map) {
    return Tweet(
      id: map['id'],
      body: map['body'],
      timeStamp: map['timeStamp'],
      appUser: AppUser.fromMap(map['appUser']),
      edited: map['edited'] ?? false,
    );
  }

}
