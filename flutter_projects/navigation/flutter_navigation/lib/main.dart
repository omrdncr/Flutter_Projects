import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation/red_page.dart';
import 'package:flutter_navigation/blue_page.dart';
import 'package:flutter_navigation/route_generator.dart';
import 'package:flutter_navigation/yellow_page.dart';
import 'package:flutter_navigation/purple_page.dart';
import 'package:flutter_navigation/dark_green_page.dart';

void main() => runApp(MyNavigationApp());

class MyNavigationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Material App",
      //home: Anasayfa(),
/*       routes: {
        "redPage": (context) => RedPage(),
        "darkGreenPage": (context) => DarkGreenPage(),
        "/": (context) => Anasayfa(),
        "purplePage": (context) => PurplePage(),
        "yellowPage": (context) => YellowPage(),
        "bluePage": (context) => BluePage(), //Rota kısayolları
      }, 
    // Rotalardan herhangi biri bulunamaz ise Error sayfasına yönlendir. 
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text("Error"),
                ),
                body: Center(
                  child: Text("404"),
                ),
              )), */

      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}

class Anasayfa extends StatelessWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Material App Bar"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                int? _gelenSayi = await Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (redContext) => RedPage(),
                  ),
                );
                debugPrint("Ana Sayfadaki sayı: $_gelenSayi");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade300),
              child: Text(
                "Kırmızı Sayfaya Git IOS",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                /* Navigator.of(context)
                    .push<int>(
                        MaterialPageRoute(builder: (context) => RedPage())
                        )
                    .then((int? value) {
                  debugPrint("Gelen sayı $value");
                } 
                );
                */
                Navigator.of(context).pushNamed("/redPage");
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                "Kırmızı Sayfaya Git ANDROID",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade500),
              child: Text(
                "Maybe Pop Kullanımı",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (Navigator.canPop(context)) {
                  debugPrint("Evet Pop Olabilir");
                } else
                  debugPrint("Hayır olamaz");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade500),
              child: Text(
                "Can Pop Kullanımı",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/ogrenciListesi', arguments: 60);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade400),
              child: Text("Liste Oluştur"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/bluePage"); //Rota kısayollarını çağırma
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade500),
              child: Text(
                "Mavi sayfaya git",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/redPage");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade500),
              child: Text(
                "1--Kırmızı sayfaya git",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/purplePage");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple.shade500),
              child: Text(
                "Mor sayfaya git",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/yellowPage");
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.yellow.shade500),
              child: Text(
                "Sarı sayfaya git",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/darkGreenPage");
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 15, 129, 0)),
              child: Text(
                "Koyu yeşil sayfaya git",
              ),
            ),

            /*ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.purple.shade300),
                child: Text(
                  "Mor Sayfaya Git IOS",
                ),
              ),
                 ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.yellow.shade300),
                child: Text(
                  "Sarı Sayfaya Git IOS",
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 0, 95, 3)),
                child: Text(
                  "Koyu Yeşil Sayfaya Git IOS",
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue.shade300),
                child: Text(
                  "Mavi Sayfaya Git IOS",
                ),
              ) */
          ],
        ),
      ),
    );
  }
}
