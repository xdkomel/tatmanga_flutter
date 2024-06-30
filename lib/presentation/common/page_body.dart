import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpdart/fpdart.dart';
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
              Row(
                children: [
                  SvgPicture.asset(Resources.logo),
                  const SizedBox(width: 6),
                  const Text('Татманга', style: Styles.h3b),
                  const Spacer(),
                  Consumer(
                    builder: (context, ref, _) => ref.watch(SP.authenticationManager).fold(
                          () => const SizedBox(),
                          (data) => WidgetButton(
                            onTap: ref.read(SP.editingModeOnManager.notifier).toggle,
                            child: Left(
                              ref.watch(SP.editingModeOnManager) ? 'Обычный вид' : 'Редактировать',
                            ),
                          ),
                        ),
                  ),
                  const SizedBox(width: 16),
                  Consumer(
                    builder: (context, ref, _) => ref.watch(SP.authenticationManager).fold(
                          () => WidgetButton(
                            onTap: ref.read(SP.authenticationManager.notifier).auth,
                            child: const Left('Авторизоваться'),
                          ),
                          (data) => Text(data.displayName, style: Styles.pb),
                        ),
                  ),
                ],
              ),
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
                                  Text(
                                    bc,
                                    style: Styles.pr.copyWith(color: Styles.prime400),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '·',
                                    style: Styles.pb.copyWith(color: Styles.prime400),
                                  ),
                                ],
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 16),
                      ],
                      ...children,
                      const SizedBox(height: 24),
                      Text(
                        'Татманга | 2024',
                        style: Styles.h4r.copyWith(color: Styles.prime500),
                        textAlign: TextAlign.center,
                      )
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
