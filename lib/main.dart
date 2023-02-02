import 'package:flutter/material.dart';
import 'package:task_4_todo/screens/contact_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List ',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: ContactListScreen(),
    );
  }
}

