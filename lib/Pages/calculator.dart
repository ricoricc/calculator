// ignore_for_file: prefer_const_constructors_in_immutables, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors

import 'dart:math';

import 'package:calculator/pages/result_page.dart';
import 'package:flutter/material.dart';

double result = 0.0;
String calculation = "";
String a = "", b = "";
String operator = "";
String numberPrint = '0';

class printScreen extends StatelessWidget {
  printScreen({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      color: Colors.black,
      child: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 24),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 34),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double sizeh;
  final double sizew;
  final Color? backgroundColor;
  final Color? labelColor;

  Button({
    required this.label,
    required this.onTap,
    required this.sizeh,
    required this.sizew,
    this.backgroundColor = Colors.white,
    this.labelColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        child: Ink(
          width: sizew,
          height: sizeh,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, offset: Offset(1, 1), blurRadius: 2),
              ],
              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
              color: backgroundColor),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
            ),
            onTap: onTap,
            child: Center(
                child: Text(
              label,
              style: TextStyle(fontSize: 24, color: labelColor),
            )),
          ),
        ));
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Column(
          children: [
            printScreen(text: numberPrint),
            Row(
              children: [
                Button(
                  label: "C",
                  onTap: () => clear(),
                  sizew: 190,
                  sizeh: 90,
                  backgroundColor: Colors.blue,
                  labelColor: Colors.white,
                ),
                Button(
                  label: "^",
                  onTap: () => operatorPressed("^"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.grey,
                  labelColor: Colors.white,
                ),
                Button(
                  label: "/",
                  onTap: () => operatorPressed("/"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.grey,
                  labelColor: Colors.white,
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  label: "7",
                  onTap: () => buttonPressed("7"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "8",
                  onTap: () => buttonPressed("8"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "9",
                  onTap: () => buttonPressed("9"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "*",
                  onTap: () => operatorPressed("*"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.grey,
                  labelColor: Colors.white,
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  label: "4",
                  onTap: () => buttonPressed("4"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "5",
                  onTap: () => buttonPressed("5"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "6",
                  onTap: () => buttonPressed("6"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "-",
                  onTap: () => operatorPressed("-"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.grey,
                  labelColor: Colors.white,
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  label: "1",
                  onTap: () => buttonPressed("1"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "2",
                  onTap: () => buttonPressed("2"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "3",
                  onTap: () => buttonPressed("3"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "+",
                  onTap: () => operatorPressed("+"),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.grey,
                  labelColor: Colors.white,
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  label: "0",
                  onTap: () => buttonPressed("0"),
                  sizew: 295,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "=",
                  onTap: () => resultScreen(),
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.orange,
                  labelColor: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  buttonPressed(String data) {
    setState(() {
      if (a == "" && int.parse(data) != 0) {
        a = data;
        calculation += a;
        numberPrint = calculation;
        return;
      }
      if (a != "" && operator == "") {
        a += data;
        calculation += data;
        numberPrint = calculation;
        print("A: $a");
        return;
      }
      if (b == "" && operator != "" && int.parse(data) != 0) {
        b = data;
        calculation += b;
        numberPrint = calculation;

        return;
      }
      if (b != "" && operator != "") {
        b += data;
        calculation += data;
        numberPrint = calculation;
        print("B: $b");
        return;
      }
    });
  }

  operatorPressed(String data) {
    setState(() {
      if (data == "+" && operator == "") {
        operator = "+";
        calculation += operator;
        numberPrint = calculation;
        return;
      }
      if (data == "-" && operator == "") {
        operator = "-";
        calculation += operator;
        numberPrint = calculation;
        return;
      }
      if (data == "*" && operator == "") {
        operator = "*";
        calculation += operator;
        numberPrint = calculation;
        return;
      }
      if (data == "/" && operator == "") {
        operator = "/";
        calculation += operator;
        numberPrint = calculation;
        return;
      }
      if (data == "^" && operator == "") {
        operator = "^";
        calculation += operator;
        numberPrint = calculation;
        return;
      }

      if (data != "" && operator != "" && b != "") {
        if (operator == "+") {
          result = double.parse(a) + int.parse(b);
        } else if (operator == "-") {
          result = double.parse(a) - int.parse(b);
        } else if (operator == "*") {
          result = double.parse(a) * int.parse(b);
        } else if (operator == "/") {
          result = double.parse(a) / int.parse(b);
        } else if (operator == "^") {
          result = pow(int.parse(a), int.parse(b)).toDouble();
        }
        operator = data;
        calculation += operator;
        numberPrint = calculation;
        a = result.toString();
        b = "";
        print(result);
        return;
      }
    });
  }

  clear() {
    setState(() {
      result = 0;
      calculation = "";
      a = "";
      b = "";
      operator = "";
      numberPrint = "0";
    });
  }

  resultScreen() {
    if (operator == "+") {
      result = double.parse(a) + int.parse(b);
    } else if (operator == "-") {
      result = double.parse(a) - int.parse(b);
    } else if (operator == "*") {
      result = double.parse(a) * int.parse(b);
    } else if (operator == "/") {
      result = double.parse(a) / int.parse(b);
    } else if (operator == "^") {
      result = pow(int.parse(a), int.parse(b)).toDouble();
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return MyEpp(
            calculation: calculation.toString(),
            result: result.toString(),
          );
        },
      ),
    );
  }
}
