import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocaleBase {
  late Map<String, dynamic> _data;
  late String _path;
  Future<void> load(String path) async {
    _path = path;
    final strJson = await rootBundle.loadString(path);
    _data = jsonDecode(strJson);
    initAll();
  }
  
  Map<String, String> getData(String group) {
    return Map<String, String>.from(_data[group]);
  }

  String getPath() => _path;

  late Localehome _home;
  Localehome get home => _home;
  late LocalemainExibition _mainExibition;
  LocalemainExibition get mainExibition => _mainExibition;
  late Localeexibitions _exibitions;
  Localeexibitions get exibitions => _exibitions;
  late Localeididthis _ididthis;
  Localeididthis get ididthis => _ididthis;
  late Localesouvenires _souvenires;
  Localesouvenires get souvenires => _souvenires;
  late Localeshop _shop;
  Localeshop get shop => _shop;
  late Localeauthor _author;
  Localeauthor get author => _author;
  late Localedesktop _desktop;
  Localedesktop get desktop => _desktop;
  late Localecontact _contact;
  Localecontact get contact => _contact;
  late Localeabout _about;
  Localeabout get about => _about;
  late Localewebteam _webteam;
  Localewebteam get webteam => _webteam;

  void initAll() {
    _home = Localehome(Map<String, String>.from(_data['home']));
    _mainExibition = LocalemainExibition(Map<String, String>.from(_data['mainExibition']));
    _exibitions = Localeexibitions(Map<String, String>.from(_data['exibitions']));
    _ididthis = Localeididthis(Map<String, String>.from(_data['ididthis']));
    _souvenires = Localesouvenires(Map<String, String>.from(_data['souvenires']));
    _shop = Localeshop(Map<String, String>.from(_data['shop']));
    _author = Localeauthor(Map<String, String>.from(_data['author']));
    _desktop = Localedesktop(Map<String, String>.from(_data['desktop']));
    _contact = Localecontact(Map<String, String>.from(_data['contact']));
    _about = Localeabout(Map<String, String>.from(_data['about']));
    _webteam = Localewebteam(Map<String, String>.from(_data['webteam']));
  }
}

class Localehome {
  late final Map<String, String> _data;
  Localehome(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get exibitions => _data["exibitions"]!;
  String get mainExibitions => _data["mainExibitions"]!;
  String get iDidThis => _data["iDidThis"]!;
  String get placeForKids => _data["placeForKids"]!;
  String get artSouvenires => _data["artSouvenires"]!;
  String get shop => _data["shop"]!;
  String get author => _data["author"]!;
  String get video => _data["video"]!;
  String get desktop => _data["desktop"]!;
  String get webTeam => _data["webTeam"]!;
  String get contact => _data["contact"]!;
  String get about => _data["about"]!;
}

class LocalemainExibition {
  late final Map<String, String> _data;
  LocalemainExibition(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get me1a => _data["me1a"]!;
  String get me1b => _data["me1b"]!;
  String get me1c => _data["me1c"]!;
  String get me1d => _data["me1d"]!;
  String get me2a => _data["me2a"]!;
  String get me2b => _data["me2b"]!;
  String get me2c => _data["me2c"]!;
  String get me2d => _data["me2d"]!;
  String get me3a => _data["me3a"]!;
  String get me3b => _data["me3b"]!;
  String get me3c => _data["me3c"]!;
  String get me3d => _data["me3d"]!;
  String get me4a => _data["me4a"]!;
  String get me4b => _data["me4b"]!;
  String get me4c => _data["me4c"]!;
  String get me4d => _data["me4d"]!;
  String get me5a => _data["me5a"]!;
  String get me5b => _data["me5b"]!;
  String get me5c => _data["me5c"]!;
  String get me5d => _data["me5d"]!;
  String get me6a => _data["me6a"]!;
  String get me6b => _data["me6b"]!;
  String get me6c => _data["me6c"]!;
  String get me6d => _data["me6d"]!;
  String get me7a => _data["me7a"]!;
  String get me7b => _data["me7b"]!;
  String get me7c => _data["me7c"]!;
  String get me7d => _data["me7d"]!;
  String get me8a => _data["me8a"]!;
  String get me8b => _data["me8b"]!;
  String get me8c => _data["me8c"]!;
  String get me8d => _data["me8d"]!;
  String get me9a => _data["me9a"]!;
  String get me9b => _data["me9b"]!;
  String get me9c => _data["me9c"]!;
  String get me9d => _data["me9d"]!;
  String get me10a => _data["me10a"]!;
  String get me10b => _data["me10b"]!;
  String get me10c => _data["me10c"]!;
  String get me10d => _data["me10d"]!;
  String get me11a => _data["me11a"]!;
  String get me11b => _data["me11b"]!;
  String get me11c => _data["me11c"]!;
  String get me11d => _data["me11d"]!;
  String get me12a => _data["me12a"]!;
  String get me12b => _data["me12b"]!;
  String get me12c => _data["me12c"]!;
  String get me12d => _data["me12d"]!;
  String get me13a => _data["me13a"]!;
  String get me13b => _data["me13b"]!;
  String get me13c => _data["me13c"]!;
  String get me13d => _data["me13d"]!;
  String get me14a => _data["me14a"]!;
  String get me14b => _data["me14b"]!;
  String get me14c => _data["me14c"]!;
  String get me14d => _data["me14d"]!;
  String get me15a => _data["me15a"]!;
  String get me15b => _data["me15b"]!;
  String get me15c => _data["me15c"]!;
  String get me15d => _data["me15d"]!;
  String get me16a => _data["me16a"]!;
  String get me16b => _data["me16b"]!;
  String get me16c => _data["me16c"]!;
  String get me16d => _data["me16d"]!;
  String get me17a => _data["me17a"]!;
  String get me17b => _data["me17b"]!;
  String get me17c => _data["me17c"]!;
  String get me17d => _data["me17d"]!;
  String get me18a => _data["me18a"]!;
  String get me18b => _data["me18b"]!;
  String get me18c => _data["me18c"]!;
  String get me18d => _data["me18d"]!;
  String get me19a => _data["me19a"]!;
  String get me19b => _data["me19b"]!;
  String get me19c => _data["me19c"]!;
  String get me19d => _data["me19d"]!;
  String get me20a => _data["me20a"]!;
  String get me20b => _data["me20b"]!;
  String get me20c => _data["me20c"]!;
  String get me20d => _data["me20d"]!;
  String get me21a => _data["me21a"]!;
  String get me21b => _data["me21b"]!;
  String get me21c => _data["me21c"]!;
  String get me21d => _data["me21d"]!;
  String get me22a => _data["me22a"]!;
  String get me22b => _data["me22b"]!;
  String get me22c => _data["me22c"]!;
  String get me22d => _data["me22d"]!;
  String get me23a => _data["me23a"]!;
  String get me23b => _data["me23b"]!;
  String get me23c => _data["me23c"]!;
  String get me23d => _data["me23d"]!;
  String get me24a => _data["me24a"]!;
  String get me24b => _data["me24b"]!;
  String get me24c => _data["me24c"]!;
  String get me24d => _data["me24d"]!;
  String get me25a => _data["me25a"]!;
  String get me25b => _data["me25b"]!;
  String get me25c => _data["me25c"]!;
  String get me25d => _data["me25d"]!;
  String get me26a => _data["me26a"]!;
  String get me26b => _data["me26b"]!;
  String get me26c => _data["me26c"]!;
  String get me26d => _data["me26d"]!;
  String get me27a => _data["me27a"]!;
  String get me27b => _data["me27b"]!;
  String get me27c => _data["me27c"]!;
  String get me27d => _data["me27d"]!;
  String get me28a => _data["me28a"]!;
  String get me28b => _data["me28b"]!;
  String get me28c => _data["me28c"]!;
  String get me28d => _data["me28d"]!;
  String get me29a => _data["me29a"]!;
  String get me29b => _data["me29b"]!;
  String get me29c => _data["me29c"]!;
  String get me29d => _data["me29d"]!;
  String get me30a => _data["me30a"]!;
  String get me30b => _data["me30b"]!;
  String get me30c => _data["me30c"]!;
  String get me30d => _data["me30d"]!;
  String get me31a => _data["me31a"]!;
  String get me31b => _data["me31b"]!;
  String get me31c => _data["me31c"]!;
  String get me31d => _data["me31d"]!;
  String get me32a => _data["me32a"]!;
  String get me32b => _data["me32b"]!;
  String get me32c => _data["me32c"]!;
  String get me32d => _data["me32d"]!;
  String get me33a => _data["me33a"]!;
  String get me33b => _data["me33b"]!;
  String get me33c => _data["me33c"]!;
  String get me33d => _data["me33d"]!;
  String get me34a => _data["me34a"]!;
  String get me34b => _data["me34b"]!;
  String get me34c => _data["me34c"]!;
  String get me34d => _data["me34d"]!;
  String get me35a => _data["me35a"]!;
  String get me35b => _data["me35b"]!;
  String get me35c => _data["me35c"]!;
  String get me35d => _data["me35d"]!;
  String get me36a => _data["me36a"]!;
  String get me36b => _data["me36b"]!;
  String get me36c => _data["me36c"]!;
  String get me36d => _data["me36d"]!;
  String get me37a => _data["me37a"]!;
  String get me37b => _data["me37b"]!;
  String get me37c => _data["me37c"]!;
  String get me37d => _data["me37d"]!;
  String get me38a => _data["me38a"]!;
  String get me38b => _data["me38b"]!;
  String get me38c => _data["me38c"]!;
  String get me38d => _data["me38d"]!;
  String get me39a => _data["me39a"]!;
  String get me39b => _data["me39b"]!;
  String get me39c => _data["me39c"]!;
  String get me39d => _data["me39d"]!;
  String get me40a => _data["me40a"]!;
  String get me40b => _data["me40b"]!;
  String get me40c => _data["me40c"]!;
  String get me40d => _data["me40d"]!;
  String get me41a => _data["me41a"]!;
  String get me41b => _data["me41b"]!;
  String get me41c => _data["me41c"]!;
  String get me41d => _data["me41d"]!;
  String get me42a => _data["me42a"]!;
  String get me42b => _data["me42b"]!;
  String get me42c => _data["me42c"]!;
  String get me42d => _data["me42d"]!;
  String get me43a => _data["me43a"]!;
  String get me43b => _data["me43b"]!;
  String get me43c => _data["me43c"]!;
  String get me43d => _data["me43d"]!;
  String get me44a => _data["me44a"]!;
  String get me44b => _data["me44b"]!;
  String get me44c => _data["me44c"]!;
  String get me44d => _data["me44d"]!;
  String get me45a => _data["me45a"]!;
  String get me45b => _data["me45b"]!;
  String get me45c => _data["me45c"]!;
  String get me45d => _data["me45d"]!;
  String get me46a => _data["me46a"]!;
  String get me46b => _data["me46b"]!;
  String get me46c => _data["me46c"]!;
  String get me46d => _data["me46d"]!;
  String get me47a => _data["me47a"]!;
  String get me47b => _data["me47b"]!;
  String get me47c => _data["me47c"]!;
  String get me47d => _data["me47d"]!;
  String get me48a => _data["me48a"]!;
  String get me48b => _data["me48b"]!;
  String get me48c => _data["me48c"]!;
  String get me48d => _data["me48d"]!;
  String get me49a => _data["me49a"]!;
  String get me49b => _data["me49b"]!;
  String get me49c => _data["me49c"]!;
  String get me49d => _data["me49d"]!;
  String get me50a => _data["me50a"]!;
  String get me50b => _data["me50b"]!;
  String get me50c => _data["me50c"]!;
  String get me50d => _data["me50d"]!;
  String get me51a => _data["me51a"]!;
  String get me51b => _data["me51b"]!;
  String get me51c => _data["me51c"]!;
  String get me51d => _data["me51d"]!;
  String get me52a => _data["me52a"]!;
  String get me52b => _data["me52b"]!;
  String get me52c => _data["me52c"]!;
  String get me52d => _data["me52d"]!;
  String get menu => _data["menu"]!;
  String get click => _data["click"]!;
  String get back => _data["back"]!;
}

class Localeexibitions {
  late final Map<String, String> _data;
  Localeexibitions(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get menu => _data["menu"]!;
  String get belgrade => _data["belgrade"]!;
  String get saopaolo => _data["saopaolo"]!;
  String get wien => _data["wien"]!;
  String get ex01 => _data["ex01"]!;
  String get ex02 => _data["ex02"]!;
  String get ex03 => _data["ex03"]!;
}

class Localeididthis {
  late final Map<String, String> _data;
  Localeididthis(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get text => _data["text"]!;
  String get author => _data["author"]!;
  String get title => _data["title"]!;
}

class Localesouvenires {
  late final Map<String, String> _data;
  Localesouvenires(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get menu => _data["menu"]!;
  String get s1 => _data["s1"]!;
  String get s1desc => _data["s1desc"]!;
  String get s2 => _data["s2"]!;
  String get s2desc => _data["s2desc"]!;
  String get s3 => _data["s3"]!;
  String get s3desc => _data["s3desc"]!;
  String get s4 => _data["s4"]!;
  String get s4desc => _data["s4desc"]!;
  String get s5 => _data["s5"]!;
  String get s5desc => _data["s5desc"]!;
  String get s6 => _data["s6"]!;
  String get s6desc => _data["s6desc"]!;
  String get s7 => _data["s7"]!;
  String get s7desc => _data["s7desc"]!;
  String get s8 => _data["s8"]!;
  String get s8desc => _data["s8desc"]!;
  String get s9 => _data["s9"]!;
  String get s9desc => _data["s9desc"]!;
  String get s10 => _data["s10"]!;
  String get s10desc => _data["s10desc"]!;
  String get s11 => _data["s11"]!;
  String get s11desc => _data["s11desc"]!;
  String get s12 => _data["s12"]!;
  String get s12desc => _data["s12desc"]!;
  String get s13 => _data["s13"]!;
  String get s13desc => _data["s13desc"]!;
  String get s14 => _data["s14"]!;
  String get s14desc => _data["s14desc"]!;
  String get s15 => _data["s15"]!;
  String get s15desc => _data["s15desc"]!;
  String get s16 => _data["s16"]!;
  String get s16desc => _data["s16desc"]!;
  String get s17 => _data["s17"]!;
  String get s17desc => _data["s17desc"]!;
  String get s18 => _data["s18"]!;
  String get s18desc => _data["s18desc"]!;
  String get s19 => _data["s19"]!;
  String get s19desc => _data["s19desc"]!;
  String get s20 => _data["s20"]!;
  String get s20desc => _data["s20desc"]!;
  String get s21 => _data["s21"]!;
  String get s21desc => _data["s21desc"]!;
  String get s22 => _data["s22"]!;
  String get s22desc => _data["s22desc"]!;
}

class Localeshop {
  late final Map<String, String> _data;
  Localeshop(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get menu => _data["menu"]!;
  String get souvenires => _data["souvenires"]!;
  String get drawings => _data["drawings"]!;
  String get s1 => _data["s1"]!;
  String get s2 => _data["s2"]!;
  String get s3 => _data["s3"]!;
  String get s4 => _data["s4"]!;
  String get s5 => _data["s5"]!;
  String get s6 => _data["s6"]!;
  String get kbclink => _data["kbclink"]!;
}

class Localeauthor {
  late final Map<String, String> _data;
  Localeauthor(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get menu => _data["menu"]!;
  String get exhibitions => _data["exhibitions"]!;
  String get books => _data["books"]!;
  String get workshops => _data["workshops"]!;
  String get awards => _data["awards"]!;
  String get museums => _data["museums"]!;
  String get interview => _data["interview"]!;
  String get aboutDesc => _data["aboutDesc"]!;
  String get name => _data["name"]!;
  String get email => _data["email"]!;
  String get exhibitionsDesc => _data["exhibitionsDesc"]!;
  String get booksDesc => _data["booksDesc"]!;
  String get workshopsDesc => _data["workshopsDesc"]!;
  String get awardsDesc => _data["awardsDesc"]!;
  String get museumsDesc => _data["museumsDesc"]!;
  String get interviewDesc => _data["interviewDesc"]!;
}

class Localedesktop {
  late final Map<String, String> _data;
  Localedesktop(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get pictures => _data["pictures"]!;
  String get screensaver => _data["screensaver"]!;
  String get icons => _data["icons"]!;
  String get menu => _data["menu"]!;
}

class Localecontact {
  late final Map<String, String> _data;
  Localecontact(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get menu => _data["menu"]!;
}

class Localeabout {
  late final Map<String, String> _data;
  Localeabout(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get menu => _data["menu"]!;
  String get about => _data["about"]!;
}

class Localewebteam {
  late final Map<String, String> _data;
  Localewebteam(this._data);

  String getByKey(String key) {
    return _data[key]!;
  }

  String get desc => _data["desc"]!;
  String get menu => _data["menu"]!;
  String get puzzle => _data["puzzle"]!;
}

