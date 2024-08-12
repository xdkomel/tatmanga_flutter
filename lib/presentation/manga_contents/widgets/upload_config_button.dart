import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/widget_button.dart';
import 'package:tatmanga_flutter/providers.dart';

class UploadConfigButton extends ConsumerWidget {
  const UploadConfigButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(SP.editingModeOnManager)
          ? const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: _Button(),
            )
          : const SizedBox();
}

class _Button extends ConsumerWidget {
  const _Button();

  @override
  Widget build(BuildContext context, WidgetRef ref) => ref
      .watch(
        SP.mangaManager.select((m) => m.map((m) => m.configUploading)),
      )
      .fold(
        () => const SizedBox(),
        (cu) => WidgetButton(
          onTap: ref.read(SP.mangaManager.notifier).uploadConfig,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: cu
                ? const CircularProgressIndicator()
                : Text(
                    ref
                        .watch(SP.localizationManager)
                        .translations
                        .mangaContents
                        .save,
                    style: Styles.pr,
                  ),
          ),
        ),
      );
}
