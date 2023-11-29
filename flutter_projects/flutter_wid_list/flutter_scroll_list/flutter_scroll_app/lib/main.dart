import 'package:flutter/material.dart';
//import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:flutter_scroll_app/card_list_tile.dart';
import 'package:flutter_scroll_app/gridView_Kullanimi.dart';
//import 'package:flutter_scroll_app/listViewKul.dart';

//import 'listView_Layout_Kullanimi.dart';

void main() {
  runApp(MyApp());
  //configLoading();         listViewKul.dart
}

/* void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0                                      listViewKul.dart
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.black
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
} */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      //themeMode: ThemeMode.system,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grid View"),
        ),
        body: GridViewOrnek(),
      ),
      //ListviewLayoutProblemleri(), //ListViewKullanimi(),

      //builder: EasyLoading.init(),
    );
  }
}
