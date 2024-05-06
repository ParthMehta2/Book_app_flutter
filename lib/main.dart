import 'package:book_app/UI/Books_page.dart';
import 'package:book_app/UI/Book_details.dart';
import 'package:flutter/material.dart';
import 'UI/Book_details.dart';
import 'UI/get_started.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book App',
      home: get_started(),

      debugShowCheckedModeBanner: false,
    );
  }
}


