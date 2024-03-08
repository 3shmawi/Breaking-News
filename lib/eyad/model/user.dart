class UserModel {
  final String name;
  final String email;
  final String id;
  final String? img;

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    this.img,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'img': img,
    };
  }
}
