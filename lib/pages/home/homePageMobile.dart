import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:yugomuzej/_config/music.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/widgets/bottomMenu.dart';

import 'widgets/home_menu_widget.dart';

class HomePageMobile extends StatelessWidget {
  const HomePageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;

    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          _PlayerVideoAndPopPage(),
          Spacer(),

          Container(
            margin: const EdgeInsets.all(2.5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
            ),
            height: 60,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 60.0,
                viewportFraction: 0.2,
                autoPlay: true,
                autoPlayInterval: const Duration(milliseconds: 1500),
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                autoPlayCurve: Curves.linear,
              ),
              items: [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(
                      "assets/_assets/images/$i.jpg",
                      fit: BoxFit.fitHeight,
                    );
                  },
                );
              }).toList(),
            ),
          ),
          // Spacer(),
          HomeMenuMobile(),
          // const BottomMenu(),
        ],
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

    _videoPlayerController = VideoPlayerController.asset("assets/home/uvod_mobile.mp4");

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
    return Center(
      child: FutureBuilder<bool>(
        future: started(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data ?? false) {
            return AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(
                _videoPlayerController,
              ),
            );
          } else {
            return const SizedBox(height: 50, width: 50, child: CircularProgressIndicator(color: Colors.black));
          }
        },
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
  // TODO: implement barrierLabel
  String? get barrierLabel => "";
}
