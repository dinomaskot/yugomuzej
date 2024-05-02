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
                        const Menu(title: "I did this"),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 420,
                                height: 311,
                                child: Scrollbar(
                                  thumbVisibility: true,
                                  child: SingleChildScrollView(
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
                                        const SizedBox(height: 5),
                                        Text(
                                          loc.ididthis.text,
                                          style: const TextStyle(fontSize: 12),
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
                                      style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 10),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                height: 313,
                                child: Scrollbar(
                                  thumbVisibility: true,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        for (int i = 1; i <= 16; i++)
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
                                                            tag: 'image$i',
                                                            child: SizedBox(
                                                              child: Image.asset("assets/i_did_this/$i.webp"),
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
                                                padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
                                                child: Image.asset("assets/i_did_this/$i.webp"),
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
