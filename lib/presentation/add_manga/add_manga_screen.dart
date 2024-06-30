import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/models/status_image_data.dart';
import 'package:tatmanga_flutter/utils/fp.dart';
import 'package:tatmanga_flutter/presentation/models/editing_manga_model.dart';
import 'package:tatmanga_flutter/presentation/common/image_data.dart';
import 'package:tatmanga_flutter/presentation/common/image_widget.dart';
import 'package:tatmanga_flutter/providers.dart';

class AddMangaScreen extends ConsumerStatefulWidget {
  final String mangaId;

  const AddMangaScreen({super.key, required this.mangaId});

  @override
  ConsumerState<AddMangaScreen> createState() => _AddMangaScreenState();
}

class _AddMangaScreenState extends ConsumerState<AddMangaScreen> {
  late final TextEditingController _controllerTitle;
  late final TextEditingController _controllerDescr;

  @override
  void initState() {
    final state = ref.read(SP.editingMangaManager).toNullable();
    // TODO listen to the controller to update the state
    _controllerTitle = TextEditingController(text: state?.name);
    _controllerDescr = TextEditingController(text: state?.description);
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => ref.read(SP.editingMangaManager.notifier).setModel(
            EditingMangaModel(
              coverImage: const NamedImage('cover image'),
              mangaId: 'uh8ji039je0',
              name: 'name manga',
              description: 'description manga',
              authors: const IList.empty(),
              episodes: [
                const Episode(name: 'a', images: IList.empty()),
              ].lock,
            ),
          ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // TODO narrow the consumer to not update it on other updates
                Consumer(
                  builder: (context, ref, _) =>
                      ref.watch(SP.editingMangaManager).toNullable().map(
                            (v) => ImageWidget(
                              mangaId: v.mangaId,
                              imageData: v.coverImage,
                            ),
                          ) ??
                      const SizedBox(),
                ),
                TextField(
                  controller: _controllerTitle,
                ),
                TextField(
                  controller: _controllerDescr,
                ),
                // TODO narrow the consumer to not update it on other updates
                Consumer(
                  builder: (context, ref, _) =>
                      ref.watch(SP.editingMangaManager).toNullable().map(
                            (v) => Column(
                              children: v.episodes
                                  .expand(
                                    (e) => [
                                      Text(e.name),
                                      ...e.images.indexed.map(
                                        (i) => Stack(
                                          children: [
                                            ImageWidget(
                                              mangaId: v.mangaId,
                                              imageData: i.$2.image,
                                            ),
                                            ...switch (i.$2.status) {
                                              ImageDataStatus.uploading => [
                                                  const CircularProgressIndicator(),
                                                ],
                                              ImageDataStatus.deleting => [
                                                  Positioned.fill(
                                                    child: Container(
                                                      color: Colors.black.withAlpha(100),
                                                    ),
                                                  ),
                                                ],
                                              _ => []
                                            },
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                  .toList(),
                            ),
                          ) ??
                      const SizedBox(),
                ),
                ElevatedButton(
                  onPressed: () => ref.read(SP.editingMangaManager.notifier).addEpisodeImages(0),
                  child: const Text('Добавить картинок'),
                ),
                ElevatedButton(
                  onPressed: ref.read(SP.editingMangaManager.notifier).uploadConfig,
                  child: const Text('выгрузить'),
                ),
                // ElevatedButton(
                //   onPressed: () => ref.read(P.storage).uploadConfig(
                //         MangaConfig(
                //           mangaId: 'l1837he',
                //           title: _controllerTitle.text,
                //           description: _controllerDescr.text,
                //           coverName: null,
                //           authors: null,
                //           chapters: [],
                //         ),
                //       ),
                //   child: const Text('Выбрать файлы'),
                // ),
              ],
            ),
          ),
        ),
      );
}
