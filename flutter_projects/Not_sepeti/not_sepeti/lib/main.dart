import 'package:flutter/material.dart';
import 'package:not_sepeti/utils/database_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var databaseHelper = DatabseHelper();
    databaseHelper.kategorileriGetir();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        home: const Scaffold(
          drawer: Drawer(),
          backgroundColor: Colors.purple,
        ));
  }
}
