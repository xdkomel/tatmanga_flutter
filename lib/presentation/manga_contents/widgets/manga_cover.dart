import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/image_widget.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/widget_button.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class MangaCover extends ConsumerWidget {
  final double width;

  const MangaCover({super.key, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mangaId = ref.read(SP.mangaManager).map((m) => m.mangaId);
    final cover = ref
        .watch(SP.mangaManager.select((manga) => manga.map((m) => m.cover)))
        .toNullable();
    return mangaId.fold(
      () => const SizedBox(),
      (mangaId) => Stack(
        children: [
          cover.fold(
            () => Container(
              width: width,
              height: width,
              color: Colors.black38,
            ),
            (cover) => ImageWidget(
              key: ObjectKey(cover.image),
              imageData: cover.image,
              mangaId: mangaId,
              width: width,
            ),
          ),
          const _CoverEditingButtons(),
          if (cover != null && cover.status != ImageDataStatus.none)
            const Positioned(
              top: 8,
              left: 8,
              child: CircularProgressIndicator(color: Colors.white),
            ),
        ],
      ),
    );
  }
}

class _CoverEditingButtons extends ConsumerWidget {
  const _CoverEditingButtons();

  @override
  Widget build(BuildContext context, WidgetRef ref) => ref
          .watch(SP.editingModeOnManager)
      ? Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WidgetButton(
                    onTap: ref.read(SP.mangaManager.notifier).uploadCoverImage,
                    child: Text(
                      'Сменить',
                      style: Styles.pr.copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  WidgetButton(
                    onTap: ref.read(SP.mangaManager.notifier).removeCoverImage,
                    child: Text(
                      'Удалить',
                      style: Styles.pr.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      : const SizedBox();
}
