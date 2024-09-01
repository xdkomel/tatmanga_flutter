import 'dart:typed_data';

sealed class ImageData {
  const ImageData();
}

mixin FirebaseName {
  String get name;
}

class UrlImage extends ImageData {
  final String url;

  const UrlImage(this.url);
}

class NamedUrlImage extends ImageData with FirebaseName {
  final String url;
  final String _name;

  const NamedUrlImage(this._name, this.url);

  @override
  String get name => _name;
}

class NamedImage extends ImageData with FirebaseName {
  final String _name;

  const NamedImage(this._name);

  @override
  String get name => _name;
}

class BytesImage extends ImageData with FirebaseName {
  final Uint8List bytes;
  final String _name;

  const BytesImage(this._name, this.bytes);

  @override
  String get name => _name;
}
