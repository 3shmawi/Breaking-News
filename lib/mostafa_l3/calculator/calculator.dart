import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  //Button Widget
  Widget calcButton(String btnTxt,
      {int flex = 1,
      Color color = Colors.black,
      Color btnColor = Colors.grey}) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: btnColor,
          ),
          child: TextButton(
            onPressed: () {
              setState(() {
                buttonPressed(btnTxt);
              });
            },
            child: Text(
              btnTxt,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 20.0;
  double resultFontSize = 30.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "CLEAR") {
        equation = "0";
        result = "0";
        equationFontSize = 20.0;
        resultFontSize = 30.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 30.0;
        resultFontSize = 20.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 20.0;
        resultFontSize = 30.0;

        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 30.0;
        resultFontSize = 20.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }

      // if (equation == passwordNotesPage) {
      //   defaultNavigate(context, const NotesPage());
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(3),
      color: Colors.grey[300],
      height: height / 1.8,
      child: Column(
        children: [
          // Calculator display
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              maxLines: 1,
              style: TextStyle(
                fontSize: equationFontSize,
              ),
            ),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text(
              result,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: resultFontSize,
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              calcButton(
                'CLEAR',
                color: Colors.white,
                flex: 2,
                btnColor: Colors.deepOrange,
              ),
              calcButton(
                '⌫',
                color: Colors.white,
                btnColor: Colors.deepOrange,
              ),
              calcButton('÷'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              calcButton('7'),
              calcButton('8'),
              calcButton('9'),
              calcButton('x'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              calcButton('4'),
              calcButton('5'),
              calcButton('6'),
              calcButton('-'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              calcButton('1'),
              calcButton('2'),
              calcButton('3'),
              calcButton('+'),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              //this is button Zero
              calcButton('0', flex: 2),
              calcButton('.'),
              calcButton(
                '=',
                color: Colors.white,
                btnColor: Colors.deepOrange,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
