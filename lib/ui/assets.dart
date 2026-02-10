import 'dart:collection';

import 'package:flutter/material.dart';

class AppAssets {
  AppAssets._();

  static const String _startupAssetsPath = 'assets/images/startup/';
  static const String background  = '${_startupAssetsPath}background.png';
  static const String image_slider = '${_startupAssetsPath}image_slider.png';
  static const String profile_photo = '${_startupAssetsPath}profile_photo.heic';

  static AssetsFolder bciFortlevDriverAppAssetsFolder = AssetsFolder._(
    'assets/images/BciFortlevDriverApp/', 10
  );
}

class AssetsFolder {
  final List<String> _fileNames = [];
  List<String> get fileNames => UnmodifiableListView(_fileNames);

  AssetsFolder._(String folderPath, int fileCount) {
    for (int i = 1; i <= fileCount; i++)
      _fileNames.add('${folderPath}${i}.heic');
  }

  Future<void> precache(BuildContext context) async {
    for (String fileName in _fileNames)
      await precacheImage(AssetImage(fileName), context);
    await Future.delayed(Duration(milliseconds: 500));
  }
}