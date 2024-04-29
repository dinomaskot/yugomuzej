// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/menu.dart';

class SouveniresPageDesktop extends StatefulWidget {
  const SouveniresPageDesktop({super.key});

  @override
  State<SouveniresPageDesktop> createState() => _SouveniresPageDesktopState();
}

class _SouveniresPageDesktopState extends State<SouveniresPageDesktop> {
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
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Menu(title: loc.souvenires.menu),
                        Spacer(),
                        SizedBox(
                          width: 600,
                          height: 313,
                          child: Scrollbar(
                            thumbVisibility: true,
                            child: SingleChildScrollView(
                              child: SizedBox(
                                // width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s1"), style: TextStyle(fontFamily: "ArialBlack", fontSize: 12)),
                                                Text(loc.souvenires.getByKey("s1desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 1),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s2"), style: TextStyle(fontFamily: "ArialBlack", fontSize: 12)),
                                                Text(loc.souvenires.getByKey("s2desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 2),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s3"), style: TextStyle(fontFamily: "ArialBlack", fontSize: 12)),
                                                Text(loc.souvenires.getByKey("s3desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 3),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s4"), style: TextStyle(fontFamily: "ArialBlack", fontSize: 12)),
                                                Text(loc.souvenires.getByKey("s4desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 4),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s5"), style: TextStyle(fontFamily: "ArialBlack", fontSize: 12)),
                                                Text(loc.souvenires.getByKey("s5desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 5),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s6"), style: TextStyle(fontFamily: "ArialBlack", fontSize: 12)),
                                                Text(loc.souvenires.getByKey("s6desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 6),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s7"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s7desc"), style: TextStyle(fontSize: 12)),
                                                SizedBox(height: 10),
                                                Text(loc.souvenires.getByKey("s8"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s8desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 7),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s9"), style: TextStyle(fontFamily: "ArialBlack", fontSize: 12)),
                                                Text(loc.souvenires.getByKey("s9desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 8),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s10"), style: TextStyle(fontFamily: "ArialBlack", fontSize: 12)),
                                                Text(loc.souvenires.getByKey("s10desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 9),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s11"), style: TextStyle(fontFamily: "ArialBlack", fontSize: 12)),
                                                Text(loc.souvenires.getByKey("s11desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 10),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s12"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s12desc"), style: TextStyle(fontSize: 12)),
                                                SizedBox(height: 10),
                                                Text(loc.souvenires.getByKey("s13"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s13desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          // PopupImage(i: 11),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s14"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s14desc"), style: TextStyle(fontSize: 12)),
                                                SizedBox(height: 10),
                                                Text(loc.souvenires.getByKey("s15"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s15desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 12),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s16"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s16desc"), style: TextStyle(fontSize: 12)),
                                                SizedBox(height: 10),
                                                Text(loc.souvenires.getByKey("s17"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s17desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 13),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s18"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s18desc"), style: TextStyle(fontSize: 12)),
                                                SizedBox(height: 10),
                                                Text(loc.souvenires.getByKey("s19"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s19desc"), style: TextStyle(fontSize: 12)),
                                                SizedBox(height: 10),
                                                Text(loc.souvenires.getByKey("s20"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s20desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 14),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 0,
                                      indent: 0,
                                      endIndent: 0,
                                      thickness: 4,
                                      color: Globals.lightGrey,
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 300,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Text(loc.souvenires.getByKey("s21"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s21desc"), style: TextStyle(fontSize: 12)),
                                                SizedBox(height: 10),
                                                Text(loc.souvenires.getByKey("s22"),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      fontFamily: "ArialBlack",
                                                      fontSize: 12,
                                                    )),
                                                Text(loc.souvenires.getByKey("s22desc"), style: TextStyle(fontSize: 12)),
                                              ],
                                            ),
                                          ),
                                          VerticalDivider(color: Globals.lightGrey, thickness: 4),
                                          PopupImage(i: 15),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
            path: "assets/main_exibition",
          ),
        ],
      ),
    );
  }
}

class PopupImage extends StatelessWidget {
  const PopupImage({
    super.key,
    required this.i,
  });

  final int i;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'image1',
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
                        child: Image.asset("assets/souvenires/$i.webp"),
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
          width: 150,
          height: 150,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Image.asset("assets/souvenires/$i.webp"),
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
