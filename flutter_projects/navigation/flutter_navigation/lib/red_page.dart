import 'dart:math';

import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  RedPage({super.key});
  int _rastgeleSayi = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() {
        debugPrint("on will pop çalıştı");

        if (_rastgeleSayi == 0) {
          _rastgeleSayi = Random().nextInt(100);
          Navigator.pop(context, _rastgeleSayi);
        }

        return Future.value(false);
      }),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Red Page"),
          backgroundColor: Colors.red,
          //automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Kırmızı Sayfa",
                style: TextStyle(fontSize: 15),
              ),
              ElevatedButton(
                onPressed: () {
                  _rastgeleSayi = Random().nextInt(100);
                  debugPrint("Üretilen Sayı: $_rastgeleSayi");
                  Navigator.of(context).pop(_rastgeleSayi);
                },
                child: Text("Go Back"),
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
                  Navigator.of(context).pushNamed("/yellowPage");
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow.shade500),
                child: Text(
                  "2--Sarı sayfaya git",
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
            ],
          ),
        ),
      ),
    );
  }
}
