import 'package:flutter/material.dart';
import 'package:flutter2_5_update/ui/anasayfa.dart';
import 'package:flutter2_5_update/ui/arama.dart';
import 'package:flutter2_5_update/ui/drawer_ui.dart';
import 'package:flutter2_5_update/ui/kisisel_font_kullanimi.dart';
import 'package:flutter2_5_update/ui/page_view.dart';
import 'package:flutter2_5_update/ui/tabsOrnek.dart';

void main() => runApp(FlutterDersleri());

class FlutterDersleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dersleri',
      theme: ThemeData(
        //fontFamily: "textStyle1",
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int secilenmenuitem = 0;
  List<Widget>? tumSayfalar;
  Anasayfa? sayfaAna;
  AramaSayfasi? sayfaAra;
  PageViewOrnek? pageViewOrnek;
  var keyAnasayfa = PageStorageKey("key_anasayfa");
  var keyArama = PageStorageKey("key_arama");
  var keyEkle = PageStorageKey("key_ekle");
  @override
  void initState() {
    super.initState();
    sayfaAna = Anasayfa(keyAnasayfa);
    sayfaAra = AramaSayfasi(keyArama);
    pageViewOrnek = PageViewOrnek(keyEkle);
    tumSayfalar = [sayfaAna!, sayfaAra!, pageViewOrnek!];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: const Text("Flutter Dersleri bölüm 2"),
      ),
      body: secilenmenuitem <= tumSayfalar!.length - 1
          ? tumSayfalar![secilenmenuitem]
          : tumSayfalar![0],
      bottomNavigationBar: bottomNavMenu(),
    );
  }

  Theme bottomNavMenu() {
    return Theme(
      data: ThemeData(),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Anasayfa",
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Ara",
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: "Ekle",
              backgroundColor: Colors.teal),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: "Profil",
              backgroundColor: Colors.blue),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: secilenmenuitem,
        onTap: (value) {
          setState(() {
            secilenmenuitem = value;
            if (value == 3) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => TabsOrnek()))
                  .then((bb) {
                secilenmenuitem = 0;
              });
            }
          });
        },
      ),
    );
  }
}
