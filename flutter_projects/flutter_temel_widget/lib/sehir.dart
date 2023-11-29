import 'dart:convert';

List<Sehir> SehirFromMap(String str) =>
    List<Sehir>.from(json.decode(str).map((x) => Sehir.fromMap(x)));

String SehirToMap(List<Sehir> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Sehir {
  Sehir({
    required this.sehiradi,
    required this.ulke,
    required this.belediye,
    required this.bolge,
  });

  final String sehiradi;
  final String ulke;
  final String belediye;
  final List<Bolge> bolge;

  factory Sehir.fromMap(Map<String, dynamic> json) => Sehir(
        sehiradi: json["sehiradi"],
        ulke: json["ulke"],
        belediye: json["belediye"],
        bolge: List<Bolge>.from(json["bolge"].map((x) => Bolge.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "sehiradi": sehiradi,
        "ulke": ulke,
        "belediye": belediye,
        "bolge": List<dynamic>.from(bolge.map((x) => x.toMap())),
      };
}

class Bolge {
  Bolge({
    required this.bolgeadi,
    required this.bolgekodu,
    required this.bolgekonumu,
  });

  final String bolgeadi;
  final int bolgekodu;
  final String bolgekonumu;

  factory Bolge.fromMap(Map<String, dynamic> json) => Bolge(
        bolgeadi: json["bolgeadi"],
        bolgekodu: json["bolgekodu"],
        bolgekonumu: json["bolgekonumu"],
      );

  Map<String, dynamic> toMap() => {
        "bolgeadi": bolgeadi,
        "bolgekodu": bolgekodu,
        "bolgekonumu": bolgekonumu,
      };
}
