import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_huthaifa_glints/models/user_model.dart';

class Tweet {
  String id;
  String body;
  Timestamp timeStamp;
  AppUser appUser;
  Tweet({
    required this.id,
    required this.body,
    required this.timeStamp,
    required this.appUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'body': body,
      'timeStamp': timeStamp,
      'appUser': appUser.toMap(),
    };
  }

  factory Tweet.fromMap(Map<String, dynamic> map) {
    return Tweet(
      id: map['id'].toString(),
      body: map['body'].toString(),
      timeStamp: map['timeStamp'],
      appUser: AppUser.fromMap(map['appUser']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tweet.fromJson(String source) => Tweet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tweet(id: $id, body: $body, timeStamp: $timeStamp, appUser: $appUser)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tweet &&
        other.id == id &&
        other.body == body &&
        other.timeStamp == timeStamp &&
        other.appUser == appUser;
  }

  @override
  int get hashCode {
    return id.hashCode ^ body.hashCode ^ timeStamp.hashCode ^ appUser.hashCode;
  }
}
