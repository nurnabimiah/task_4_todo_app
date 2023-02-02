

import 'package:flutter/material.dart';

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.all(0),
      primary: Colors.green,
      fixedSize: Size(100, 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );
}