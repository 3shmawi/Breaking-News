import 'package:flutter/material.dart';

import '../model/chat.dart';

class AppController extends ChangeNotifier {
  List<ChatModel> chats = [
    ChatModel(
      groupImg:
          'https://images.unsplash.com/photo-1464207687429-7505649dae38?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGRlZmF1bHQlMjBncm91cCUyMGljb258ZW58MHx8MHx8fDA%3D',
      messages: ['hello', 'marhaba', 'how are u?'],
      receiver: UserModel('Mohamed Ashmawi',
          'https://images.unsplash.com/photo-1697123205117-7c6df406d27d?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8'),
      sender: UserModel('Mohamed Wa2l',
          'https://images.unsplash.com/photo-1682687221175-fd40bbafe6ca?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHx8'),
      dateTime: '3:30 pm',
    ),
    ChatModel(
      messages: ['hi'],
      receiver: UserModel('Mostafa Shadi',
          'https://plus.unsplash.com/premium_photo-1698846880685-4b8b54c28ad3?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8fA%3D%3D'),
      sender: UserModel('Mohamed Wa2l',
          'https://images.unsplash.com/photo-1682687221175-fd40bbafe6ca?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHx8'),
      dateTime: '3:30 pm',
    ),
    ChatModel(
      messages: ['ok'],
      receiver: UserModel('Mohamed Ashmawi',
          'https://images.unsplash.com/photo-1697123205117-7c6df406d27d?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8'),
      sender: UserModel('Mostafa Shadi',
          'https://plus.unsplash.com/premium_photo-1698846880685-4b8b54c28ad3?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8fA%3D%3D'),
      dateTime: '3:30 pm',
    ),
    ChatModel(
      messages: ['done'],
      receiver: UserModel('Mohamed Ashmawi',
          'https://images.unsplash.com/photo-1697123205117-7c6df406d27d?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHx8'),
      sender: UserModel('3c',
          'https://images.unsplash.com/photo-1698864273184-41cf2052196b?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8fA%3D%3D'),
      dateTime: '3:30 pm',
    ),
  ];

  void addMessage(String message, int index) {
    chats[index].messages.add(message);
    notifyListeners();
  }
}
