// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/bottomMenu.dart';
import 'package:yugomuzej/widgets/customInkWell.dart';
import 'package:yugomuzej/widgets/menu.dart';

class AuthorPageMobile extends StatefulWidget {
  // final String id;
  // const AuthorPageMobile({super.key, required this.id});
  const AuthorPageMobile({super.key});

  @override
  State<AuthorPageMobile> createState() => _AuthorPageMobileState();
}

class _AuthorPageMobileState extends State<AuthorPageMobile> {
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
            MenuMobile(title: loc.mainExibition.menu),
            Expanded(child: SizedBox(), flex: 1),
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
                                      child: Image.asset("assets/_assets/images/main_exhibition/$index.webp"),
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
                      "assets/_assets/images/main_exhibition/$index.webp",
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
                child: SingleChildScrollView(
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
              ),
            ),
            // Spacer(),

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
                  index < 52
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
