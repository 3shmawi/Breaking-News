import 'package:flutter/material.dart';

import '../model/model.dart';

class RosaryPage extends StatefulWidget {
  const RosaryPage({super.key});

  @override
  State<RosaryPage> createState() => _RosaryPageState();
}

class _RosaryPageState extends State<RosaryPage> {
  List<RosaryModel> azkar = [
    RosaryModel(
      zkr: 'سُبْحَانَ اللَّهِ',
      counter: 10,
    ),
    RosaryModel(
      zkr: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
      counter: 10,
    ),
    RosaryModel(
      zkr: 'سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ',
      counter: 10,
    ),
    RosaryModel(
      zkr:
          'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ الْهَمِّ وَالْحَزَنِ، وَأَعُوذُ بِكَ مِنْ الْعَجْزِ وَالْكَسَلِ، وَأَعُوذُ بِكَ مِنْ الْجُبْنِ وَالْبُخْلِ، وَأَعُوذُ بِكَ مِنْ غَلَبَةِ الدَّيْنِ، وَقَهْرِ الرِّجَالِ.',
      counter: 3,
      fixed: 3,
    ),
    RosaryModel(
      zkr: 'أسْتَغْفِرُ اللهَ وَأتُوبُ إلَيْهِ',
      counter: 10,
    ),
  ];

  int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مسبحة الكترونية'),
        actions: const [
          Icon(Icons.more_vert),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: azkar[index].counter / azkar[index].fixed,
                  strokeAlign: 22,
                  strokeWidth: 8,
                ),
                SizedBox(
                  height: 215,
                  width: 215,
                  child: Card(
                    elevation: 30,
                    shape: const CircleBorder(),
                    child: Image.network(
                        "https://cdn4.iconfinder.com/data/icons/muslim-and-mosque/512/Muslim_Mosque-01-128.png"),
                  ),
                ),
              ],
            ),
            Card(
              margin: const EdgeInsets.all(40),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.cyan,
                      alignment: Alignment.center,
                      child: Text(
                        '${azkar[index].counter}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Text(
                          azkar[index].zkr,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        backgroundColor: Colors.black,
                        minimumSize: const Size(10, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          azkar[index].counter = azkar[index].fixed;
                        });
                      },
                      child: const Text('إعادة'),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 20,
                        backgroundColor: Colors.cyan,
                        minimumSize: const Size(10, 50),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (azkar[index].counter > 0) {
                          setState(() {
                            azkar[index].counter--;
                          });
                        } else {
                          azkar[index].counter = azkar[index].fixed;

                          if (index == azkar.length - 1) {
                            index = 0;
                          } else {
                            index++;
                          }
                          setState(() {});
                        }
                      },
                      child: const Text('تسبيح'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
