import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/exhibitions/exibitionsSubPage/exibitionsSubPageDesktop.dart';
import 'package:yugomuzej/pages/exhibitions/exibitionsSubPage/exibitionsSubPageMobile.dart';

class ExibitionSubPage extends StatelessWidget {
  final String id;
  const ExibitionSubPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return ExibitionSubPageDesktop(
            id: id,
          );
        } else {
          return const ExibitionSubPageMobile();
        }
      },
      // ),
    );
  }
}
