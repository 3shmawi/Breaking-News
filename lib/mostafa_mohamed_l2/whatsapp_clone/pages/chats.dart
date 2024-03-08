import 'package:c3/mostafa_mohamed_l2/whatsapp_clone/controller/provider.dart';
import 'package:c3/mostafa_mohamed_l2/whatsapp_clone/model/chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/items.dart';

class ChatsTab extends StatefulWidget {
  const ChatsTab({super.key});

  @override
  State<ChatsTab> createState() => _ChatsTabState();
}

class _ChatsTabState extends State<ChatsTab> {
  @override
  Widget build(BuildContext context) {
    final chats = context.watch<AppController>().chats;
    return ListView.separated(
      itemBuilder: (context, index) => ChatItem(
        isGroup: false,
        index: index,
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: chats.length,
    );
  }
}
