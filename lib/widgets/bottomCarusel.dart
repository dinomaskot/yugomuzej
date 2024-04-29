import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BottomCarusel extends StatelessWidget {
  final String path;
  const BottomCarusel({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                      return Image.asset("$path/$i.jpg");
                    },
                  );
                }).toList(),
              ),
            ));
      },
    );
  }
}
