import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tatmanga_flutter/presentation/common/localization_manager.dart';
import 'package:tatmanga_flutter/presentation/common/resources.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/common/widget_button.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/responsive_ui.dart';

class PageBody extends StatelessWidget {
  final List<Widget> children;
  final List<String> breadCrumbs;
  const PageBody({
    super.key,
    required this.children,
    this.breadCrumbs = const [],
  });

  @override
  Widget build(BuildContext context) {
    final width = contentWidth(context);
    return Scaffold(
      backgroundColor: Styles.background,
      body: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              const _FlexibleMenu(),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (breadCrumbs.isNotEmpty) ...[
                        Row(
                          children: breadCrumbs.indexed
                              .expand(
                                (bc) => [
                                  WidgetButton(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        bc.$2,
                                        style: Styles.pr
                                            .copyWith(color: Styles.prime400),
                                      ),
                                    ),
                                    onTap: () {
                                      for (final _ in Iterable.generate(
                                        breadCrumbs.length - bc.$1,
                                      )) {
                                        Navigator.of(context).pop();
                                      }
                                    },
                                  ),
                                  Text(
                                    '·',
                                    style: Styles.pb
                                        .copyWith(color: Styles.prime400),
                                  ),
                                ],
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 16),
                      ],
                      ...children,
                      const SizedBox(height: 24),
                      const _BottomLine(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title();

  @override
  Widget build(BuildContext context, WidgetRef ref) => Text(
        ref.watch(SP.localizationManager).translations.common.name,
        style: Styles.h3b,
      );
}

class _LanguageSelector extends ConsumerWidget {
  const _LanguageSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) => WidgetButton(
        onTap: ref.read(SP.localizationManager.notifier).toggleLocalization,
        child: Text(
          switch (ref.watch(SP.localizationManager).language) {
            Language.en => 'EN',
            Language.tt => 'ТТ',
            Language.ru => 'РУ',
          },
        ),
      );
}

class _EditButton extends ConsumerWidget {
  const _EditButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(SP.authenticationManager).fold(
            () => const SizedBox(),
            (data) => Padding(
              padding: const EdgeInsets.only(right: 16),
              child: WidgetButton(
                onTap: ref.read(SP.editingModeOnManager.notifier).toggle,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    ref.watch(SP.editingModeOnManager)
                        ? ref
                            .watch(SP.localizationManager)
                            .translations
                            .common
                            .stopEditing
                        : ref
                            .watch(SP.localizationManager)
                            .translations
                            .common
                            .edit,
                    style: Styles.pr,
                  ),
                ),
              ),
            ),
          );
}

class _AuthorizeButton extends ConsumerWidget {
  const _AuthorizeButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(SP.authenticationManager).fold(
            () => WidgetButton(
              onTap: ref.read(SP.authenticationManager.notifier).auth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  ref
                      .watch(SP.localizationManager)
                      .translations
                      .common
                      .authorize,
                  style: Styles.pr,
                ),
              ),
            ),
            (data) => Text(data.displayName, style: Styles.pb),
          );
}

class _BottomLine extends ConsumerWidget {
  const _BottomLine();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(SP.localizationManager).translations.common.name;
    return Text(
      '$name | ${DateTime.now().year}',
      style: Styles.h4r.copyWith(color: Styles.prime500),
      textAlign: TextAlign.center,
    );
  }
}

class _FlexibleMenu extends StatefulWidget {
  const _FlexibleMenu();

  @override
  State<_FlexibleMenu> createState() => _FlexibleMenuState();
}

class _FlexibleMenuState extends State<_FlexibleMenu> {
  bool _showAdditionalMenu = false;

  _foldWidth<T>(double width, T wide, T narrow) => switch (width) {
        >= 708 => wide,
        _ => narrow,
      };

  @override
  Widget build(BuildContext context) {
    final width = contentWidth(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            SvgPicture.asset(Resources.logo),
            const SizedBox(width: 6),
            const _Title(),
            const Spacer(),
            ..._foldWidth(
              width,
              [
                const _LanguageSelector(),
                const SizedBox(width: 16),
                const _EditButton(),
                const _AuthorizeButton(),
              ],
              [
                IconButton(
                  onPressed: () => setState(
                      () => _showAdditionalMenu = !_showAdditionalMenu),
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),
          ],
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: _foldWidth(
            width,
            const SizedBox(),
            _showAdditionalMenu
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _LanguageSelector(),
                      SizedBox(width: 16),
                      _EditButton(),
                      _AuthorizeButton(),
                    ],
                  )
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}
