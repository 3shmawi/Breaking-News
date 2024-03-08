import 'package:c3/eyad/model/user.dart';

class PostModel {
  UserModel user;
  String content;
  String date;
  String id;

  PostModel({
    required this.user,
    required this.content,
    required this.date,
    required this.id,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      user: UserModel.fromJson(json['user']),
      content: json['content'],
      date: json['date'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'content': content,
      'date': DateTime.now(),
      'id': id,
    };
  }
}
