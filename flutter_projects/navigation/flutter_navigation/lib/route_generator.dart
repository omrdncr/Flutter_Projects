import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/blue_page.dart';
import 'package:flutter_navigation/dark_green_page.dart';
import 'package:flutter_navigation/main.dart';
import 'package:flutter_navigation/ogrenci-Detay.dart';
import 'package:flutter_navigation/ogrenci_listesi.dart';
import 'package:flutter_navigation/purple_page.dart';
import 'package:flutter_navigation/red_page.dart';
import 'package:flutter_navigation/yellow_page.dart';

class RouteGenerator {
  static Route<dynamic> _routeOlustur(
      Widget gidilecekWidget, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android)
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    else
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _routeOlustur(Anasayfa(), settings);

      case '/redPage':
        return _routeOlustur(RedPage(), settings);

      case '/bluePage':
        return _routeOlustur(BluePage(), settings);

      case '/yellowPage':
        return _routeOlustur(YellowPage(), settings);

      case '/purplePage':
        return _routeOlustur(PurplePage(), settings);

      case '/darkGreenPage':
        return _routeOlustur(DarkGreenPage(), settings);

      case '/ogrenciListesi':
        return _routeOlustur(OgrenciListesi(), settings);

      case '/ogrenciDetay':
        var parametredekiOgrenci = settings.arguments as Ogrenci;
        return _routeOlustur(
            OgrenciDetay(
              secilenOgrenci: parametredekiOgrenci,
            ),
            settings);

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: Text("Error"),
                  ),
                  body: Center(
                    child: Text("404"),
                  ),
                ));
    }
  }
}
