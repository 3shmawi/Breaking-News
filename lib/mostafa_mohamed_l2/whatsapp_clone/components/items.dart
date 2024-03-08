import 'package:c3/mostafa_mohamed_l2/whatsapp_clone/controller/provider.dart';
import 'package:c3/mostafa_mohamed_l2/whatsapp_clone/model/chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/chat_screen.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({required this.isGroup, required this.index, super.key});

  final bool isGroup;
  final int index;

  @override
  Widget build(BuildContext context) {
    final chat = context.watch<AppController>().chats[index];
    return InkWell(
      onTap: () {
        if (isGroup) {
          //ToDo emp
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChatScreen(index: index),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.black,
              backgroundImage:
                  NetworkImage(isGroup ? chat.groupImg! : chat.receiver.imgUrl),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 20, 0, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            chat.receiver.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(chat.dateTime),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        if (isGroup)
                          SizedBox(
                            width: 80,
                            child: Text(
                              chat.sender.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black38),
                            ),
                          ),
                        if (isGroup)
                          const Text(
                            ':  ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black38),
                          ),
                        Expanded(
                          child: Text(
                            chat.messages.last,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black38),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChatMessageItem extends StatelessWidget {
  const ChatMessageItem({
    required this.isSender,
    required this.message,
    super.key,
  });

  final String message;
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender
          ? AlignmentDirectional.topStart
          : AlignmentDirectional.topEnd,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSender ? Colors.green : Colors.grey,
          borderRadius: isSender
              ? const BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                )
              : const BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
        ),
        child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
