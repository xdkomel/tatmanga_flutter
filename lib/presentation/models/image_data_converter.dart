import '../../domain/models/single_image.dart';
import 'image_data.dart';

extension ImageDataConverter on ImageData {
  SingleImage get toSingleImage => switch (this) {
        UrlImage ui => SingleImage.url(url: ui.url),
        NamedUrlImage nui => SingleImage.firebaseFile(fileName: nui.name),
        NamedImage ni => SingleImage.firebaseFile(fileName: ni.name),
        BytesImage bi => SingleImage.firebaseFile(fileName: bi.name),
      };
}
