import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../gen/assets.gen.dart';
import '../../common/styles.dart';
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
            child: Center(
              child: SvgPicture.asset(
                Assets.icons.add,
                width: 24,
                height: 24,
                colorFilter: const ColorFilter.mode(
                  Styles.secondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      );
}
