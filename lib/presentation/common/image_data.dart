import 'dart:typed_data';

sealed class ImageData {
  final String name;
  const ImageData(this.name);
}

class UrlImage extends ImageData {
  final String url;
  const UrlImage(super.name, this.url);
}

class NamedImage extends ImageData {
  const NamedImage(super.name);
}

class BytesImage extends ImageData {
  final Uint8List bytes;
  const BytesImage(super.name, this.bytes);
}
