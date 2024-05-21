import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yugomuzej/pages/about/aboutPage.dart';
import 'package:yugomuzej/pages/author/authorPage.dart';
import 'package:yugomuzej/pages/contact/contactPage.dart';
import 'package:yugomuzej/pages/desktop/desktopPage.dart';
import 'package:yugomuzej/pages/desktop/pictures/picturesPage.dart';
import 'package:yugomuzej/pages/enter_page.dart';
import 'package:yugomuzej/pages/exhibitions/exibitionsPage.dart';
import 'package:yugomuzej/pages/exhibitions/exibitionsSubPage/exibitionsSubPage.dart';
import 'package:yugomuzej/pages/home/home_page.dart';
import 'package:yugomuzej/pages/i_did_this/iDidThisPage.dart';
import 'package:yugomuzej/pages/main_exibition/mainExibition.dart';
import 'package:yugomuzej/pages/shop/drawings/drawingsPage.dart';
import 'package:yugomuzej/pages/shop/shopPage.dart';
import 'package:yugomuzej/pages/shop/souvenires/souveniresPage.dart';
import 'package:yugomuzej/pages/souvenires/SouveniresPage.dart';
import 'package:yugomuzej/pages/video/videoPage.dart';
import 'package:yugomuzej/pages/webteam/webTeamPage.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      // builder: (context, state) => const EnterPage(),
      pageBuilder: (context, state) => customTransition(state, const EnterPage()),
    ),
    GoRoute(
      path: '/home',
      // builder: (context, state) => const HomePage(),
      pageBuilder: (context, state) => customTransition(state, const HomePage()),
    ),
    GoRoute(
      path: '/mainex',
      // builder: (context, state) => const MainExibitionPage(),
      pageBuilder: (context, state) => customTransition(state, const MainExibitionPage()),
    ),
    GoRoute(
      path: '/exhibition',
      // builder: (context, state) => const ExibitionPage(),
      pageBuilder: (context, state) => customTransition(state, const ExibitionPage()),

      routes: [
        GoRoute(
          path: ':id',
          // builder: (context, state) => ExibitionSubPage(id: state.pathParameters['id']!),
          pageBuilder: (context, state) => customTransition(state, ExibitionSubPage(id: state.pathParameters['id']!)),
        ),
      ],
    ),
    GoRoute(
      path: '/ididthis',
      // builder: (context, state) => const IDidThisPage(),
      pageBuilder: (context, state) => customTransition(state, const IDidThisPage()),
    ),
    // GoRoute(
    //   path: '/kids',
    //   builder: (context, state) => const KidsPage(),
    //   routes: [
    //     GoRoute(
    //       path: 'drawings',
    //       builder: (context, state) => const ShopDrawingsPage(),
    //     ),
    //     GoRoute(
    //       path: 'souvenires',
    //       builder: (context, state) => const ShopSouveniresPage(),
    //     ),
    //   ],
    // ),
    GoRoute(
      path: '/souvenires',
      // builder: (context, state) => const SouveniresPage(),
      pageBuilder: (context, state) => customTransition(state, const SouveniresPage()),
    ),
    GoRoute(
      path: '/shop',
      // builder: (context, state) => const ShopPage(),
      pageBuilder: (context, state) => customTransition(state, const ShopPage()),
      routes: [
        GoRoute(
          path: 'drawings',
          // builder: (context, state) => const ShopDrawingsPage(),
          pageBuilder: (context, state) => customTransition(state, const ShopDrawingsPage()),
        ),
        GoRoute(
          path: 'souvenires',
          // builder: (context, state) => const ShopSouveniresPage(),
          pageBuilder: (context, state) => customTransition(state, const ShopSouveniresPage()),
        ),
      ],
    ),
    GoRoute(
      path: '/author',
      // builder: (context, state) => const AuthorPage(),
      pageBuilder: (context, state) => customTransition(state, const AuthorPage()),
    ),
    GoRoute(
      path: '/video',
      // builder: (context, state) => const VideoPage(),
      pageBuilder: (context, state) => customTransition(state, const VideoPage()),
    ),
    GoRoute(
      path: '/desktop',
      // builder: (context, state) => const DesktopPage(),
      pageBuilder: (context, state) => customTransition(state, const DesktopPage()),
      routes: [
        GoRoute(
          path: 'pictures',
          // builder: (context, state) => const DesktopPicturePage(),
          pageBuilder: (context, state) => customTransition(state, const DesktopPicturePage()),
        ),
        GoRoute(
          path: 'screensaver',
          // builder: (context, state) => const ShopSouveniresPage(),
          pageBuilder: (context, state) => customTransition(state, const DesktopPicturePage()),
        ),
        GoRoute(
          path: 'icons',
          // builder: (context, state) => const ShopSouveniresPage(),
          pageBuilder: (context, state) => customTransition(state, const DesktopPicturePage()),
        ),
      ],
    ),

    GoRoute(
      path: '/webteam',
      // builder: (context, state) => const WebTeamPage(),
      pageBuilder: (context, state) => customTransition(state, const WebTeamPage()),
    ),
    GoRoute(
      path: '/about',
      // builder: (context, state) => const AboutPage(),
      // pageBuilder: (context, state) => customTransition(state, const AboutPage()),
      pageBuilder: (context, state) => customTransition(state, const AboutPage()),
    ),
    GoRoute(
      path: '/contact',
      // builder: (context, state) => const ContactPage(),
      pageBuilder: (context, state) => customTransition(state, const ContactPage()),
    ),
  ],
);

CustomTransitionPage<dynamic> customTransition(GoRouterState state, Widget widget) {
  return CustomTransitionPage(
    // key: state.pageKey,
    child: widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Change the opacity of the screen using a Curve based on the the animation's
      // value
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}
