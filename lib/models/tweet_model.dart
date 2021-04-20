import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_huthaifa_glints/models/user_model.dart';

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

  String toJson() => json.encode(toMap());

  factory Tweet.fromJson(String source) => Tweet.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Tweet(id: $id, body: $body, timeStamp: $timeStamp, appUser: $appUser, edited: $edited)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Tweet &&
        other.id == id &&
        other.body == body &&
        other.timeStamp == timeStamp &&
        other.appUser == appUser &&
        other.edited == edited;
  }

  @override
  int get hashCode {
    return id.hashCode ^ body.hashCode ^ timeStamp.hashCode ^ appUser.hashCode ^ edited.hashCode;
  }

  Tweet copyWith({
    String? id,
    String? body,
    Timestamp? timeStamp,
    AppUser? appUser,
    bool? edited,
  }) {
    return Tweet(
      id: id ?? this.id,
      body: body ?? this.body,
      timeStamp: timeStamp ?? this.timeStamp,
      appUser: appUser ?? this.appUser,
      edited: edited ?? this.edited,
    );
  }
}
