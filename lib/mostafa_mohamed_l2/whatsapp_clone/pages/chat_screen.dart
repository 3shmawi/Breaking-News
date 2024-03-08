import 'package:c3/mostafa_mohamed_l2/whatsapp_clone/controller/provider.dart';
import 'package:c3/mostafa_mohamed_l2/whatsapp_clone/model/chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/items.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({required this.index, super.key});

  final int index;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

//State
class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final chat = context.watch<AppController>().chats[widget.index];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        leadingWidth: 0,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_outlined),
            ),
            const SizedBox(width: 5),
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
              backgroundImage: NetworkImage(chat.receiver.imgUrl),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.receiver.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    'online',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.video_call),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.call),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.more_vert),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ChatMessageItem(
                    isSender: index % 2 == 0 ? false : true,
                    message: chat.messages[index],
                  ),
                  itemCount: chat.messages.length,
                ),
              ),
              SendMessageFormFieldChatScreen(widget.index),
            ],
          ),
        ],
      ),
    );
  }
}

class SendMessageFormFieldChatScreen extends StatefulWidget {
  const SendMessageFormFieldChatScreen(this.index, {super.key});

  final int index;

  @override
  State<SendMessageFormFieldChatScreen> createState() =>
      _SendMessageFormFieldChatScreenState();
}

class _SendMessageFormFieldChatScreenState
    extends State<SendMessageFormFieldChatScreen> {
  final TextEditingController messageCtrl = TextEditingController();

  bool isThereMessage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: (text) {
                if (messageCtrl.text.isNotEmpty) {
                  isThereMessage = true;
                  setState(() {});
                } else {
                  isThereMessage = false;
                  setState(() {});
                }
              },
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              controller: messageCtrl,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type a message...',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (isThereMessage) {
                Provider.of<AppController>(context, listen: false)
                    .addMessage(messageCtrl.text, widget.index);
                messageCtrl.clear();
              }
            },
            child: IconAnimator(isThereMessage),
          ),
        ],
      ),
    );
  }
}

class DefaultBackGround extends StatelessWidget {
  const DefaultBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Positioned.fill(
        child: Image.asset(
          'assets/background.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class IconAnimator extends StatefulWidget {
  const IconAnimator(this.isFirstIcon, {super.key});

  final bool isFirstIcon;

  @override
  IconAnimatorState createState() => IconAnimatorState();
}

class IconAnimatorState extends State<IconAnimator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: widget.isFirstIcon
            ? const Icon(
                Icons.send,
                size: 25.0,
                color: Colors.green,
              )
            : const Icon(
                Icons.mic,
                size: 25.0,
                color: Colors.green,
              ),
      ),
    );
  }
}
