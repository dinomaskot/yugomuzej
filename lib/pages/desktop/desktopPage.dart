import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/desktop/desktopPageDesktop.dart';
import 'package:yugomuzej/pages/desktop/desktopPageMobile.dart';

class DesktopPage extends StatelessWidget {
  const DesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return const DesktopPageDesktop();
        } else {
          return const DesktopPageMobile();
        }
      },
      // ),
    );
  }
}
