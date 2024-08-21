import 'package:c3/tasneim/views/calculator/note.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String password = "";

  void getPassword() async {
    final SharedPreferences _pref = await SharedPreferences.getInstance();

    final password = _pref.getString('password') ?? "12345";
    setState(() {
      this.password = password;
    });
  }

  String expression = "";
  String result = "0";
  String equation = "0";
  double equationFontSize = 40;
  double resultFontSize = 20;

  @override
  void initState() {
    getPassword();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        title: Text(
          'Simple Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.6,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 5,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  equation,
                  style: TextStyle(
                    fontSize: equationFontSize,
                    fontWeight: FontWeight.bold,
                    color: equationFontSize == 40 ? Colors.black : Colors.grey,
                  ),
                ),
                Text(
                  result,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: resultFontSize,
                    fontWeight: FontWeight.bold,
                    color: resultFontSize == 40.0 ? Colors.black : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.cyan,
          ),
          Row(
            children: [
              _btnItem(
                "CLEAR",
                flex: 2,
                bgColor: Colors.red,
              ),
              _btnItem("⌫"),
              _btnItem(
                "÷",
                bgColor: Colors.deepOrange,
              ),
            ],
          ),
          Row(
            children: [
              _btnItem("7"),
              _btnItem("8"),
              _btnItem("9"),
              _btnItem(
                "x",
                bgColor: Colors.deepOrange,
              ),
            ],
          ),
          Row(
            children: [
              _btnItem("4"),
              _btnItem("5"),
              _btnItem("6"),
              _btnItem(
                "-",
                bgColor: Colors.deepOrange,
              ),
            ],
          ),
          Row(
            children: [
              _btnItem("1"),
              _btnItem("2"),
              _btnItem("3"),
              _btnItem(
                "+",
                bgColor: Colors.deepOrange,
              ),
            ],
          ),
          Row(
            children: [
              _btnItem("0"),
              _btnItem("."),
              _btnItem(
                "=",
                flex: 2,
                bgColor: Colors.deepOrange,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _btnItem(
    String text, {
    Color txtColor = Colors.white,
    Color bgColor = Colors.cyan,
    int flex = 1,
  }) =>
      Expanded(
        flex: flex,
        child: GestureDetector(
          onTap: () {
            buttonPressed(text);
          },
          child: Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: bgColor,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: txtColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "CLEAR") {
        equation = "0";
        result = "0.0";
        equationFontSize = 20.0;
        resultFontSize = 40.0;
      } else if (buttonText == "⌫") {
        equationFontSize = 40.0;
        resultFontSize = 20.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 20.0;
        resultFontSize = 40.0;

        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          if (double.parse(result).toInt().toString() == password) {
            equation = "0";
            result = "0.0";
            equationFontSize = 20.0;
            resultFontSize = 40.0;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NoteAppView(),
              ),
            );
          }
          // results.add("${equation} = ${result}");
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 40.0;
        resultFontSize = 20.0;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }
}
