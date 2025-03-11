import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpdart/fpdart.dart';
import '../../../gen/assets.gen.dart';
import '../../common/image_widget.dart';
import '../../common/styles.dart';
import '../../common/widget_button.dart';
import '../../models/status_image_data.dart';
import '../../../providers.dart';
import '../../../utils/fp.dart';

class MangaCover extends ConsumerWidget {
  final double width;

  const MangaCover({required this.width, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mangaId = ref.read(SP.mangaManager).map((m) => m.mangaId);
    final cover = ref
        .watch(
          SP.mangaManager.select((manga) => manga.map((m) => m.cover)),
        )
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
            (c) => ImageWidget(
              imageData: c.image,
              mangaId: mangaId,
              width: width,
            ),
          ),
          const _CoverEditingButtons(),
          if (cover != null && cover.status != ImageDataStatus.none)
            const Positioned(
              top: 16,
              left: 16,
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
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(SP.editingModeOnManager)
          ? Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: ref
                        .watch(
                          SP.mangaManager.select(
                            (m) => m.flatMap(
                              (manga) => manga.cover.toOption(identity),
                            ),
                          ),
                        )
                        .fold(
                          () => [
                            WidgetButton(
                              onTap: ref
                                  .read(SP.mangaManager.notifier)
                                  .uploadCoverImage,
                              child: Text(
                                ref
                                    .watch(SP.localizationManager)
                                    .translations
                                    .mangaContents
                                    .coverUpload,
                                style: Styles.pr.copyWith(color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const _CoverNameInput(),
                          ],
                          (_) => [
                            WidgetButton(
                              onTap: ref
                                  .read(SP.mangaManager.notifier)
                                  .removeCoverImage,
                              child: Text(
                                ref
                                    .watch(SP.localizationManager)
                                    .translations
                                    .mangaContents
                                    .coverRemove,
                                style: Styles.pr.copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                  ),
                ),
              ),
            )
          : const SizedBox();
}

class _CoverNameInput extends ConsumerStatefulWidget {
  const _CoverNameInput();

  @override
  ConsumerState<_CoverNameInput> createState() => _CoverNameInputState();
}

class _CoverNameInputState extends ConsumerState<_CoverNameInput> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                autocorrect: false,
                controller: _textEditingController,
                cursorColor: Colors.white,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: const TextStyle(
                    color: Colors.white60,
                  ),
                  hintText: ref
                      .watch(SP.localizationManager)
                      .translations
                      .mangaContents
                      .coverUrl,
                ),
              ),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () => ref
                  .read(SP.mangaManager.notifier)
                  .setLinkCover(_textEditingController.text),
              icon: SvgPicture.asset(
                Assets.icons.check,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      );
}
