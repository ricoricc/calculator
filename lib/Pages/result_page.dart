// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:calculator/Pages/calculator.dart';
import 'package:flutter/material.dart';

class MyEpp extends StatelessWidget {
  final String calculation;
  final String result;

  const MyEpp({Key? key, required this.calculation, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Container(
          padding: EdgeInsets.all(50),
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text("Calculation: ", style: TextStyle(fontSize: 25)),
                    Text(calculation, style: TextStyle(fontSize: 30)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text("Result: ", style: TextStyle(fontSize: 25)),
                    Text(result, style: TextStyle(fontSize: 30)),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return historyPage();
                              },
                            ),
                          );
                        },
                        child: Text("Result History"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
