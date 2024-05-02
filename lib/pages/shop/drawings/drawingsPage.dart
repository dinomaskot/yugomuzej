import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/shop/drawings/drawingsPageDesktop.dart';
import 'package:yugomuzej/pages/shop/drawings/drawingsPageMobile.dart';

class ShopDrawingsPage extends StatelessWidget {
  const ShopDrawingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return ShopDrawingsPageDesktop();
        } else {
          return ShopDrawingsPageMobile();
        }
      },
      // ),
    );
  }
}
