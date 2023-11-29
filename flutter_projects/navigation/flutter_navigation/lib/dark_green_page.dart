import 'dart:math';
import 'package:flutter/material.dart';

class DarkGreenPage extends StatelessWidget {
  DarkGreenPage({super.key});
  int _rastgeleSayi = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() {
        debugPrint("on will pop çalıştı");

        if (_rastgeleSayi == 0) {
          _rastgeleSayi = Random().nextInt(100);
          Navigator.pop(context, _rastgeleSayi);
        } else {
          debugPrint("sayı 0 değil");
        }

        return Future.value(false);
      }),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dark Green Page"),
          backgroundColor: Color.fromARGB(255, 22, 133, 0),
          //automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Koyu Yeşil Sayfa",
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
                    backgroundColor: Color.fromARGB(255, 0, 136, 11)),
                child: Text(
                  "Can Pop Kullanımı",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
