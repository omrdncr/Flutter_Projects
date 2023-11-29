import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Cinsiyet { KADIN, ERKEK, DIGER }

enum Renkler { SARI, KIRMIZI, MAVI, YESIL, MOR }

class UserInfo {
  final String isim;
  final Cinsiyet cinsiyet;
  final List<String> renkler;
  final bool ogrenciMi;

  UserInfo(this.isim, this.cinsiyet, this.renkler, this.ogrenciMi);

  Map<String, dynamic> toJson() {
    return {
      'isim': isim,
      'cinsiyet':
          describeEnum(cinsiyet), // cinsiyet ==> Cinsiyet.ERKEK ==>ERKEK
      'renkler': renkler,
      'ogrenciMi': ogrenciMi
    };
  }

  UserInfo.fromJson(Map<String, dynamic> json)
      : isim = json['isim'],
        cinsiyet = Cinsiyet.values
            .firstWhere((element) => element.toString() == json['cinsiyet']),
        renkler = json['renkler'],
        ogrenciMi = json['ogrenciMi'];
}
