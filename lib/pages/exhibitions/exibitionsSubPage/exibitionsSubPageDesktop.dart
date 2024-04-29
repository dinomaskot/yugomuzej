// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/menu.dart';

class ExibitionSubPageDesktop extends StatefulWidget {
  final String id;
  const ExibitionSubPageDesktop({super.key, required this.id});

  @override
  State<ExibitionSubPageDesktop> createState() => _ExibitionSubPageDesktopState();
}

class _ExibitionSubPageDesktopState extends State<ExibitionSubPageDesktop> {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Menu(title: loc.exibitions.menu, back: true),
                        Spacer(),
                        SizedBox(
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              loc.exibitions.getByKey("ex${widget.id}"),
                              style: const TextStyle(
                                  // color: Globals.darkGrey,
                                  // fontFamily: "ArialBlack",
                                  ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Hero(
                                tag: 'image1',
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      HeroDialogRoute(
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: AlertDialog(
                                              content: Hero(
                                                tag: 'image1',
                                                child: SizedBox(
                                                  child: Image.asset("assets/exhibitions/${widget.id}/1.webp"),
                                                  // child: Image.asset("assets/_assets/images/main_exhibition/$index.webp"),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                IconButton(
                                                  icon: Icon(Icons.close),
                                                  onPressed: Navigator.of(context).pop,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 150,
                                    child: Image.asset("assets/exhibitions/${widget.id}/1.webp"),
                                  ),
                                ),
                              ),
                              Hero(
                                tag: 'image2',
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      HeroDialogRoute(
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: AlertDialog(
                                              content: Hero(
                                                tag: 'image2',
                                                child: SizedBox(
                                                  child: Image.asset("assets/exhibitions/${widget.id}/2.webp"),
                                                  // child: Image.asset("assets/_assets/images/main_exhibition/$index.webp"),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                IconButton(
                                                  icon: Icon(Icons.close),
                                                  onPressed: Navigator.of(context).pop,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 150,
                                    child: Image.asset("assets/exhibitions/${widget.id}/2.webp"),
                                  ),
                                ),
                              ),
                              Hero(
                                tag: 'image3',
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      HeroDialogRoute(
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: AlertDialog(
                                              content: Hero(
                                                tag: 'image3',
                                                child: SizedBox(
                                                  child: Image.asset("assets/exhibitions/${widget.id}/3.webp"),
                                                  // child: Image.asset("assets/_assets/images/main_exhibition/$index.webp"),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                IconButton(
                                                  icon: Icon(Icons.close),
                                                  onPressed: Navigator.of(context).pop,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 150,
                                    child: Image.asset("assets/exhibitions/${widget.id}/3.webp"),
                                  ),
                                ),
                              ),
                              Hero(
                                tag: 'image4',
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      HeroDialogRoute(
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: AlertDialog(
                                              content: Hero(
                                                tag: 'image4',
                                                child: SizedBox(
                                                  child: Image.asset("assets/exhibitions/${widget.id}/4.webp"),
                                                  // child: Image.asset("assets/_assets/images/main_exhibition/$index.webp"),
                                                ),
                                              ),
                                              actions: <Widget>[
                                                IconButton(
                                                  icon: Icon(Icons.close),
                                                  onPressed: Navigator.of(context).pop,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                    width: 150,
                                    child: Image.asset("assets/exhibitions/${widget.id}/4.webp"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            loc.mainExibition.click,
                            style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          BottomCarusel(
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
