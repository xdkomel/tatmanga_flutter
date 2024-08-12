import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tatmanga_flutter/presentation/common/image_data.dart';
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
        NamedImage ni =>
          ref.read(P.storage).getUrl(widget.mangaId, ni.name).then(
                (url) => setState(() => _loadedUrl = url),
              ),
        _ => Future.value(),
      };

  @override
  Widget build(BuildContext context) {
    final image = _loadedUrl.fold(
      () => widget.imageData,
      (url) => switch (widget.imageData) {
        BytesImage bi => bi,
        _ => UrlImage(
            widget.imageData.name,
            url,
          ),
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
        UrlImage ui => CachedNetworkImage(
            width: widget.width,
            height: widget.height,
            imageUrl: ui.url,
            fit: widget.fit,
            placeholder: (context, _) => Container(
              width: widget.width,
              height: widget.height,
              color: Colors.black38,
            ),
            errorWidget: (context, _, __) => Container(
              width: widget.width,
              height: widget.height,
              color: Colors.black38,
            ),
          ),
        BytesImage bi => Image.memory(
            bi.bytes,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
          ),
      },
    );
  }
}
