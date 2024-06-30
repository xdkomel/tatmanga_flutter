import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/presentation/common/widget_button.dart';

class AddMangaCard extends StatelessWidget {
  final double width;
  const AddMangaCard({super.key, required this.width});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: width,
        height: width,
        child: Center(
          child: WidgetButton(
            child: const Right(Center(
              child: Icon(Icons.add),
            )),
            onTap: () {},
          ),
        ),
      );
}
