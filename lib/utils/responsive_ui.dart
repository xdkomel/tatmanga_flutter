import 'package:flutter/material.dart';

double contentWidth(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return switch (width) {
    > 1272.0 => 1240.0,
    double w => w - 32,
  };
}
