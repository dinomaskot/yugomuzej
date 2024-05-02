// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/menu.dart';

class ShopSouveniresPageDesktop extends StatefulWidget {
  const ShopSouveniresPageDesktop({super.key});

  @override
  State<ShopSouveniresPageDesktop> createState() => _ShopSouveniresPageDesktopState();
}

class _ShopSouveniresPageDesktopState extends State<ShopSouveniresPageDesktop> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageController.addListener(() {
      if (pageController.page?.round() != currentIndex) {
        setState(() {
          currentIndex = pageController.page?.round() ?? 0;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

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
                        Menu(title: loc.shop.menu, back: true),
                        // const SizedBox(height: 40),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 290,
                                width: 270,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 28, 20, 0),
                                      child: Text(
                                        loc.shop.s1,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    // Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            loc.shop.s2,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            loc.shop.kbclink,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 380,
                                height: 290,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        currentIndex > 0
                                            ? InkWell(
                                                onTap: () => pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.linear),
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 3),
                                                  child: Image.asset(
                                                    "assets/_assets/images/left.png",
                                                  ),
                                                ),
                                              )
                                            : SizedBox(width: 60),
                                        Text(
                                          loc.shop.getByKey("s${currentIndex + 3}"),
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                        currentIndex < 3
                                            ? InkWell(
                                                onTap: () => pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear),
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 3),
                                                  child: Image.asset(
                                                    "assets/_assets/images/right.png",
                                                  ),
                                                ),
                                              )
                                            : SizedBox(width: 60),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 380,
                                      height: 260,
                                      child: PageView(
                                        controller: pageController,
                                        children: [
                                          Image.asset("assets/shop/souvenires/1.webp"),
                                          Image.asset("assets/shop/souvenires/2.webp"),
                                          Image.asset("assets/shop/souvenires/3.webp"),
                                          Image.asset("assets/shop/souvenires/4.webp"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
  // TODO: implement barrierLabel
  String? get barrierLabel => "";
}
