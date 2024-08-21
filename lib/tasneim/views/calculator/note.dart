import 'package:c3/sharks/app/icon_broken.dart';
import 'package:flutter/material.dart';

class NoteAppView extends StatefulWidget {
  const NoteAppView({super.key});

  @override
  State<NoteAppView> createState() => _NoteAppViewState();
}

class _NoteAppViewState extends State<NoteAppView> {
  List<String> myNotes = [];

  final noteCtrl = TextEditingController();

  final colors = [
    Colors.cyan,
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.purple,
    Colors.yellow,
    Colors.orange,
    Colors.brown,
    Colors.lightGreen,
    Colors.lightBlue,
    Colors.teal,
    Colors.red,
    Colors.deepOrange,
    Colors.grey,
    Colors.black,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('My Note App'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const ChangePassword();
                },
              );
            },
            icon: Icon(
              Icons.lock_reset,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: myNotes.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          IconBroken.chat,
                          size: 150,
                          color: Colors.cyan,
                        ),
                        Text(
                          'No notes found',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan),
                        ),
                        Text('Start to add new one'),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Wrap(
                      children: List.generate(
                        myNotes.length,
                        (index) {
                          int reverse = myNotes.length - index - 1;
                          return Container(
                            padding: const EdgeInsets.all(10.0),
                            margin: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              myNotes[reverse],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: noteCtrl,
                    decoration: InputDecoration(
                      labelText: 'Write your note here',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(IconBroken.send),
                  onPressed: () {
                    if (noteCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 1),
                          content: Text(
                            "Please fill out all fields",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    } else {
                      myNotes.add(noteCtrl.text);
                      noteCtrl.clear();
                      setState(() {});
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Change password",
              style: TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Divider(
            color: Colors.cyan,
            height: 0,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: currentPassword,
              decoration: InputDecoration(
                labelText: "Current password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: newPassword,
              decoration: InputDecoration(
                labelText: "New password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  fixedSize: Size(double.infinity, 45),
                  elevation: 8,
                ),
                onPressed: () {
                  if (currentPassword.text.isEmpty ||
                      newPassword.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 1),
                        content: Text(
                          "Please fill out all fields",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
