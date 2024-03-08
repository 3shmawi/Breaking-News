class ChatModel {
  List<String> messages;
  UserModel receiver;
  UserModel sender;
  String dateTime;
  String? groupImg;

  ChatModel({
    required this.messages,
    required this.receiver,
    required this.sender,
    required this.dateTime,
    this.groupImg =
        'https://images.unsplash.com/photo-1499540633125-484965b60031?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGRlZmF1bHQlMjBncm91cCUyMGljb258ZW58MHx8MHx8fDA%3D',
  });
}

class UserModel {
  String imgUrl;
  String name;

  UserModel(this.name, this.imgUrl);
}
