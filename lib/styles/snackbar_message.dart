
import 'package:flutter/material.dart';

MySnackBar(message, context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Text(
      message,
      style: TextStyle(fontSize: 20),
    ),

    elevation: 8,
    //duration: Duration(seconds: 5),
    action: SnackBarAction(
      textColor: Colors.white,
      label: 'ok',
      onPressed: () {},
    ),
  ));
}