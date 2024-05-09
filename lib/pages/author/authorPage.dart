import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/author/authorPageDesktop.dart';
import 'package:yugomuzej/pages/author/authorPageMobile.dart';

class AuthorPage extends StatelessWidget {
  const AuthorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return AuthorPageDesktop();
        } else {
          return AuthorPageMobile();
        }
      },
      // ),
    );
  }
}
