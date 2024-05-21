import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class DesktopPageMobile extends StatelessWidget {
  const DesktopPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("widget.title"),
      ),
      body: Center(
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
                  double fixedHeight = 400;

                  // Determine the actual width and height to use
                  double width = fixedWidth < maxWidth ? fixedWidth : maxWidth;
                  double height = fixedHeight < maxHeight ? fixedHeight : maxHeight;

                  return ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: width,
                      maxHeight: height,
                    ),
                    child: InAppWebView(
                      initialFile: "assets/home/uvod.html",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
