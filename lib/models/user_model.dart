import 'dart:convert';

class AppUser {
  String id;
  String userName;
  String email;
  String image;
  AppUser({
    this.id = '',
    this.userName = '',
    this.email = '',
    this.image = '',
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'image': image,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'],
      userName: map['userName'],
      email: map['email'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) => AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppUser(id: $id, userName: $userName, email: $email, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AppUser &&
      other.id == id &&
      other.userName == userName &&
      other.email == email &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userName.hashCode ^
      email.hashCode ^
      image.hashCode;
  }

  AppUser copyWith({
    String? id,
    String? userName,
    String? email,
    String? image,
  }) {
    return AppUser(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      image: image ?? this.image,
    );
  }
}
