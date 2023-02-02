
import 'package:flutter/material.dart';

InputDecoration textFormFiledInputDecoration(String hintText) {
     return  InputDecoration(
       focusColor: Colors.blueGrey,
       hintText: hintText,
       fillColor: Colors.white60,
       filled: true,
       border: const OutlineInputBorder(
          //borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          )));
}
