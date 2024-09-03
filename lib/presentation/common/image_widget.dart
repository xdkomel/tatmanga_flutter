import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/styles.dart';
import 'package:tatmanga_flutter/presentation/models/image_data.dart';
import 'package:tatmanga_flutter/providers.dart';
import 'package:tatmanga_flutter/utils/fp.dart';

class ImageWidget extends ConsumerStatefulWidget {
  final ImageData imageData;
  final String mangaId;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double radius;

  const ImageWidget({
    super.key,
    required this.imageData,
    required this.mangaId,
    this.width,
    this.height,
    this.fit,
    this.radius = 0,
  });

  @override
  ConsumerState<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends ConsumerState<ImageWidget> {
  String? _loadedUrl;

  @override
  void initState() {
    _loadUrl();
    super.initState();
  }

  Future<void> _loadUrl() => switch (widget.imageData) {
        NamedImage ni => run(
            () async {
              final url = await ref
                  .read(
                    P.mangaContentRepository,
                  )
                  .getDownloadUrl(
                    widget.mangaId,
                    ni.name,
                  );
              SchedulerBinding.instance.addPostFrameCallback(
                (_) {
                  if (mounted) {
                    setState(
                      () => _loadedUrl = url.toNullable(),
                    );
                  }
                },
              );
            },
          ),
        _ => Future.value(),
      };

  @override
  Widget build(BuildContext context) {
    final image = _loadedUrl.fold(
      () => widget.imageData,
      (url) => switch (widget.imageData) {
        FirebaseName fn => NamedUrlImage(fn.name, url),
        _ => UrlImage(url),
      },
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      clipBehavior: Clip.antiAlias,
      child: switch (image) {
        NamedImage _ => Container(
            width: widget.width,
            height: widget.height,
            color: Colors.black38,
          ),
        BytesImage bi => Image.memory(
            bi.bytes,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
          ),
        UrlImage ui => _UrlImageWidget(
            url: ui.url,
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
          ),
        NamedUrlImage ui => _UrlImageWidget(
            url: ui.url,
            height: widget.height,
            width: widget.width,
            fit: widget.fit,
          ),
      },
    );
  }
}

class _UrlImageWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const _UrlImageWidget({
    required this.url,
    required this.height,
    required this.width,
    required this.fit,
  });

  @override
  Widget build(BuildContext context) =>
      // Image.network(
      //       url,
      //       width: width,
      //       height: height,
      //       fit: fit,
      //       loadingBuilder: (context, child, progress) {
      //         return progress.fold(
      //           () => child,
      //           (p) => Container(
      //             width: width,
      //             height: height,
      //             color: Colors.black38,
      //             child: Center(
      //               child: CircularProgressIndicator(
      //                 value: p.expectedTotalBytes != null
      //                     ? p.cumulativeBytesLoaded / (p.expectedTotalBytes ?? 1)
      //                     : null,
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //       errorBuilder: (context, msg, _) => Container(
      //         width: width,
      //         height: height,
      //         color: Colors.black38,
      //         child: Center(
      //           child: Text(
      //             '$msg',
      //             style: Styles.h4b.copyWith(color: Colors.white),
      //           ),
      //         ),
      //       ),
      //     );
      CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: url,
        fit: fit,
        placeholder: (context, _) => Container(
          width: width,
          height: height,
          color: Colors.black38,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, msg, __) => Container(
          width: width,
          height: height,
          color: Colors.black38,
          child: Center(
            child: Text(
              msg,
              style: Styles.h4b.copyWith(color: Colors.white),
            ),
          ),
        ),
      );
}
