import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/shop/souvenires/souveniresPageDesktop.dart';
import 'package:yugomuzej/pages/shop/souvenires/souveniresPageMobile.dart';

class ShopSouveniresPage extends StatelessWidget {
  const ShopSouveniresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return ShopSouveniresPageDesktop();
        } else {
          return ShopSouveniresPageMobile();
        }
      },
      // ),
    );
  }
}
