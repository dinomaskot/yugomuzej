import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/menu.dart';

class ShopPageDesktop extends StatefulWidget {
  const ShopPageDesktop({super.key});

  @override
  State<ShopPageDesktop> createState() => _ShopPageDesktopState();
}

class _ShopPageDesktopState extends State<ShopPageDesktop> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = MediaQuery.of(context).size.width * 0.8;
                double fixedWidth = 700;
                double width = fixedWidth < maxWidth ? fixedWidth : maxWidth;
                return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: width,
                    ),
                    child: Container(margin: const EdgeInsets.all(2.5), child: const HomeMenu()));
              },
            ),
          ),
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = MediaQuery.of(context).size.width * 0.8;
                double maxHeight = MediaQuery.of(context).size.height * 0.6;

                double fixedWidth = 700;
                double fixedHeight = 400;

                double width = fixedWidth < maxWidth ? fixedWidth : maxWidth;
                double height = fixedHeight < maxHeight ? fixedHeight : maxHeight;

                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: width,
                    maxHeight: height,
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Menu(title: loc.shop.menu),
                        // const SizedBox(height: 40),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () => context.go("/shop/souvenires"),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            loc.shop.souvenires,
                                            style: const TextStyle(color: Globals.darkGrey, fontFamily: "ArialBlack", fontSize: 12),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 3),
                                            child: Image.asset(
                                              "assets/_assets/images/right.png",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () => context.go("/shop/drawings"),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            loc.shop.drawings,
                                            style: const TextStyle(color: Globals.darkGrey, fontFamily: "ArialBlack", fontSize: 12),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 3),
                                            child: Image.asset(
                                              "assets/_assets/images/right.png",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset("assets/shop/14.jpg")
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const BottomCarusel(
            path: "assets/main_exibition",
          ),
        ],
      ),
    );
  }
}

class HeroDialogRoute<T> extends PageRoute<T> {
  HeroDialogRoute({required this.builder}) : super();

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  bool get maintainState => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut), child: child);
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return builder(context);
  }

  @override
  String? get barrierLabel => "";
}
