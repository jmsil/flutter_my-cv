import 'dart:ui';

import 'package:archive/archive.dart';
import 'package:flutter/services.dart';

class AppAssets {
  AppAssets._();

  static late final Uint8List background;
  static late final Uint8List imageSlider;
  static late final Uint8List profilePhoto;

  static GalleryAssets bciFortlevDriverAppAssets = GalleryAssets._(
    'assets/images/BciFortlevDriverApp/archive.zip'
  );

  static Future<void> loadStartupAssets() async {
    String path = 'assets/images/startup/';
    background = await _load('${path}background.png');
    imageSlider = await _load('${path}image_slider.png');
    profilePhoto = await _load('${path}profile_photo.jpeg');
  }

  static Future<Uint8List> _load(String path) async {
    ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }
}


class GalleryAssets {
  GalleryAssets._(String assetName)
    : this._assetName = assetName;

  final String _assetName;
  final List<Uint8List> _images = [];
  final List<Uint8List> _thumbnails = [];

  int _count = 0;
  int get count => _count;

  int _thumbnailWidth = 0;
  int get thumbnailWidth => _thumbnailWidth;

  int _thumbnailHeight = 0;
  int get thumbnailHeight => _thumbnailHeight;

  Future<void> load() async {
    if (_count > 0)
      return;

    Uint8List asset = await AppAssets._load(_assetName);
    Archive archive = ZipDecoder().decodeBytes(asset);
    _count = archive.length ~/ 2;

    for (int i = 1; i <= _count; i++) {
      _images.add(
        archive.find('images/${i}.jpeg')!.content
      );
      _thumbnails.add(
        archive.find('thumbnails/${i}.jpeg')!.content
      );
    }

    Codec thumbnailCodec = await instantiateImageCodec(_thumbnails[0]);
    FrameInfo thumbnailFrame = await thumbnailCodec.getNextFrame();
    _thumbnailWidth = thumbnailFrame.image.width;
    _thumbnailHeight = thumbnailFrame.image.height;
  }

  Uint8List getImage(int index) => _images[index];
  Uint8List getThumbnail(int index) => _thumbnails[index];
}