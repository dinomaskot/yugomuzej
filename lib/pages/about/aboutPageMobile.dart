// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/bottomMenu.dart';
import 'package:yugomuzej/widgets/customInkWell.dart';
import 'package:yugomuzej/widgets/menu.dart';

class AboutPageMobile extends StatefulWidget {
  // final String id;
  // const AboutPageMobile({super.key, required this.id});
  const AboutPageMobile({super.key});

  @override
  State<AboutPageMobile> createState() => _AboutPageMobileState();
}

class _AboutPageMobileState extends State<AboutPageMobile> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;

    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: maxHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MenuMobile(title: loc.about.menu),
            Expanded(child: SizedBox(), flex: 2),
            // Spacer(),
            Hero(
              tag: 'image',
              child: Card(
                color: Colors.white,
                elevation: 0,
                shape: LinearBorder(),
                margin: EdgeInsets.zero,
                child: CustomInkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      HeroDialogRoute(
                        builder: (BuildContext context) {
                          return Center(
                            child: Dialog.fullscreen(
                              backgroundColor: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Hero(
                                    tag: 'image',
                                    child: SizedBox(
                                      child: Image.asset("assets/about/0$index.webp"),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: Navigator.of(context).pop,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    width: maxWidth * 0.9,
                    child: Image.asset(
                      "assets/about/0$index.webp",
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.bottomLeft,
                width: maxWidth * 0.9,
                child: Text(
                  loc.about.about,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            // Spacer(),
            Expanded(child: SizedBox(), flex: 1),
            SizedBox(
              width: maxWidth * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  index > 1
                      ? CustomInkWell(
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
                  index < 4
                      ? CustomInkWell(
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
            // Spacer(),

            BottomCaruselMobile(
              path: "assets/main_exibition/menu",
              numeberOfPictures: 21,
            ),
            // Spacer(),
            HomeMenuMobile(),
            // const BottomMenu(),
          ],
        ),
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
