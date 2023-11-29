import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_scroll_sliver.dart';



void main() {
  runApp(MaterialApp(
    title: "Flutter Learn",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color.fromARGB(255, 45, 255, 238),
    ),
    home: Scaffold(
      body: CollapsableToolbarOrnek(),
    ),
  ));
}
