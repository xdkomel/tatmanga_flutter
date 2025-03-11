import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../gen/assets.gen.dart';
import 'localization_manager.dart';
import 'resources.dart';
import 'styles.dart';
import 'widget_button.dart';
import '../../providers.dart';
import '../../utils/responsive_ui.dart';

class PageBody extends StatelessWidget {
  final List<Widget> children;
  final List<BreadCrumb> breadCrumbs;
  const PageBody({
    required this.children,
    super.key,
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
                          children: breadCrumbs
                              .expand(
                                (bc) => [
                                  WidgetButton(
                                    onTap: bc.navigate,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Text(
                                        bc.name,
                                        style: Styles.pr
                                            .copyWith(color: Styles.prime400),
                                      ),
                                    ),
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
                      const SizedBox(height: 24),
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

class BreadCrumb {
  BreadCrumb({required this.name, required this.navigate});
  final String name;
  final void Function() navigate;
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
                  child: SvgPicture.asset(
                    width: 24,
                    height: 24,
                    ref.watch(SP.editingModeOnManager)
                        ? Assets.icons.editOff
                        : Assets.icons.edit,
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

class _AuthorizeButton extends ConsumerWidget {
  const _AuthorizeButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(SP.authenticationManager).fold(
            () => WidgetButton(
              onTap: ref.read(SP.authenticationManager.notifier).auth,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: SvgPicture.asset(
                  Assets.icons.login,
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Styles.secondary,
                    BlendMode.srcIn,
                  ),
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
                const _EditButton(),
                const _AuthorizeButton(),
              ],
              [
                IconButton(
                  onPressed: () => setState(
                    () => _showAdditionalMenu = !_showAdditionalMenu,
                  ),
                  icon: SvgPicture.asset(
                    Assets.icons.menu,
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Styles.secondary,
                      BlendMode.srcIn,
                    ),
                  ),
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
