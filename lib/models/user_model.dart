import 'dart:convert';

class AppUser {
  String id;
  String userName;
  String nickName;
  String email;
  String image;
  AppUser({
    this.id = '',
    this.userName = '',
    this.nickName = '',
    this.email = '',
    this.image = '',
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'nickName': nickName,
      'email': email,
      'image': image,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'].toString(),
      userName: map['userName'].toString(),
      nickName: map['nickName'].toString(),
      email: map['email'].toString(),
      image: map['image'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) => AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(id: $id, userName: $userName, nickName: $nickName, email: $email, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AppUser &&
      other.id == id &&
      other.userName == userName &&
      other.nickName == nickName &&
      other.email == email &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userName.hashCode ^
      nickName.hashCode ^
      email.hashCode ^
      image.hashCode;
  }
}
