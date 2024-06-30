import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  // Text Styles
  static const h1b = TextStyle(
    fontSize: 65,
    fontWeight: FontWeight.bold,
    height: 70 / 65,
    color: Colors.black,
  );
  static const h2b = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    height: 45 / 40,
    color: Colors.black,
  );
  static const h3b = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 32 / 24,
    color: Colors.black,
  );
  static const h3r = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    height: 32 / 24,
    color: Colors.black,
  );
  static const h4b = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    height: 15 / 12,
    color: Colors.black,
  );
  static const h4r = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 15 / 12,
    color: Colors.black,
  );
  static const pb = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 20 / 16,
    color: Colors.black,
  );
  static const pr = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 20 / 16,
    color: Colors.black,
  );

  // Colors
  static const background = Color(0xFFF2F2F2);
  static const prime500 = Color(0xFF666666);
  static const prime400 = Color(0xFF4D4D4D);
  static const prime300 = Color(0xFF333333);
  static const prime200 = Color(0xFF1A1A1A);
  static const prime012 = Colors.black12;
}
