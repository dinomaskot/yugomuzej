import 'package:go_router/go_router.dart';
import 'package:yugomuzej/pages/exhibitions/exibitionsPage.dart';
import 'package:yugomuzej/pages/exhibitions/exibitionsSubPage/exibitionsSubPage.dart';
import 'package:yugomuzej/pages/home/home_page.dart';
import 'package:yugomuzej/pages/i_did_this/iDidThisPage.dart';
import 'package:yugomuzej/pages/main_exibition/mainExibition.dart';
import 'package:yugomuzej/pages/shop/drawings/drawingsPage.dart';
import 'package:yugomuzej/pages/shop/shopPage.dart';
import 'package:yugomuzej/pages/shop/souvenires/souveniresPage.dart';
import 'package:yugomuzej/pages/souvenires/SouveniresPage.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/mainex',
      builder: (context, state) => const MainExibitionPage(),
    ),
    GoRoute(
      path: '/ididthis',
      builder: (context, state) => const IDidThisPage(),
    ),
    GoRoute(
      path: '/souvenires',
      builder: (context, state) => const SouveniresPage(),
    ),
    GoRoute(
      path: '/exhibition',
      builder: (context, state) => const ExibitionPage(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) => ExibitionSubPage(id: state.pathParameters['id']!),
        ),
      ],
    ),
    GoRoute(
      path: '/shop',
      builder: (context, state) => const ShopPage(),
      routes: [
        GoRoute(
          path: 'drawings',
          builder: (context, state) => const ShopDrawingsPage(),
        ),
        GoRoute(
          path: 'souvenires',
          builder: (context, state) => const ShopSouveniresPage(),
        ),
      ],
    ),
  ],
);
