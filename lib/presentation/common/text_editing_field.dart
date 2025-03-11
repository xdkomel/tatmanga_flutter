import 'package:flutter/material.dart';
import 'styles.dart';

class TextEditingField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle style;
  final int? maxLines;

  const TextEditingField({
    required this.controller,
    required this.hintText,
    required this.style,
    this.maxLines = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        style: style,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Styles.primeInvert400),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Styles.primary),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
}
