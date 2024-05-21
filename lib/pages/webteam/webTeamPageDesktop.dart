import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:video_player/video_player.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/pages/home/widgets/home_menu_widget.dart';
import 'package:yugomuzej/widgets/bottomCarusel.dart';
import 'package:yugomuzej/widgets/bottomMenu.dart';
import 'package:yugomuzej/widgets/menu.dart';

class WebTeamPageDesktop extends StatefulWidget {
  const WebTeamPageDesktop({super.key});

  @override
  State<WebTeamPageDesktop> createState() => _WebTeamPageDesktopState();
}

class _WebTeamPageDesktopState extends State<WebTeamPageDesktop> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;
    final scrollController = ScrollController();
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
                        Menu(title: loc.webteam.menu),
                        // const SizedBox(height: 40),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  RichText(
                                    text: const TextSpan(text: ''),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    width: 340,
                                    height: 280,
                                    margin: const EdgeInsets.all(2.5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Scrollbar(
                                      controller: scrollController,
                                      thumbVisibility: true,
                                      child: SingleChildScrollView(
                                        controller: scrollController,
                                        child: HtmlWidget(loc.webteam.desc),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: " puzzle  ", // First word
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: loc.webteam.puzzle, // Second word (with leading space)
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 300,
                                    height: 280,
                                    margin: const EdgeInsets.all(2.5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Container(),
                                  ),
                                ],
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
            path: "assets/webteam/menu",
            numeberOfPictures: 21,
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
