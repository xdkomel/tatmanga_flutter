import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' hide State;
import 'package:tatmanga_flutter/presentation/common/styles.dart';

class WidgetButton extends StatelessWidget {
  final void Function() onTap;
  final Either<String, Widget> child;
  final double borderRadius;

  const WidgetButton({
    super.key,
    required this.child,
    required this.onTap,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) => TextButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          padding: const WidgetStatePropertyAll(EdgeInsets.all(0)),
        ),
        onPressed: onTap,
        child: child.fold(
          (text) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
            child: Text(text, style: Styles.pr),
          ),
          identity,
        ),
      );
}
