import 'package:flutter/material.dart';

class BmiCalcView extends StatefulWidget {
  const BmiCalcView({super.key});

  @override
  State<BmiCalcView> createState() => _BmiCalcViewState();
}

class _BmiCalcViewState extends State<BmiCalcView> {
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale = true;
                      });
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: isMale ? Colors.deepPurple : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "ذكر",
                          style: TextStyle(
                            fontSize: 45,
                            color: isMale ? Colors.white : Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    bottom: 20
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isMale = false;
                      });
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: isMale ? Colors.grey[300] : Colors.deepPurple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "أنثى",
                          style: TextStyle(
                            fontSize: 45,
                            color: isMale ? Colors.deepPurple : Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
