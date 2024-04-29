import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yugomuzej/_config/globals.dart';
import 'package:yugomuzej/generated/locale_base.dart';

class Menu extends StatelessWidget {
  final String title;
  final bool back;
  const Menu({super.key, required this.title, this.back = false});

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = MediaQuery.of(context).size.width * 0.8; // 80% of screen width
        double maxHeight = MediaQuery.of(context).size.height * 0.6; // 60% of screen height

        // Set fixed dimensions for InAppWebView
        double fixedWidth = 700;
        double fixedHeight = 60;
        // Determine the actual width and height to use
        double width = fixedWidth < maxWidth ? fixedWidth : maxWidth;
        double height = fixedHeight < maxHeight ? fixedHeight : maxHeight;

        return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: width,
              maxHeight: height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.fromLTRB(0, 4, 12, 4),
                  height: fixedHeight * 0.67,
                  child: Image.asset("assets/_assets/images/yugologo.webp"),
                ),
                Container(
                  height: fixedHeight * 0.33,
                  color: Globals.lightGrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Globals.darkGrey,
                            fontFamily: "ArialBlack",
                          ),
                        ),
                      ),
                      back
                          ? InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                // context.go(location);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 5, 10, 3),
                                      child: Image.asset(
                                        "assets/_assets/images/left.png",
                                      ),
                                    ),
                                    Text(
                                      loc.mainExibition.back,
                                      style: const TextStyle(
                                          // color: Globals.darkGrey,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ],
            ));
      },
    );
  }
}
