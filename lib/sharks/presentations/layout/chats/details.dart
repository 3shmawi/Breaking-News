import 'package:c3/sharks/presentations/layout/chats/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool isKeyboardActive = false;

  final imageUrl =
      'https://images.unsplash.com/photo-1701906268416-b461ec4caa34?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8fA%3D%3D'; // Replace with your image URL

  _goBottom() => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _goBottom();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const SizedBox(
            width: 14,
          ),
          Row(
            children: [
              Text(
                'Mohamed Ashmawi',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      fontSize: 18,
                      height: 1.1,
                    ),
              ),
              const SizedBox(
                width: 8,
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ],
          ),
          const SizedBox(
            width: 14,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: _scrollController,
              padding: const EdgeInsets.only(bottom: 14),
              shrinkWrap: true,
              children: const [
                RightMessage(
                    "hello i'm mohamed ashmawi wow com sdfkj oijf how are you sir "),
                LeftMessage("hi jlsk lskjf lksf lkjlsd lskjdfl lksjf"),
                RightMessage("hello"),
                LeftMessage("hi"),
                RightMessage("hello"),
                RightMessage(
                    "hello i'm mohamed ashmawi wow com sdfkj oijf how are you sir "),
                LeftMessage("محمد عبدالفتاح عشماوي\nتمام "),
                LeftMessage("hi"),
                RightMessage(
                    "hello i'm mohamed ashmawi wow com sdfkj oijf how are you sir "),
                LeftMessage("hi jlsk lskjf lksf lkjlsd lskjdfl lksjf"),
                RightMessage("hello"),
                LeftMessage("hi"),
                RightMessage("hello"),
                RightMessage(
                    "hello i'm mohamed ashmawi wow com sdfkj oijf how are you sir "),
                LeftMessage("محمد عبدالفتاح عشماوي\nتمام "),
                LeftMessage("hi"),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  8,
                ),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    _goBottom();
                    _textEditingController.clear();
                  },
                  splashColor: Colors.blue[900],
                  icon: Icon(
                    Icons.send, //Todo this icon
                    color: Colors.blue[900],
                  ),
                ),
                Expanded(
                  child: AuthFormField(
                    controller: _textEditingController,
                    focusNode: _focusNode,
                    onTap: () {
                      Future.delayed(
                        const Duration(
                          milliseconds: 600,
                        ),
                      ).then((value) {
                        _goBottom();
                      });
                    },
                    hintTxt: 'Write something...',
                    prefixIcon: CupertinoIcons.chat_bubble_text_fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RightMessage extends StatelessWidget {
  const RightMessage(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                0,
                14,
                14,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      message,
                      textAlign: isStartWithArabic(message)
                          ? TextAlign.start
                          : TextAlign.end,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Text(
                    "1د",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }
}

class LeftMessage extends StatelessWidget {
  const LeftMessage(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                14,
                14,
                0,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      message,
                      textAlign: isStartWithArabic(message)
                          ? TextAlign.start
                          : TextAlign.end,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Text(
                    "7m",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AuthFormField extends StatefulWidget {
  const AuthFormField({
    required this.controller,
    required this.hintTxt,
    required this.prefixIcon,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.focusNode,
    this.onTap,
    super.key,
  });

  final TextEditingController controller;
  final String hintTxt;
  final bool isPassword;
  final TextInputType textInputType;
  final IconData prefixIcon;
  final GestureTapCallback? onTap;
  final FocusNode? focusNode;

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  bool isPass = true;

  @override
  void initState() {
    super.initState();
    isPass = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: width / 8,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: width / 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        focusNode: widget.focusNode,
        onTap: widget.onTap,
        controller: widget.controller,
        obscureText: isPass,
        style: Theme.of(context).textTheme.titleMedium,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
            prefixIcon: Icon(
              widget.prefixIcon,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(
                        () {
                          isPass = !isPass;
                        },
                      );
                    },
                    icon: Icon(
                      isPass ? Icons.visibility : Icons.visibility_off_outlined,
                    ),
                  )
                : null,
            border: InputBorder.none,
            hintMaxLines: 1,
            hintText: widget.hintTxt,
            hintStyle: Theme.of(context).textTheme.labelSmall),
      ),
    );
  }
}
