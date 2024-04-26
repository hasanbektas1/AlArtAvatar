import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

mixin SaveImageGalleryMixin {
  void saveImageGalley(Uint8List imageBytes) async {
    print("kayır image");
    try {
      final result = await ImageGallerySaver.saveImage(imageBytes);
      if (result['isSuccess']) {
        print('Image saved to gallery!');
      } else {
        print('Error saving image: ${result['error']}');
      }
    } catch (e) {
      print('Error saving image: $e');
    }
  }
}
