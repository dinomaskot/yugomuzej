import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:yugomuzej/_config/music.dart';
import 'package:yugomuzej/widgets/bottomMenu.dart';

import 'widgets/home_menu_widget.dart';

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
                  double maxWidth = MediaQuery.of(context).size.width * 0.8;
                  double maxHeight = MediaQuery.of(context).size.height * 0.6;

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
                    child: const _PlayerVideoAndPopPage(),
                  );
                },
              ),
            ),
            LayoutBuilder(
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
                              return Image.asset("assets/_assets/images/$i.jpg");
                            },
                          );
                        }).toList(),
                      ),
                    ));
              },
            ),
            const BottomMenu(),
          ],
        ),
      ),
    );
  }
}

class _PlayerVideoAndPopPage extends StatefulWidget {
  const _PlayerVideoAndPopPage();
  @override
  _PlayerVideoAndPopPageState createState() => _PlayerVideoAndPopPageState();
}

class _PlayerVideoAndPopPageState extends State<_PlayerVideoAndPopPage> {
  late VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset("assets/home/uvod.mp4");

    _videoPlayerController.addListener(() {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _videoPlayerController
        ..initialize().then((_) {
          _videoPlayerController.setVolume(0);

          _videoPlayerController.play();
        });
    });
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
    musicProvider.play();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: FutureBuilder<bool>(
          future: started(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data ?? false) {
              return VideoPlayer(_videoPlayerController);
            } else {
              return const SizedBox(height: 50, width: 50, child: CircularProgressIndicator(color: Colors.black));
            }
          },
        ),
      ),
    );
  }
}
