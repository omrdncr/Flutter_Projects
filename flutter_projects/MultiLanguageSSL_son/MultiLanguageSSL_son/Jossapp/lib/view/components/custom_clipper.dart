import 'package:flutter/material.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, size.height / 1.5, size.width / 2,
        size.height / 1.4); // 1.78 ,   1.29

    path.quadraticBezierTo(3 / 4 * size.width, size.height / 1.4,
        7 / 8 * size.width, 0); //size.width, 0

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(MyCustomClipper oldClipper) => false;
}
