import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yugomuzej/generated/locale_base.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MenuItem(title: loc.home.mainExibitions, path: '/mainex'),
            MenuItem(title: loc.home.exibitions, path: '/exhibition'),
            MenuItem(title: loc.home.iDidThis, path: '/ididthis'),
            MenuItem(title: loc.home.placeForKids, path: '/placeforkids'),
            MenuItem(title: loc.home.artSouvenires, path: '/artsouvenires'),
            MenuItem(title: loc.home.shop, path: '/shop'),
          ],
        ),
        const SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MenuItem(title: loc.home.author, path: '/author'),
            MenuItem(title: loc.home.video, path: '/video'),
            MenuItem(title: loc.home.desktop, path: '/desktop'),
            MenuItem(title: loc.home.webTeam, path: '/webteam'),
            MenuItem(title: loc.home.about, path: '/about'),
            MenuItem(title: loc.home.contact, path: '/androidcontact'),
          ],
        ),
        const SizedBox(height: 3),
      ],
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.title,
    required this.path,
  });

  final String title;
  final String path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: (700 - 5 - 5 * 3) / 6,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
        ),

        // alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      onTap: () => context.go("$path"),
    );
  }
}
