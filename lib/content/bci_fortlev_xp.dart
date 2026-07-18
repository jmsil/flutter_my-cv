import 'package:flutter/material.dart';

import '../ui/assets.dart';
import '../ui/button/loading_button.dart';
import '../ui/layout/layout.dart';
import '../ui/strings/strings.dart';
import '../ui/strings/strings_provider.dart';
import '../ui/text.dart';
import 'expandable.dart';

class BciFortlevExperience extends ExpandableContent {
  BciFortlevExperience()
    : super(
        headerTitle: StringsProvider.strings.fortlevExperienceTitle,
        headerDetail: StringsProvider.strings.fortlevExperienceDetail,
        infoWidget: Row(
          spacing: AppLayout.xLargeSpacing,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Wrap(
                spacing: AppLayout.xLargeSpacing,
                runSpacing: AppLayout.smallSpacing,
                children: [
                  AppLink(text: Strings.bciShortLink, link: Strings.bciLink),
                  AppLink(text: Strings.fortlevShortLink, link: Strings.fortlevLink)
                ]
              )
            ),
            AppGalleryButton(AppAssets.bciFortlevDriverAppAssets)
          ]
        ),
        infoText: StringsProvider.strings.fortlevExperienceInfo,
        startOpen: false
      );
}