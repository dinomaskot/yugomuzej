import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yugomuzej/generated/locale_base.dart';
import 'package:yugomuzej/widgets/bottomMenu.dart';
import 'package:yugomuzej/widgets/customInkWell.dart';

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
            MenuItem(title: loc.home.placeForKids, path: '/kids'),
            MenuItem(title: loc.home.artSouvenires, path: '/souvenires'),
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
            MenuItem(title: loc.home.contact, path: '/contact'),
          ],
        ),
        const SizedBox(height: 3),
      ],
    );
  }
}

class HomeMenuMobile extends StatelessWidget {
  const HomeMenuMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;

    return IconButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog.fullscreen(
          backgroundColor: Colors.white,
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
              const Spacer(),
              Image.asset("assets/_assets/images/yugologo.webp"),
              const Spacer(),
              const Spacer(),
              MenuItemMobile(title: loc.home.mainExibitions, path: '/mainex'),
              MenuItemMobile(title: loc.home.exibitions, path: '/exhibition'),
              MenuItemMobile(title: loc.home.iDidThis, path: '/ididthis'),
              MenuItemMobile(title: loc.home.placeForKids, path: '/kids'),
              MenuItemMobile(title: loc.home.artSouvenires, path: '/souvenires'),
              MenuItemMobile(title: loc.home.shop, path: '/shop'),
              MenuItemMobile(title: loc.home.author, path: '/author'),
              MenuItemMobile(title: loc.home.video, path: '/video'),
              MenuItemMobile(title: loc.home.desktop, path: '/desktop'),
              MenuItemMobile(title: loc.home.webTeam, path: '/webteam'),
              MenuItemMobile(title: loc.home.about, path: '/about'),
              MenuItemMobile(title: loc.home.contact, path: '/contact'),
              const Spacer(),
              const BottomMenu(),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
      icon: const Icon(
        Icons.menu,
        size: 40,
      ),
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
    return CustomInkWell(
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
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
        ),
      ),
      onTap: () => context.go(path),
    );
  }
}

class MenuItemMobile extends StatelessWidget {
  const MenuItemMobile({
    super.key,
    required this.title,
    required this.path,
  });

  final String title;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: CustomInkWell(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
          ),

          // alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        onTap: () {
          Navigator.pop(context);

          context.go(path);
        },
      ),
    );
  }
}
