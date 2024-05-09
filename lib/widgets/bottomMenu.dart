import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yugomuzej/_config/app_languages.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/main.dart';

class BottomMenu extends StatefulWidget {
  const BottomMenu({
    super.key,
  });

  @override
  State<BottomMenu> createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = MediaQuery.of(context).size.width * 0.8; // 80% of screen width
        double maxHeight = MediaQuery.of(context).size.height * 0.6; // 60% of screen height

        // Set fixed dimensions for InAppWebView
        double fixedWidth = 700;
        double fixedHeight = 30;

        // Determine the actual width and height to use
        double width = fixedWidth < maxWidth ? fixedWidth : maxWidth;
        double height = fixedHeight < maxHeight ? fixedHeight : maxHeight;

        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: width,
            maxHeight: height,
          ),
          child: Container(
            height: 30,
            margin: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 20,
                        ),
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.stop,
                            size: 20,
                          )),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      InkWell(
                        child: Text("en", style: appLanguage.lang == 'en' ? const TextStyle(fontWeight: FontWeight.w800) : null),
                        onTap: () => setState(() {
                          appLanguage.changeLanguage(const Locale("en"));
                        }),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        child: Text("fr", style: appLanguage.lang == 'fr' ? const TextStyle(fontWeight: FontWeight.w800) : null),
                        onTap: () => setState(() {
                          appLanguage.changeLanguage(const Locale("fr"));
                        }),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        child: Text("sr", style: appLanguage.lang == 'sr' ? const TextStyle(fontWeight: FontWeight.w800) : null),
                        onTap: () => setState(() {
                          appLanguage.changeLanguage(const Locale("sr"));
                        }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
