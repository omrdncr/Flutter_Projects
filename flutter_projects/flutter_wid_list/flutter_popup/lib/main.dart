import 'package:flutter/material.dart';
import 'package:flutter_popup/popupkullanimi.dart';

void main() {
  debugPrint('main metodu çalıştı');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('myapp build çalıştı');
    return MaterialApp(
      title: 'My Counter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
        textTheme: TextTheme(
          headline1:
              TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buton Örnekleri'),
          actions: [PopupmenuKullanimi()],
        ),
        body: PopupmenuKullanimi(),
      ),
    );
  }
}
