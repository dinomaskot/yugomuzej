import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/home/homePageDesktop.dart';
import 'package:yugomuzej/pages/home/homePageMobile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return const HomePageDesktop();
        } else {
          return const HomePageMobile();
        }
      },
      // ),
    );
  }
}
