import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/widget_button.dart';
import '../../../providers.dart';

class AddMangaCard extends ConsumerWidget {
  final double width;
  const AddMangaCard({required this.width, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SizedBox(
        width: width,
        height: width,
        child: Center(
          child: WidgetButton(
            onTap: ref.read(SP.mangaLoadingManager.notifier).addManga,
            child: const Center(
              child: Icon(Icons.add),
            ),
          ),
        ),
      );
}
