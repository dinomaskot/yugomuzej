import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/souvenires/SouveniresPageDesktop.dart';
import 'package:yugomuzej/pages/souvenires/SouveniresPageMobile.dart';

class SouveniresPage extends StatelessWidget {
  const SouveniresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return SouveniresPageDesktop();
        } else {
          return SouveniresPageMobile();
        }
      },
      // ),
    );
  }
}
