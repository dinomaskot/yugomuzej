import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/contact/contactPageDesktop.dart';
import 'package:yugomuzej/pages/contact/contactPageMobile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return const ContactPageDesktop();
        } else {
          return const ContactPageMobile();
        }
      },
      // ),
    );
  }
}
