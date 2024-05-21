import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/about/aboutPageDesktop.dart';
import 'package:yugomuzej/pages/about/aboutPageMobile.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return const AboutPageDesktop();
        } else {
          return const AboutPageMobile();
        }
      },
    );
  }
}
