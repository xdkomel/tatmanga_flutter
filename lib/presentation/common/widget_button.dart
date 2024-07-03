import 'package:flutter/material.dart';

class WidgetButton extends StatelessWidget {
  final void Function() onTap;
  final Widget child;
  final double borderRadius;
  final Color? background;

  const WidgetButton({
    super.key,
    required this.child,
    required this.onTap,
    this.borderRadius = 8,
    this.background,
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
          backgroundColor: WidgetStatePropertyAll(background),
        ),
        onPressed: onTap,
        child: child,
      );
}
