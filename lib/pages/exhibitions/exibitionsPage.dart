import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/exhibitions/exibitionsPageDesktop.dart';
import 'package:yugomuzej/pages/exhibitions/exibitionsPageMobile.dart';

class ExibitionPage extends StatelessWidget {
  const ExibitionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return const ExibitionPageDesktop();
        } else {
          return const ExibitionPageMobile();
        }
      },
      // ),
    );
  }
}
