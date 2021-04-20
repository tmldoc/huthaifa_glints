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
}
