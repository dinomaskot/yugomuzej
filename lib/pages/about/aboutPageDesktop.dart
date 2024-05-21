// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/bottomMenu.dart';
import 'package:yugomuzej/widgets/customInkWell.dart';
import 'package:yugomuzej/widgets/menu.dart';

class AboutPageDesktop extends StatefulWidget {
  const AboutPageDesktop({super.key});

  @override
  State<AboutPageDesktop> createState() => _AboutPageDesktopState();
}

class _AboutPageDesktopState extends State<AboutPageDesktop> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageController.addListener(() {
      if (pageController.page?.round() != currentIndex) {
        setState(() {
          currentIndex = pageController.page?.round() ?? 0;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

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
                double maxWidth = MediaQuery.of(context).size.width * 0.8;
                double fixedWidth = 700;
                double width = fixedWidth < maxWidth ? fixedWidth : maxWidth;
                return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: width,
                    ),
                    child: Container(margin: const EdgeInsets.all(2.5), child: const HomeMenu()));
              },
            ),
          ),
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = MediaQuery.of(context).size.width * 0.8;
                double maxHeight = MediaQuery.of(context).size.height * 0.6;

                double fixedWidth = 700;
                double fixedHeight = 400;

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
                        Menu(title: loc.about.menu),
                        // const SizedBox(height: 40),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 330,
                                height: 290,
                                child: Column(
                                  children: [
                                    Text(
                                      loc.about.about,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        currentIndex > 0
                                            ? CustomInkWell(
                                                onTap: () => pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.linear),
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 3),
                                                  child: Image.asset(
                                                    "assets/_assets/images/left.png",
                                                  ),
                                                ),
                                              )
                                            : SizedBox(width: 60),
                                        currentIndex < 2
                                            ? CustomInkWell(
                                                onTap: () => pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear),
                                                child: Padding(
                                                  padding: const EdgeInsets.fromLTRB(10, 5, 0, 3),
                                                  child: Image.asset(
                                                    "assets/_assets/images/right.png",
                                                  ),
                                                ),
                                              )
                                            : SizedBox(width: 60),
                                      ],
                                    ),
                                    SizedBox(
                                      // width: 380,
                                      height: 190,
                                      child: PageView(
                                        controller: pageController,
                                        children: [
                                          Image.asset("assets/about/01.webp", fit: BoxFit.fill),
                                          Image.asset("assets/about/02.webp", fit: BoxFit.fill),
                                          Image.asset("assets/about/03.webp", fit: BoxFit.fill),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 290,
                                width: 300,
                                child: Image.asset("assets/about/04.webp", fit: BoxFit.fill),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const BottomCarusel(
            path: "assets/about/menu",
            numeberOfPictures: 21,
          ),
          const BottomMenu(),
        ],
      ),
    );
  }
}
