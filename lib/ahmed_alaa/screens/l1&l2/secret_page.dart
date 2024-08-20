import 'package:flutter/material.dart';

class SecretPage extends StatefulWidget {
  const SecretPage({super.key});

  @override
  State<SecretPage> createState() => _SecretPageState();
}

class _SecretPageState extends State<SecretPage> {
  List<String> myNotes = [];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('My Secret Notes'),
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
                    child: Wrap(
                      children: List.generate(
                        myNotes.length,
                        (index) => Container(
                          child: Text(
                            myNotes[index],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: colors[index % colors.length],
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                    setState(() {
                      myNotes.add(noteCtrl.text);
                      noteCtrl.clear();
                    });
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
}
