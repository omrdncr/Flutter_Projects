import 'package:flutter/material.dart';
import 'popupmenu_kullanimi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("myapp build çalıştı");
    return MaterialApp(
      title: "My Counter App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: TextTheme(
          headline1:
              TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Buton Örnekleri"),
        ),
        body: PopupmenuKullanimi(),
      ),
    );
  }
}
