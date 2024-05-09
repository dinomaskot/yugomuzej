import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:yugomuzej/_config/app_languages.dart';
import 'package:yugomuzej/_config/router.dart';
import 'package:yugomuzej/generated/locale_base.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  appLanguage.fetchLocale();
  runApp(MyApp(appLanguage: appLanguage));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;
  const MyApp({super.key, required this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(
        builder: (context, model, child) {
          return MaterialApp.router(
            theme: ThemeData(scaffoldBackgroundColor: Colors.white, fontFamily: 'Arial'),
            routerConfig: router,
            localizationsDelegates: [
              LocDelegate(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            locale: model.appLocal,
            supportedLocales: const [
              Locale('en', 'ENG'),
              Locale('sr', 'SRB'),
              Locale('fr', 'FRA'),
            ],
            scrollBehavior: MyCustomScrollBehavior(),
          );
        },
      ),
    );
  }
}

class LocDelegate extends LocalizationsDelegate<LocaleBase> {
  const LocDelegate();
  final idMap = const {'en': 'locales/EN.json', 'sr': 'locales/SR.json', 'fr': 'locales/FR.json'};

  @override
  bool isSupported(Locale locale) => ['en', 'sr', 'fr'].contains(locale.languageCode);

  @override
  Future<LocaleBase> load(Locale locale) async {
    var lang = 'en';
    if (isSupported(locale)) lang = locale.languageCode;
    final loc = LocaleBase();
    await loc.load(idMap[lang]!);
    return loc;
  }

  @override
  bool shouldReload(LocDelegate old) => false;
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
