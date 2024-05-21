// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/bottomMenu.dart';
import 'package:yugomuzej/widgets/customInkWell.dart';
import 'package:yugomuzej/widgets/menu.dart';

class AuthorPageDesktop extends StatefulWidget {
  const AuthorPageDesktop({super.key});

  @override
  State<AuthorPageDesktop> createState() => _AuthorPageDesktopState();
}

class _AuthorPageDesktopState extends State<AuthorPageDesktop> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;
    String title = '';
    String page = '';
    if (currentIndex == 1) {
      page = 'exhibitions';
    } else if (currentIndex == 2) {
      page = 'books';
    } else if (currentIndex == 3) {
      page = 'workshops';
    } else if (currentIndex == 4) {
      page = 'awards';
    } else if (currentIndex == 5) {
      page = 'museums';
    } else if (currentIndex == 6) {
      page = 'interview';
    }
    if (currentIndex == 0) {
      title = loc.author.menu;
      page = 'about';
    } else {
      title = '${loc.author.menu} [${loc.author.getByKey(page)}]';
    }
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
                final scrollController = ScrollController();
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
                        Menu(title: title),
                        const Spacer(),
                        Container(
                          // width: 700,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                // width: 420,
                                // height: 270,
                                child: SizedBox(
                                  height: 270,
                                  child: Scrollbar(
                                    controller: scrollController,
                                    thumbVisibility: true,
                                    child: SingleChildScrollView(
                                      controller: scrollController,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          currentIndex == 0 ? Text(loc.author.name, style: TextStyle(fontWeight: FontWeight.bold)) : SizedBox(),
                                          SizedBox(height: 10),
                                          currentIndex < 6
                                              ? Text(
                                                  loc.author.getByKey('${page}Desc'),
                                                  style: TextStyle(fontSize: 12),
                                                )
                                              : HtmlWidget(loc.author.getByKey('${page}Desc')),
                                          currentIndex == 0
                                              ? Row(
                                                  children: [
                                                    Text("E-mail: ", style: const TextStyle(fontSize: 12)),
                                                    CustomInkWell(
                                                      onTap: () => launchUrlString("mailto:${loc.author.email}"),
                                                      child: Text(
                                                        loc.author.email,
                                                        style: const TextStyle(fontSize: 12),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox(),
                                          // Text(
                                          //   loc.ididthis.title,
                                          //   // style: TextStyle(fontSize: 16),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              currentIndex < 6
                                  ? Expanded(
                                      flex: 2,
                                      // height: 290,
                                      // width: 270,
                                      child: Image.asset(
                                        height: 270,
                                        alignment: Alignment.centerRight,
                                        "assets/author/$currentIndex.webp",
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Divider(
                          height: 0,
                          indent: 0,
                          endIndent: 0,
                          thickness: 1.5,
                          color: Colors.black,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomInkWell(
                                  child: Text(loc.author.exhibitions, style: const TextStyle(fontSize: 11)), onTap: () => setState(() => currentIndex = 1)),
                              CustomInkWell(child: Text(loc.author.books, style: const TextStyle(fontSize: 11)), onTap: () => setState(() => currentIndex = 2)),
                              CustomInkWell(
                                  child: Text(loc.author.workshops, style: const TextStyle(fontSize: 11)), onTap: () => setState(() => currentIndex = 3)),
                              CustomInkWell(
                                  child: Text(loc.author.awards, style: const TextStyle(fontSize: 11)), onTap: () => setState(() => currentIndex = 4)),
                              CustomInkWell(
                                  child: Text(loc.author.museums, style: const TextStyle(fontSize: 11)), onTap: () => setState(() => currentIndex = 5)),
                              CustomInkWell(
                                  child: Text(loc.author.interview, style: const TextStyle(fontSize: 11)), onTap: () => setState(() => currentIndex = 6)),
                            ],
                          ),
                        ),

                        // const Spacer(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const BottomCarusel(
            path: "assets/author/menu", //10-22
            numeberOfPictures: 22,
          ),
          const BottomMenu(),
        ],
      ),
    );
  }
}
