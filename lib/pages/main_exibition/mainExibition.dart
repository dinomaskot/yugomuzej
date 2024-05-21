import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/main_exibition/mainExibitionPageDesktop.dart';
import 'package:yugomuzej/pages/main_exibition/mainExibitionPageMobile.dart';

class MainExibitionPage extends StatelessWidget {
  // final String id;
  const MainExibitionPage({super.key});
  // const MainExibitionPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return const MainExibitionPageDesktop(
              // id: id,
              );
        } else {
          return const MainExibitionPageMobile(
              // id: id,
              );
        }
      },
      // ),
    );
  }
}
