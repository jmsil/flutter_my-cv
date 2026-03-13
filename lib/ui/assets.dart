import 'dart:ui';

import 'package:flutter/services.dart';

class AppAssets {
  AppAssets._();

  static late final Uint8List background;
  static late final Uint8List imageSlider;
  static late final Uint8List profilePhoto;

  static AssetsFolder bciFortlevDriverAppAssetsFolder = AssetsFolder._(
    path: 'assets/images/BciFortlevDriverApp/',
    fileCount: 24,
    thumbnailWidth: 64,
    thumbnailHeight: 142
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

class AssetsFolder {
  final int fileCount;
  final int thumbnailWidth;
  final int thumbnailHeight;

  final String _path;
  final List<Uint8List> _images = [];
  final List<Uint8List> _thumbnails = [];

  AssetsFolder._({
    required String path,
    required this.fileCount,
    required this.thumbnailWidth,
    required this.thumbnailHeight
  })
    : this._path = path;

  Future<void> load() async {
    for (int i = 1; i <= fileCount; i++) {
      Uint8List image = await AppAssets._load('${_path}${i}.jpeg');
      Codec thumbnailCodec = await instantiateImageCodec(
        image,
        targetWidth: thumbnailWidth,
        targetHeight: thumbnailHeight
      );
      FrameInfo thumbnailFrame = await thumbnailCodec.getNextFrame();
      ByteData? thumbnailData = await thumbnailFrame.image.toByteData(
        format: ImageByteFormat.png
      );
      Uint8List thumbnail = thumbnailData!.buffer.asUint8List();

      _images.add(image);
      _thumbnails.add(thumbnail);
    }
  }

  void unload() {
    _images.clear();
    _thumbnails.clear();
  }

  Uint8List getImage(int index) => _images[index];
  Uint8List getThumbnail(int index) => _thumbnails[index];
}