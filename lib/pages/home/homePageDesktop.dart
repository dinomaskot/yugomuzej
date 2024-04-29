import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'widgets/home_menu_widget.dart';
import 'dart:html' as html;
import 'dart:js' as js;
import 'dart:ui_web' as ui;

String viewID = "your-view-id";

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
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
            // Center(
            //   child: LayoutBuilder(
            //     builder: (context, constraints) {
            //       double maxWidth = MediaQuery.of(context).size.width * 0.8; // 80% of screen width
            //       double maxHeight = MediaQuery.of(context).size.height * 0.6; // 60% of screen height

            //       // Set fixed dimensions for InAppWebView
            //       double fixedWidth = 700;
            //       double fixedHeight = 400;

            //       // Determine the actual width and height to use
            //       double width = fixedWidth < maxWidth ? fixedWidth : maxWidth;
            //       double height = fixedHeight < maxHeight ? fixedHeight : maxHeight;

            //       ui.platformViewRegistry.registerViewFactory(
            //           viewID,
            //           (int id) => html.IFrameElement()
            //             ..width = MediaQuery.of(context).size.width.toString()
            //             ..height = MediaQuery.of(context).size.height.toString()
            //             ..src = 'assets/home/uvod.html'
            //             ..style.border = 'none');
            //       return ConstrainedBox(
            //         constraints: BoxConstraints(
            //           maxWidth: width,
            //           maxHeight: height,
            //         ),
            //         child: HtmlElementView(
            //           viewType: viewID,
            //         ),
            //         // InAppWebView(
            //         //   initialFile: "assets/home/uvod.html",
            //         // ),
            //       );
            //     },
            //   ),
            // ),
            LayoutBuilder(
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
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 54.0,
                          viewportFraction: 0.1,
                          autoPlay: true,
                          autoPlayInterval: const Duration(milliseconds: 1500),
                          autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                          autoPlayCurve: Curves.linear,
                        ),
                        items: [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(child: Image.asset("assets/_assets/images/$i.jpg"));
                            },
                          );
                        }).toList(),
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
