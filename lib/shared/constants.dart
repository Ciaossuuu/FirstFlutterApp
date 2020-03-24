import 'package:flutter/material.dart';

var textInputDecoration = InputDecoration(
  fillColor: Colors.blue[100],
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue[300], width: 2)
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blue[800], width: 2)
  )
);