import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jossapp/view/home_page.dart';
import 'package:jossapp/view/login_page.dart';
import 'package:jossapp/view/pumps_detail.dart';
import 'package:jossapp/view/rf_card_page.dart';
import 'package:jossapp/view/sale_status.dart';
import 'package:jossapp/view/vechiles.dart';

class RouteGenerator {
  static Route<dynamic>? _routeWay(
    Widget targetWidget,
    RouteSettings settings,
  ) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => targetWidget,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => targetWidget,
      );
    }
    return null;
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/homepage':
        return _routeWay(
          const MyHomePage(),
          settings,
        );
      case '/login':
        return _routeWay(
          LoginPage(),
          settings,
        );
      case '/vechiles':
        return _routeWay(
          Vechiles(),
          settings,
        );
      case '/rfcard':
        return _routeWay(
          const RfCardView(),
          settings,
        );
      case '/pumpsdetail':
        return _routeWay(
          PumpsDetail(),
          settings,
        );
      case '/salestatus':
        return _routeWay(
          const SaleStatus(),
          settings,
        );
    }
    return null;
  }
}
