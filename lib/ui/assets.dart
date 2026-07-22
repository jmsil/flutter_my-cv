import 'dart:ui';

import 'package:archive/archive.dart';
import 'package:flutter/services.dart';

class AppAssets {
  static late final Uint8List profilePhoto;

  static final GalleryAssets bciFortlevDriverAppAssets = GalleryAssets(
    'assets/BciFortlevDriverApp/archive.zip'
  );

  static final AssetsArchive apimProxyAssets = AssetsArchive(
    'assets/SapIntegrationSuiteLearningJourney/ApimProxy/archive.zip'
  );

  static final AssetsArchive calculatorAssets = AssetsArchive(
    'assets/SapIntegrationSuiteLearningJourney/Calculator/archive.zip'
  );

  static final AssetsArchive conversionsAndFtpAssets = AssetsArchive(
    'assets/SapIntegrationSuiteLearningJourney/ConversionsAndFtp/archive.zip'
  );

  static final AssetsArchive exceptionHandlerAssets = AssetsArchive(
    'assets/SapIntegrationSuiteLearningJourney/ExceptionHandler/archive.zip'
  );

  static final AssetsArchive sqlServerWithXsltAssets = AssetsArchive(
    'assets/SapIntegrationSuiteLearningJourney/SqlServerWithXslt/archive.zip'
  );

  static Future<void> loadStartupAssets() async {
    String path = 'assets/Startup/';
    profilePhoto = await _load('${path}profile_photo.jpeg');
  }

  static Future<Uint8List> _load(String assetName) async {
    ByteData data = await rootBundle.load(assetName);
    return data.buffer.asUint8List();
  }
}


class AssetsArchive {
  AssetsArchive(String assetName)
    : this._assetName = assetName;

  final String _assetName;
  final List<Uint8List> _files = [];

  int get count => _files.length;

  Future<void> load() async {
    if (count > 0)
      return;

    int id = 1;
    Uint8List asset = await AppAssets._load(_assetName);
    Archive archive = ZipDecoder().decodeBytes(asset);

    while(_added(archive, id))
      id++;
  }

  bool _added(Archive archive, int id) {
    ArchiveFile? file =
      archive.find('files/${id}.jpeg') ??
      archive.find('files/${id}.txt');

    if (file != null)
      _files.add(file.content);

    return file != null;
  }

  Uint8List getFile(int id) => _files[id - 1];
}


class GalleryAssets extends AssetsArchive {
  GalleryAssets(super.assetName);

  final List<Uint8List> _thumbnails = [];

  int _thumbnailWidth = 0;
  int get thumbnailWidth => _thumbnailWidth;

  int _thumbnailHeight = 0;
  int get thumbnailHeight => _thumbnailHeight;

  bool get isPortraitThumbnail => _thumbnailWidth < _thumbnailHeight;

  @override
  Future<void> load() async {
    await super.load();
    Codec thumbnailCodec = await instantiateImageCodec(_thumbnails[0]);
    FrameInfo thumbnailFrame = await thumbnailCodec.getNextFrame();
    _thumbnailWidth = thumbnailFrame.image.width;
    _thumbnailHeight = thumbnailFrame.image.height;
  }

  @override
  bool _added(Archive archive, int id) {
    bool added = super._added(archive, id);

    if (added) {
      _thumbnails.add(
        archive.find('thumbnails/${id}.jpeg')!.content
      );
    }

    return added;
  }

  Uint8List getThumbnail(int id) => _thumbnails[id - 1];
}