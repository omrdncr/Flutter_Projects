import 'package:flutter/material.dart';
import 'package:flutter2_5_update/model/veri.dart';

class Anasayfa extends StatefulWidget {
  Anasayfa(Key k) : super(key: k);
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  List<Veri>? tumVeriler;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tumVeriler = [
      Veri("Biz kimiz", false, "Biz kimizin içeriği buraya gelecek"),
      Veri("Neden Biz", false, "Neden Biz içeriği buraya gelecek"),
      Veri("Neden Biz olmayalım", false,
          "Neden Biz olmayalım içeriği buraya gelecek"),
      Veri("Biz neredeyiz", false, "Biz neredeyiz içeriği buraya gelecek"),
      Veri("Biz neyiz", false, "Biz neyiz içeriği buraya gelecek"),
      Veri("Biz neden buradayız", false,
          "neden buradayız içeriği buraya gelecek"),
      Veri("Biz buraya neden çıktık", false,
          "Biz buraya neden çıktık içeriği buraya gelecek"),
      Veri("Niçin çıktık", false, "Niçin çıktık içeriği buraya gelecek"),
      Veri("Bizi gördünüz", false, "Bizi gördünüz içeriği buraya gelecek"),
      Veri("Yürüdük ve çıktık", false,
          "Yürüdük ve çıktık içeriği buraya gelecek"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView?.builder(
      itemBuilder: (context, index) {
        return ExpansionTile(
          key: PageStorageKey("$index"),
          title: Text(tumVeriler![index].baslik),
          initiallyExpanded: tumVeriler![index].expanded,
          children: [
            Container(
              color:
                  index % 2 == 0 ? Colors.red.shade200 : Colors.yellow.shade300,
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(tumVeriler![index].icerik),
              ),
            ),
          ],
        );
      },
      itemCount: tumVeriler!.length,
    );
  }
}
