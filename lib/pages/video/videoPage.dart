import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/video/videoPageDesktop.dart';
import 'package:yugomuzej/pages/video/videoPageMobile.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return const VideoPageDesktop();
        } else {
          return const VideoPageMobile();
        }
      },
      // ),
    );
  }
}
