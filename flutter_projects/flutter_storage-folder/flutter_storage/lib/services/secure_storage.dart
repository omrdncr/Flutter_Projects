import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/my_models.dart';

class SecureStorageService {
  // ignore: prefer_typing_uninitialized_variables
  late final FlutterSecureStorage preferences;
  void verileriKaydet(UserInfo userInfo) async {
    final name = userInfo.isim;
    await preferences.write(key: 'isim', value: name);
    await preferences.write(
        key: 'ogrenci', value: userInfo.ogrenciMi.toString());
    await preferences.write(
        key: 'cinsiyet', value: userInfo.ogrenciMi.toString());
    await preferences.write(
        key: 'ogrenci', value: userInfo.cinsiyet.index.toString());
    await preferences.write(
        key: 'renkler', value: jsonEncode(userInfo.renkler));
  }

  Future<UserInfo> verileriOku() async {
    preferences = const FlutterSecureStorage();

    var isim = await preferences.read(key: 'isim') ?? '';
    var ogrenciString = await preferences.read(key: 'ogrenci') ?? 'false';
    var ogrenci = ogrenciString.toLowerCase() == 'true' ? true : false;
    var cinsiyetString = await preferences.read(key: 'cinsiyet') ?? '0';
    var cinsiyet = Cinsiyet.values[int.parse(cinsiyetString)];
    var renklerString = await preferences.read(key: 'renkler') ?? '';
    var renkler = renklerString == null
        ? <String>[]
        : List<String>.from(jsonDecode(renklerString));
    return UserInfo(isim, cinsiyet, renkler, ogrenci);
  }
}
