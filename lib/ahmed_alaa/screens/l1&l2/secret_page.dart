import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecretPage extends StatefulWidget {
  const SecretPage({super.key});

  @override
  State<SecretPage> createState() => _SecretPageState();
}

class _SecretPageState extends State<SecretPage> {
  List<String> myNotes = [];
  List<String> dates = [];
  final noteCtrl = TextEditingController();
  final colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.black,
    Colors.grey,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.cyan,
  ];

  void saveMyNotes(bool isAdd, [int? index]) async {
    if (isAdd && noteCtrl.text.isEmpty) {
      return;
    }

    if (isAdd) {
      myNotes.add(noteCtrl.text);
      dates.add(DateTime.now().toString());
    } else {
      myNotes.removeAt(index!);
      dates.removeAt(index);
    }
    final shredPref = await SharedPreferences.getInstance();
    shredPref.setStringList("myNotes", myNotes);
    shredPref.setStringList("dates", dates);
    noteCtrl.clear();
    getMyNotes();
  }

  void getMyNotes() async {
    final shredPref = await SharedPreferences.getInstance();
    myNotes = shredPref.getStringList("myNotes") ?? [];
    dates = shredPref.getStringList("dates") ?? [];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyNotes();
  }

  bool enableDelete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('My Secret Notes'),
        actions: [
          IconButton(
            icon: Icon(
              enableDelete ? Icons.delete : Icons.delete_forever_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                enableDelete = !enableDelete;
              });
            },
          ),
          IconButton(
            icon: Icon(
              Icons.password,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChangePasswordPage(),
                ),
              );
            },
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
                          Icons.lightbulb_sharp,
                          color: Colors.deepOrange,
                          size: 150,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('No notes found'),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    padding: EdgeInsets.only(left: 15),
                    child: Wrap(
                      children: List.generate(
                        myNotes.length,
                        (index) => Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Text(
                                      myNotes[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    dateTime(DateTime.parse(dates[index])),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(top: 15, right: 15),
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            if (enableDelete)
                              CircleAvatar(
                                backgroundColor: Colors.black38,
                                child: IconButton(
                                  onPressed: () {
                                    saveMyNotes(false, index);
                                  },
                                  icon: Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: noteCtrl,
                    decoration: InputDecoration(
                      labelText: 'Add a note',
                      hintText: 'Add a note',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    saveMyNotes(true);
                  },
                  icon: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String dateTime(DateTime targetDate) {
    DateTime now = DateTime.now();

    Duration difference = now.difference(targetDate);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return 'On ${DateFormat('yyyy-MM-dd').format(targetDate)}';
    }
  }
}

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  Future<String> getCurrentPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('password') ?? '12345678';
  }

  final passwordCtrl = TextEditingController();
  final newPasswordCtrl = TextEditingController();

  void changePassword() async {
    final currentPassword = await getCurrentPassword();
    final _prefs = await SharedPreferences.getInstance();
    if (currentPassword == passwordCtrl.text) {
      setState(() {
        _prefs.setString("password", newPasswordCtrl.text);
        newPasswordCtrl.clear();
        passwordCtrl.clear();
        Navigator.of(context).pop();
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Colors.cyan,
          title: Text('Password Incorrect'),
          content: Text('Please enter your current password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                labelText: 'Current Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: newPasswordCtrl,
              decoration: InputDecoration(
                labelText: 'New Password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: changePassword,
              child: Text('Change Password'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
