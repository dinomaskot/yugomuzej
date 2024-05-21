import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/desktop/pictures/picturesPageDesktop.dart';
import 'package:yugomuzej/pages/desktop/pictures/picturesPageMobile.dart';

class DesktopPicturePage extends StatelessWidget {
  const DesktopPicturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return const DesktopPicturePageDesktop();
        } else {
          return const DesktopPicturePageMobile();
        }
      },
      // ),
    );
  }
}
