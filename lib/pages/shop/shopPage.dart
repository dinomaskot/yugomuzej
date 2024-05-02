import 'package:flutter/material.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/pages/shop/shopPageDesktop.dart';
import 'package:yugomuzej/pages/shop/shopPageMobile.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > Globals.switchWidth) {
          return ShopPageDesktop();
        } else {
          return ShopPageMobile();
        }
      },
      // ),
    );
  }
}
