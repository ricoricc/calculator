import 'package:flutter/material.dart';

class MyEpp extends StatelessWidget {
  const MyEpp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calculator"),
        ),
        body: Column(),
      ),
    );
  }
}
