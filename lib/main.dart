// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, deprecated_member_use, prefer_const_declarations, must_be_immutable, camel_case_types, prefer_typing_uninitialized_variables, unnecessary_null_comparison
import 'package:calculator/pages/result_page.dart';
import 'package:flutter/material.dart';

import 'Pages/calculator.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator With Navigation',
      home: MyApp(),
    ),
  );
}
