import 'package:flutter/material.dart';

class OtherInputTypes extends StatefulWidget {
  const OtherInputTypes({super.key});

  @override
  State<OtherInputTypes> createState() => _OtherInputTypesState();
}

class _OtherInputTypesState extends State<OtherInputTypes> {
  bool checkBoxState = false;
  String sehir = "";
  bool switchState = false;
  double sliderDeger = 0;
  String secilenRenk = "Kirmizi";
  List<String> sehirler = ["Ankara", "Konya", "İzmir", "Bursa"];
  String secilenSehir = "Ankara";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_circle),
      ),
      appBar: AppBar(
        title: const Text("Diğer form elemanları"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(children: <Widget>[
          CheckboxListTile(
            value: checkBoxState,
            onChanged: (secildi) {
              setState(() {
                checkBoxState = secildi!;
              });
            },
            activeColor: Colors.red,
            title: const Text("Checkbox title"),
            subtitle: const Text("checkbox subtitle"),
            secondary: const Icon(Icons.add),
            //selected: true,
          ),
          RadioListTile<String>(
            value: "Ankara",
            groupValue: sehir,
            onChanged: (deger) {
              setState(() {
                sehir = deger!;
                debugPrint("Seçilen değer: $deger");
              });
            },
            title: const Text("Ankara"),
            subtitle: const Text("Switch subtitle"),
            secondary: const Icon(Icons.map),
          ),
          RadioListTile<String>(
            value: "Bursa",
            groupValue: sehir,
            onChanged: (deger) {
              setState(() {
                sehir = deger!;
                debugPrint("Seçilen değer: $deger");
              });
            },
            title: const Text("Bursa"),
            subtitle: const Text("Switch subtitle"),
            secondary: const Icon(Icons.map),
          ),
          RadioListTile<String>(
            value: "Konya",
            groupValue: sehir,
            onChanged: (deger) {
              setState(() {
                sehir = deger!;
                debugPrint("Seçilen değer: $deger");
              });
            },
            title: const Text("Konya"),
            subtitle: const Text("Switch subtitle"),
            secondary: const Icon(Icons.map),
          ),
          SwitchListTile(
            value: switchState,
            onChanged: (deger) {
              setState(() {
                debugPrint("Anlaşma onaylandı: $deger");
                switchState = deger;
              });
            },
            title: const Text("Switch Title"),
            subtitle: const Text("Switch subtitle"),
            secondary: const Icon(Icons.refresh_outlined),
          ),
          const Text("Volume"),
          Slider(
            value: sliderDeger,
            onChanged: (yenideger) {
              setState(() {
                sliderDeger = yenideger;
              });
            },
            min: 0,
            max: 100,
            divisions: 100,
            label: sliderDeger.toString(),
          ),
          DropdownButton<String>(
            items: [
              DropdownMenuItem<String>(
                value: "Kirmizi",
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 12,
                      height: 12,
                      color: Colors.red,
                      margin: const EdgeInsets.only(right: 10),
                    ),
                    const Text("Kırmızı"),
                  ],
                ),
              ),
              DropdownMenuItem<String>(
                value: "Yesil",
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 12,
                      height: 12,
                      color: Colors.green,
                      margin: const EdgeInsets.only(right: 10),
                    ),
                    const Text("Yeşil"),
                  ],
                ),
              ),
              DropdownMenuItem<String>(
                value: "Mavi",
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 12,
                      height: 12,
                      color: Colors.blue,
                      margin: const EdgeInsets.only(right: 10),
                    ),
                    const Text("Mavi"),
                  ],
                ),
              ),
            ],
            onChanged: (String? secilen) {
              setState(() {
                secilenRenk = secilen!;
              });
            },
            hint: const Text("Seçiniz"),
            value: secilenRenk,
          ),
          DropdownButton<String>(
            items: sehirler.map((oankisehir) {
              return DropdownMenuItem<String>(
                child: Text(oankisehir),
                value: oankisehir,
              );
            }).toList(),
            onChanged: (s) {
              setState(() {
                secilenSehir = s!;
              });
            },
            value: secilenSehir,
          ),
        ]),
      ),
    );
  }
}
