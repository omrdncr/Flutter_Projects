// Tıklanabilen ve uzun basilabilen Card yapısı
// Açılır Dialog yapısı/tamam butonuna basıldığında onaylandı, kapat a basınca navigate.pop özelliği ile bir hamle geri gitmesi
//tekli sayılar çiftli sayılar renk farklılığı
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListViewKullanimi extends StatelessWidget {
  ListViewKullanimi({super.key});

  List<Ogrenci> tumOgrenciler = List.generate(
    500,
    (index) => Ogrenci(
        index + 1, "Öğrenci Adı ${index + 1}", "Öğrenci Soyadı ${index + 1}"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Listesi"),
      ),
      body: buildListViewSeparated(),
    );
  }

  ListView buildListViewSeparated() {
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          var oAnkiOgrenci = tumOgrenciler[index];

          return Card(
            color: index % 2 == 0
                ? Color.fromARGB(255, 163, 255, 243)
                : Color.fromARGB(255, 148, 186, 255),
            child: ListTile(
              onTap: () {
                if (index % 2 == 0) {
                  EasyLoading.instance.backgroundColor =
                      Color.fromARGB(255, 224, 255, 184);
                } else {
                  EasyLoading.instance.backgroundColor =
                      Color.fromARGB(255, 255, 179, 179);
                }
                EasyLoading.showToast("Eleman tıklandı: $index",
                    duration: Duration(seconds: 3),
                    dismissOnTap: true,
                    toastPosition: EasyLoadingToastPosition.bottom);
              },
              onLongPress: () {
                _alertDialogIslemleri(context, oAnkiOgrenci);
              },
              title: Text(oAnkiOgrenci.isim),
              subtitle: Text(oAnkiOgrenci.soyisim),
              leading: CircleAvatar(
                child: Text(oAnkiOgrenci.id.toString()),
              ),
            ),
          );
        },
        itemCount: tumOgrenciler.length,
        separatorBuilder: (context, index) {
          var yeniIndex = index + 1;
          if (yeniIndex % 4 == 0) {
            return Divider(
              thickness: 2,
              height: 1,
              color: Color.fromARGB(255, 0, 0, 0),
              indent: 40,
              endIndent: 40,
            );
          }
          return SizedBox();
        });
  }

  ListView klasikListView() {
    return ListView(
      children: tumOgrenciler
          .map(
            (Ogrenci ogr) => ListTile(
              title: Text(ogr.isim),
              subtitle: Text(ogr.soyisim),
              leading: CircleAvatar(
                child: Text(ogr.id.toString()),
              ),
            ),
          )
          .toList(),
    );
  }

  void _alertDialogIslemleri(BuildContext myContext, Ogrenci secilen) {
    showDialog(
        context: myContext,
        builder: (context) {
          return AlertDialog(
            title: Text(secilen.toString()),
            content: SingleChildScrollView(
                child: Column(children: [
              Text("ömer dinçer" * 100),
              Text("ömer dinçer2" * 100),
              Text("ömer dinçer3" * 100),
            ])),
            actions: [
              ButtonBar(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Kapat"),
                  ),
                  TextButton(
                    onPressed: () {
                      EasyLoading.showToast("Onaylandı: Ömer Dinçer",
                          duration: Duration(seconds: 3),
                          dismissOnTap: true,
                          toastPosition: EasyLoadingToastPosition.bottom);
                      Navigator.pop(context);
                    },
                    child: Text("Tamam"),
                  ),
                ],
              ),
            ],
          );
        });
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;
  Ogrenci(this.id, this.isim, this.soyisim);

  @override
  String toString() {
    return "İsim: $isim Soyisim: $soyisim id: $id";
  }
}
