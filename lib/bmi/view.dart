import 'dart:math';

import 'package:c3/bmi/constants.dart';
import 'package:c3/bmi/result.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BmiView extends StatefulWidget {
  const BmiView({super.key});

  @override
  State<BmiView> createState() => _BmiViewState();
}

class _BmiViewState extends State<BmiView> {
  bool isMale = true;
  double height = 60;
  int age = 20;
  int weight = 40;
  bool isDefault = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final h = MediaQuery.sizeOf(context).height;
    print(width);
    print(h);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('BMI Calculator'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            if (width > 500)
              Image.asset(
                isMale
                    ? AppConsts.man[isDefault ? 1 : _getIndex()]
                    : AppConsts.woman[_getIndex()],
                color: isDefault ? Colors.grey : AppConsts.colors[_getIndex()],
                height: double.infinity,
                width: width * .4,
              ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                isMale = !isMale;
                                setState(() {
                                  isDefault = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isMale
                                      ? Colors.deepPurple
                                      : Colors.grey[300],
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppConsts.male,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                isMale = !isMale;
                                setState(() {
                                  isDefault = false;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: isMale
                                      ? Colors.grey[300]
                                      : Colors.deepPurple,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    AppConsts.female,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            if (h > 682)
                              Text(
                                'HEIGHT',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: h / 25,
                                ),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                if (h <= 682 && kIsWeb)
                                  Text(
                                    'HEIGHT',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: h / 25,
                                    ),
                                  ),
                                if (h <= 682 && kIsWeb)
                                  const SizedBox(
                                    width: 10,
                                  ),
                                Text(
                                  '${height.toInt()}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: h / 20,
                                  ),
                                ),
                                Text(
                                  ' CM',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: h / 30),
                                ),
                              ],
                            ),
                            Slider(
                              thumbColor: Colors.deepPurple,
                              inactiveColor: Colors.purple[100],
                              activeColor: Colors.deepPurple,
                              value: height,
                              onChanged: (newValue) {
                                height = newValue;
                                setState(() {
                                  isDefault = false;
                                });
                              },
                              min: 60,
                              max: 200,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (h > 682)
                                    Text(
                                      'AGE',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: h / 25,
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FloatingActionButton(
                                          heroTag: '1',
                                          backgroundColor: Colors.deepPurple,
                                          onPressed: () {
                                            if (age > 1) age--;
                                            setState(() {
                                              isDefault = false;
                                            });
                                          },
                                          mini: true,
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        FloatingActionButton(
                                          heroTag: '2',
                                          backgroundColor: Colors.deepPurple,
                                          onPressed: () {
                                            age++;
                                            setState(() {
                                              isDefault = false;
                                            });
                                          },
                                          mini: true,
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FittedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (h <= 682 && kIsWeb)
                                          Text(
                                            'AGE',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: h / 25,
                                            ),
                                          ),
                                        if (h <= 682 && kIsWeb)
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        Text(
                                          '$age',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: h / 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[300],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (h > 682)
                                    Text(
                                      'WEIGHT',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: h / 25,
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FloatingActionButton(
                                          heroTag: '3',
                                          backgroundColor: Colors.deepPurple,
                                          onPressed: () {
                                            if (weight > 5) weight--;
                                            setState(() {
                                              isDefault = false;
                                            });
                                          },
                                          mini: true,
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        FloatingActionButton(
                                          heroTag: '4',
                                          backgroundColor: Colors.deepPurple,
                                          onPressed: () {
                                            weight++;
                                            setState(() {
                                              isDefault = false;
                                            });
                                          },
                                          mini: true,
                                          child: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FittedBox(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (h <= 682 && kIsWeb)
                                          Text(
                                            'WEIGHT',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: h / 26,
                                            ),
                                          ),
                                        if (h <= 682 && kIsWeb)
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        Text(
                                          '$weight',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: h / 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (width <= 500)
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BmiResultView(
                                isMale: isMale,
                                index: _getIndex(),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          'CALCULATE',
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getIndex() {
    double result = weight / pow(height / 100, 2);

    if (result < 18.5) {
      return 0;
    } else if (result >= 18.5 && result < 25) {
      return 1;
    } else if (result >= 25 && result < 30) {
      return 2;
    } else if (result >= 30 && result < 40) {
      return 3;
    } else {
      return 4;
    }
  }
}
