import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:yugomuzej/_config/music.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/bottomMenu.dart';
import 'package:yugomuzej/widgets/customInkWell.dart';
import 'package:yugomuzej/widgets/menu.dart';

class VideoPageDesktop extends StatefulWidget {
  const VideoPageDesktop({super.key});

  @override
  State<VideoPageDesktop> createState() => _VideoPageDesktopState();
}

class _VideoPageDesktopState extends State<VideoPageDesktop> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
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
                        const Menu(title: "video"),
                        // const SizedBox(height: 40),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomInkWell(
                                onTap: () {
                                  musicProvider.stop();
                                  Navigator.of(context).push(
                                    HeroDialogRoute(
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: AlertDialog(
                                            content: const Hero(
                                              tag: 'image1',
                                              child: SizedBox(
                                                child: _PlayerVideoAndPopPage(path: 'assets/video/1.mp4'),
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
                                child: SizedBox(
                                  // width: 150,
                                  child: Image.asset("assets/video/1.jpg"),
                                ),
                              ),
                              CustomInkWell(
                                onTap: () {
                                  musicProvider.stop();

                                  Navigator.of(context).push(
                                    HeroDialogRoute(
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: AlertDialog(
                                            content: const Hero(
                                              tag: 'image2',
                                              child: SizedBox(
                                                child: _PlayerVideoAndPopPage(path: 'assets/video/2.mp4'),
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
                                child: SizedBox(
                                  // width: 150,
                                  child: Image.asset("assets/video/2.jpg"),
                                ),
                              ),
                              CustomInkWell(
                                onTap: () {
                                  musicProvider.stop();

                                  Navigator.of(context).push(
                                    HeroDialogRoute(
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: AlertDialog(
                                            backgroundColor: Colors.white,
                                            content: const Hero(
                                              tag: 'image3',
                                              child: SizedBox(
                                                child: _PlayerVideoAndPopPage(path: 'assets/video/3.mp4'),
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
                                child: SizedBox(
                                  // width: 150,
                                  child: Image.asset("assets/video/3.jpg"),
                                ),
                              ),
                              CustomInkWell(
                                onTap: () {
                                  musicProvider.stop();

                                  Navigator.of(context).push(
                                    HeroDialogRoute(
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: AlertDialog(
                                            content: const Hero(
                                              tag: 'image4',
                                              child: SizedBox(
                                                child: _PlayerVideoAndPopPage(path: 'assets/video/4.mp4'),
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
                                child: SizedBox(
                                  // width: 150,
                                  child: Image.asset("assets/video/4.jpg"),
                                ),
                              ),
                              CustomInkWell(
                                onTap: () {
                                  musicProvider.stop();

                                  Navigator.of(context).push(
                                    HeroDialogRoute(
                                      builder: (BuildContext context) {
                                        return Center(
                                          child: AlertDialog(
                                            content: const Hero(
                                              tag: 'image5',
                                              child: SizedBox(
                                                child: _PlayerVideoAndPopPage(path: 'assets/video/5.mp4'),
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
                                child: SizedBox(
                                  // width: 150,
                                  child: Image.asset("assets/video/5.jpg"),
                                ),
                              ),
                            ],
                          )),
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
            path: "assets/video/menu",
            numeberOfPictures: 19,
          ),
          const BottomMenu(),
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

class _PlayerVideoAndPopPage extends StatefulWidget {
  final String path;

  const _PlayerVideoAndPopPage({required this.path});
  @override
  _PlayerVideoAndPopPageState createState() => _PlayerVideoAndPopPageState();
}

class _PlayerVideoAndPopPageState extends State<_PlayerVideoAndPopPage> {
  late VideoPlayerController _videoPlayerController;
  bool startedPlaying = false;

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(widget.path);
    _videoPlayerController.addListener(() {
      if (startedPlaying && !_videoPlayerController.value.isPlaying) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<bool> started() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.play();
    startedPlaying = true;
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
              return AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: VideoPlayer(_videoPlayerController),
              );
            } else {
              return const SizedBox(height: 50, width: 50, child: CircularProgressIndicator(color: Colors.black));
            }
          },
        ),
      ),
    );
  }
}
