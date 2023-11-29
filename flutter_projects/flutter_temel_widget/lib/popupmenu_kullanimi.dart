import 'package:flutter/material.dart';
import 'dart:convert';
import 'sehir.dart';

class PopupmenuKullanimi extends StatefulWidget {
  const PopupmenuKullanimi({super.key});

  @override
  State<PopupmenuKullanimi> createState() => _PopupmenuKullanimiState();
}

class _PopupmenuKullanimiState extends State<PopupmenuKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Local Json Dersleri"),
        ),
        body: FutureBuilder<List<Sehir>>(
            future: SehirlarJsonOku(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Sehir> sehirListesi = snapshot.data!;

                return ListView.builder(
                    itemCount: sehirListesi.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(sehirListesi[index].sehiradi),
                        subtitle: Text(sehirListesi[index].ulke.toString()),
                        leading: CircleAvatar(
                            child: Text(
                                sehirListesi[index].belediye[0].toString())),
                      );
                    }));
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Future<List<Sehir>> SehirlarJsonOku() async {
    try {
      await Future.delayed(const Duration(seconds: 5), () {
        return Future.error("5 saniye sonra hata çıktı");
      });
      String okunanString = await DefaultAssetBundle.of(context)
          .loadString("lib/assets/sehirler_api.json");
      var jsonObject = jsonDecode(okunanString);
      /* debugPrint(okunanString);
    debugPrint("*****************");
    List SehirListesi = jsonObject;
    debugPrint(SehirListesi[1]["model"][0]["fiyat "].toString()); */
      List<Sehir> tumSehirler = (jsonObject as List)
          .map((SehirMap) => Sehir.fromMap(SehirMap))
          .toList();
      debugPrint(tumSehirler.length.toString());
      return tumSehirler;
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e.toString());
    }
  }
}
