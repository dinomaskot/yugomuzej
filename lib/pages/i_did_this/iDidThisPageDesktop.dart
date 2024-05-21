// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/bottomMenu.dart';
import 'package:yugomuzej/widgets/customInkWell.dart';
import 'package:yugomuzej/widgets/menu.dart';

class IDidThisPageDesktop extends StatefulWidget {
  const IDidThisPageDesktop({super.key});

  @override
  State<IDidThisPageDesktop> createState() => _IDidThisPageDesktopState();
}

class _IDidThisPageDesktopState extends State<IDidThisPageDesktop> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    final scrollControllerText = ScrollController();
    final scrollControllerImages = ScrollController();
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
                        Menu(title: "I did this"),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 420,
                                height: 311,
                                child: Scrollbar(
                                  controller: scrollControllerText,
                                  thumbVisibility: true,
                                  child: SingleChildScrollView(
                                    controller: scrollControllerText,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          loc.ididthis.author,
                                        ),
                                        Text(
                                          loc.ididthis.title,
                                          // style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          loc.ididthis.text,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                child: RotatedBox(
                                  quarterTurns: 3,
                                  child: Center(
                                    child: Text(
                                      loc.mainExibition.click,
                                      style: TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                height: 313,
                                child: Scrollbar(
                                  controller: scrollControllerImages,
                                  thumbVisibility: true,
                                  child: SingleChildScrollView(
                                    controller: scrollControllerImages,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 1; i <= 16; i++)
                                          Hero(
                                            tag: 'image$i',
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
                                                          child: AlertDialog(
                                                            content: Hero(
                                                              tag: 'image$i',
                                                              child: SizedBox(
                                                                child: Image.asset("assets/i_did_this/$i.webp"),
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
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(0, 10, 15, 0),
                                                  child: Image.asset("assets/i_did_this/$i.webp"),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          BottomCarusel(
            path: "assets/i_did_this/menu",
            numeberOfPictures: 25,
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
