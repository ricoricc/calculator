// ignore_for_file: prefer_const_constructors_in_immutables, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors

import 'dart:ffi';
import 'dart:math';

import 'package:calculator/pages/result_page.dart';
import 'package:flutter/material.dart';

List<String> angka = [];
List<String> temp = [];

int filterCheck = 0;

double result = 0.0;
String calculation = "";
String a = "", b = "";
String operator = "";
String numberPrint = '0';

String filter = "";

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
  void tambahData() {
    setState(() {
      angka.add(result.toString());
      angka.sort();
    });
  }

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
    tambahData();
  }
}

class historyPage extends StatefulWidget {
  const historyPage({Key? key}) : super(key: key);

  @override
  State<historyPage> createState() => _historyPageState();
}

class _historyPageState extends State<historyPage> {
  final TextEditingController _filterController = TextEditingController();

  void editFilter(String op) {
    setState(() {
      if (filterCheck == 0) {
        if (_filterController.text.toString() != "") {
          double x = double.parse(_filterController.text.toString());

          temp.addAll(angka);
          angka.clear();
          filter = op + _filterController.text.toString();

          if (op == ">") {
            for (int i = 0; i < temp.length; i++) {
              if (double.parse(temp[i]) > x) {
                angka.add(temp[i]);
              }
            }
          } else if (op == ">=") {
            for (int i = 0; i < temp.length; i++) {
              if (double.parse(temp[i]) >= x) {
                angka.add(temp[i]);
              }
            }
          } else if (op == "==") {
            for (int i = 0; i < temp.length; i++) {
              if (double.parse(temp[i]) == x) {
                angka.add(temp[i]);
              }
            }
          } else if (op == "<=") {
            for (int i = 0; i < temp.length; i++) {
              if (double.parse(temp[i]) <= x) {
                angka.add(temp[i]);
              }
            }
          } else if (op == "<") {
            for (int i = 0; i < temp.length; i++) {
              if (double.parse(temp[i]) < x) {
                angka.add(temp[i]);
              }
            }
          }
          angka.sort();
          _filterController.text = "";
        } else {
          _filterController.text = "";
        }
        filterCheck = 1;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Reset Filter before applying other filter'),
          ),
        );
      }
    });
  }

  void resetFilter() {
    setState(() {
      if (filterCheck == 1) {
        _filterController.text = "";
        angka.clear();
        angka.addAll(temp);
        temp.clear();
        angka.sort();
        filterCheck = 0;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Filter Reset'),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "History Screen",
        home: Scaffold(
          appBar: AppBar(
            title: Text("History Screen"),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Result History",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    TextField(
                      controller: _filterController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Filter Masukan angka"),
                    ),
                    ElevatedButton(
                      onPressed: () => resetFilter(),
                      child: Text("Reset Filter"),
                    ),
                    Wrap(
                      spacing: 12,
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => editFilter(">"),
                          child: Text(">"),
                        ),
                        ElevatedButton(
                          onPressed: () => editFilter(">="),
                          child: Text(">="),
                        ),
                        ElevatedButton(
                          onPressed: () => editFilter("=="),
                          child: Text("=="),
                        ),
                        ElevatedButton(
                          onPressed: () => editFilter("<="),
                          child: Text("<="),
                        ),
                        ElevatedButton(
                          onPressed: () => editFilter("<"),
                          child: Text("<"),
                        ),
                      ],
                    ),
                    Text(
                      "Hasil Filter dari: $filter",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: angka.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(angka[index]),
                        background: Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                          color: Colors.red,
                          child: Icon(Icons.delete),
                        ),
                        secondaryBackground: Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          alignment: Alignment.centerRight,
                          color: Colors.blue,
                          child: Icon(Icons.pending),
                        ),
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            return false;
                          } else {
                            return true;
                          }
                        },
                        onDismissed: (direction) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${angka[index]} dismissed'),
                            ),
                          );
                          setState(() {
                            angka.removeAt(index);
                          });
                        },
                        child: ListTile(
                          title: Text(angka[index]),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(angka[index])));
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
