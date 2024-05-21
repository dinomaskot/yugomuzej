// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/bottomMenu.dart';
import 'package:yugomuzej/widgets/customInkWell.dart';
import 'package:yugomuzej/widgets/menu.dart';

class ExibitionPageDesktop extends StatefulWidget {
  const ExibitionPageDesktop({super.key});

  @override
  State<ExibitionPageDesktop> createState() => _ExibitionPageDesktopState();
}

class _ExibitionPageDesktopState extends State<ExibitionPageDesktop> {
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
                double maxWidth = MediaQuery.of(context).size.width * 0.8; // 80% of screen width
                double maxHeight = MediaQuery.of(context).size.height * 0.6; // 60% of screen height

                // Set fixed dimensions for InAppWebView
                double fixedWidth = 700;
                // double fixedHeight = 400;

                // Determine the actual width and height to use
                double width = fixedWidth < maxWidth ? fixedWidth : maxWidth;
                // double height = fixedHeight < maxHeight ? fixedHeight : maxHeight;

                return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: width,
                      // maxHeight: height,
                    ),
                    child: Container(margin: const EdgeInsets.all(2.5), child: HomeMenu()));
              },
            ),
          ),
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = MediaQuery.of(context).size.width * 0.8; // 80% of screen width
                double maxHeight = MediaQuery.of(context).size.height * 0.6; // 60% of screen height

                // Set fixed dimensions for InAppWebView
                double fixedWidth = 700;
                double fixedHeight = 400;

                // Determine the actual width and height to use
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
                      children: [
                        Menu(title: loc.exibitions.menu),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(height: 20),
                                  CustomInkWell(
                                    onTap: () => context.go("/exhibition/01"),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            loc.exibitions.belgrade,
                                            style: const TextStyle(
                                              color: Globals.darkGrey,
                                              fontFamily: "ArialBlack",
                                            ),
                                          ),
                                          Spacer(),
                                          // SizedBox(width: 8),
                                          Image.asset("assets/_assets/images/right.png", scale: 1.2),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  CustomInkWell(
                                    onTap: () => context.go("/exhibition/02"),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            loc.exibitions.saopaolo,
                                            style: const TextStyle(
                                              color: Globals.darkGrey,
                                              fontFamily: "ArialBlack",
                                            ),
                                          ),
                                          Spacer(),
                                          Image.asset("assets/_assets/images/right.png", scale: 1.2),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  CustomInkWell(
                                    onTap: () => context.go("/exhibition/03"),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            loc.exibitions.wien,
                                            style: const TextStyle(
                                              color: Globals.darkGrey,
                                              fontFamily: "ArialBlack",
                                            ),
                                          ),
                                          Spacer(),
                                          Image.asset("assets/_assets/images/right.png", scale: 1.2),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 100),
                                ],
                              ),
                            ),
                            Spacer(),
                            Image.asset("assets/exhibitions/main.webp"),
                            Spacer(),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          BottomCarusel(
            path: "assets/exhibitions/menu",
            numeberOfPictures: 21,
          ),
          const BottomMenu(),
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
