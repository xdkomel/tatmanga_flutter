import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tatmanga_flutter/presentation/common/page_body.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/manga_list/widgets/add_manga_card.dart';
import 'package:tatmanga_flutter/presentation/manga_list/widgets/manga_card.dart';
import 'package:tatmanga_flutter/presentation/models/manga.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/responsive_ui.dart';

class MangaListScreen extends ConsumerStatefulWidget {
  const MangaListScreen({super.key});

  @override
  ConsumerState<MangaListScreen> createState() => _MangaListScreenState();
}

class _MangaListScreenState extends ConsumerState<MangaListScreen> {
  @override
  void initState() {
    super.initState();
    loadAll();
  }

  Future<void> loadAll() => ref
      .read(
        SP.mangaLoadingManager.notifier,
      )
      .loadManga();

  @override
  Widget build(BuildContext context) => const PageBody(
        children: [
          _Body(),
        ],
      );
}

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(SP.mangaLoadingManager).fold(
            () => const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(24),
                child: CircularProgressIndicator(),
              ),
            ),
            (list) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    ref
                        .watch(SP.localizationManager)
                        .translations
                        .mangaList
                        .library,
                    style: Styles.h2b,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 20),
                  _CardsWrap(list: list),
                ],
              ),
            ),
          );
}

class _CardsWrap extends ConsumerWidget {
  final IList<Manga> list;
  const _CardsWrap({required this.list});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardWidth = _oneCardWidth(context);
    final mangaCards = list.map<Widget>(
      (m) => MangaCard(manga: m, width: cardWidth),
    );
    final cards = ref.watch(SP.editingModeOnManager)
        ? mangaCards.append(AddMangaCard(width: cardWidth))
        : mangaCards;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: cards.toList(),
    );
  }

  double _oneCardWidth(BuildContext context) {
    final width = contentWidth(context);
    return switch (width) {
      >= 1132 => (width - 64) / 5,
      >= 904 => (width - 56) / 4,
      >= 676 => (width - 48) / 3,
      _ => (width - 40) / 2,
    };
  }
}
