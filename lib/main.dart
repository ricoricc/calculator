// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, deprecated_member_use, prefer_const_declarations, must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, unnecessary_null_comparison
import 'package:calculator/pages/result_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Calculator App',
    home: MyApp(),
  ));
}

var result;
String calculation = "";
String a = "", b = "";
String operator = "";
String numberPrint = '0';

class printScreen extends StatelessWidget {
  const printScreen({
    Key? key,
    required this.text,
  }) : super(key: key);

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
                  onTap: () => {},
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.grey,
                  labelColor: Colors.white,
                ),
                Button(
                  label: "/",
                  onTap: () => {},
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
                  onTap: () => {},
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "8",
                  onTap: () => {},
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "9",
                  onTap: () => {},
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "*",
                  onTap: () => {},
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
                  onTap: () => {},
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "5",
                  onTap: () => {},
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "6",
                  onTap: () => {},
                  sizew: 90,
                  sizeh: 90,
                  backgroundColor: Colors.white,
                  labelColor: Colors.black,
                ),
                Button(
                  label: "-",
                  onTap: () => {},
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
                  onTap: () => {},
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
      if (a == "") {
        a = data;
        calculation += a;
        numberPrint = calculation;
        return;
      }
      if (a != "" && operator == "") {
        a += data;
        calculation += data;
        numberPrint = calculation;
        return;
      }
      if (b == "" && operator != "") {
        b = data;
        calculation += b;
        numberPrint = calculation;

        return;
      }
      if (b != "" && operator != "") {
        b += data;
        calculation += data;
        numberPrint = calculation;
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

      if (data != "" && operator != "" && b != "") {
        if (operator == "+") {
          result = int.parse(a) + int.parse(b);
        }
        operator = data;
        calculation += operator;
        numberPrint = calculation;
        a = "";
        b = "";
        operator = "";
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyEpp()),
    );
  }
}
