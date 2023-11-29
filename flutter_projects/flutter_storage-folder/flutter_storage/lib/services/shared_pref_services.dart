import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_storage/models/my_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefenceService {
  late final FlutterSecureStorage preferences;
  void verileriKaydet(UserInfo userInfo) async {
    final _name = userInfo.isim;
    await preferences.write(key: 'isim', value: _name);
    await preferences.write(
        key: 'ogrenci', value: userInfo.ogrenciMi.toString());
    await preferences.write(
        key: 'cinsiyet', value: userInfo.cinsiyet.index.toString());
    await preferences.write(key: 'renkler', value: userInfo.renkler.toString());
  }

  Future<UserInfo> verileriOku() async {
    preferences = const FlutterSecureStorage();

    var _isim = await preferences.read(key: 'isim') ?? '';
    var _ogrenciString = await preferences.read(key: 'ogrenci') ?? 'false';

    var _ogrenci = _ogrenciString.toLowerCase() == 'true' ? true : false;

    var _cinsiyetString = await preferences.read(key: 'cinsiyet') ?? '0';

    var _cinsiyet = Cinsiyet.values[int.parse(_cinsiyetString)];

    var _renklerString = await preferences.read(key: 'renkler');
    var _renkler = _renklerString == null
        ? <String>[]
        : List<String>.from(jsonDecode(_renklerString));

    return UserInfo(_isim, _cinsiyet, _renkler, _ogrenci);
  }
}
