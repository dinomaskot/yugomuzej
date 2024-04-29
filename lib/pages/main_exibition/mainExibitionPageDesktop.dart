// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/menu.dart';

class MainExibitionPageDesktop extends StatefulWidget {
  // final String id;
  // const MainExibitionPageDesktop({super.key, required this.id});
  const MainExibitionPageDesktop({super.key});

  @override
  State<MainExibitionPageDesktop> createState() => _MainExibitionPageDesktopState();
}

class _MainExibitionPageDesktopState extends State<MainExibitionPageDesktop> {
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
                      children: [
                        Menu(title: loc.mainExibition.menu),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 52; i++)
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: InkWell(
                                    child: Container(
                                      margin: EdgeInsets.zero,
                                      height: 11,
                                      width: 11,
                                      decoration: BoxDecoration(border: Border.all()),
                                      child: Text(
                                        '${i + 1}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 7, fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    onTap: () => setState(() => index = i + 1),
                                  ),
                                )
                            ],
                          ),
                        ),
                        // Content(index: index),
                        Container(
                          padding: EdgeInsets.all(20),
                          height: 300,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: 400,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      loc.mainExibition.getByKey("me${index}a"),
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      loc.mainExibition.getByKey("me${index}b"),
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      loc.mainExibition.getByKey("me${index}c"),
                                      style: TextStyle(fontSize: 12),
                                      // Adjust the font size as needed
                                    ),
                                    SizedBox(height: 3),
                                    Text(
                                      loc.mainExibition.getByKey("me${index}d"),
                                      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  loc.mainExibition.click,
                                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                                ),
                              ),
                              Column(
                                children: [
                                  Spacer(),
                                  SizedBox(
                                    width: 200,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        index > 1
                                            ? InkWell(
                                                onTap: () => setState(() {
                                                  index = index - 1;
                                                }),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                  child: Image.asset(
                                                    "assets/_assets/images/left.png",
                                                    // scale: ,
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),

                                        // Spacer(),
                                        index < 52
                                            ? InkWell(
                                                onTap: () => setState(() {
                                                  index = index + 1;
                                                }),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                  child: Image.asset(
                                                    "assets/_assets/images/right.png",
                                                    // scale: ,
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),
                                  Hero(
                                    tag: 'image',
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          HeroDialogRoute(
                                            builder: (BuildContext context) {
                                              return Center(
                                                child: AlertDialog(
                                                  content: Hero(
                                                    tag: 'image',
                                                    child: SizedBox(
                                                      child: Image.asset("assets/_assets/images/main_exhibition/$index.webp"),
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
                                        width: 200,
                                        child: Image.asset(
                                          "assets/_assets/images/main_exhibition/$index.webp",
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
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
