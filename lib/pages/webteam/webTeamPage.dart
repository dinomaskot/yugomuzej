import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/webteam/webTeamPageDesktop.dart';
import 'package:yugomuzej/pages/webteam/webTeamPageMobile.dart';

class WebTeamPage extends StatelessWidget {
  const WebTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return const WebTeamPageDesktop();
        } else {
          return const WebTeamPageMobile();
        }
      },
      // ),
    );
  }
}
