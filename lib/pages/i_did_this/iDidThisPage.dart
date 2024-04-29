import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/i_did_this/iDidThisPageDesktop.dart';
import 'package:yugomuzej/pages/i_did_this/iDidThisPageMobile.dart';

class IDidThisPage extends StatelessWidget {
  const IDidThisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return IDidThisPageDesktop();
        } else {
          return IDidThisPageMobile();
        }
      },
      // ),
    );
  }
}
