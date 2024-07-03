import 'package:flutter/material.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';

class TextEditingField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle style;

  const TextEditingField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.style,
  });

  @override
  Widget build(BuildContext context) => TextField(
        controller: controller,
        style: style,
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
