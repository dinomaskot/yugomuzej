// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/menu.dart';

class ShopDrawingsPageDesktop extends StatefulWidget {
  const ShopDrawingsPageDesktop({super.key});

  @override
  State<ShopDrawingsPageDesktop> createState() => _ShopDrawingsPageDesktopState();
}

class _ShopDrawingsPageDesktopState extends State<ShopDrawingsPageDesktop> {
  final scrollController = ScrollController();

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
                // double maxHeight = MediaQuery.of(context).size.height * 0.6; // 60% of screen height

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
                    child: Container(margin: const EdgeInsets.all(2.5), child: const HomeMenu()));
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Menu(
                          title: loc.shop.menu,
                          back: true,
                        ),
                        const Spacer(),
                        Container(
                          height: 313,
                          child: Scrollbar(
                            controller: scrollController,
                            thumbVisibility: true,
                            child: GridView(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              controller: scrollController,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                childAspectRatio: 16 / 13,
                              ),
                              children: [
                                for (int i = 1; i <= 48; i++)
                                  Hero(
                                    tag: 'image$i',
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          HeroDialogRoute(
                                            builder: (BuildContext context) {
                                              return Center(
                                                child: AlertDialog(
                                                  content: Hero(
                                                    tag: 'image$i',
                                                    child: SizedBox(
                                                      child: Image.asset("assets/shop/drawings/$i.webp"),
                                                    ),
                                                  ),
                                                  actions: <Widget>[
                                                    IconButton(
                                                      icon: const Icon(Icons.close),
                                                      onPressed: Navigator.of(context).pop,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        // padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
                                        child: Image.asset("assets/shop/drawings/$i.webp"),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
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
