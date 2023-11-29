// ignore_for_file: public_member_api_docs, sort_constructors_first
class PresetModel {
  String stationid;
  String rfno;
  String pumpno;
  int liter;
  double cardlimit;
  String txnid;
  String stockid;
  String plate;
  String customername;

  PresetModel({
    //station id gönder
    required this.stationid,
    required this.rfno,
    required this.pumpno,
    required this.liter,
    required this.cardlimit,
    required this.txnid,
    required this.stockid,
    required this.plate,
    required this.customername,
  });

  PresetModel copyWith({
    String? stationid,
    String? rfno,
    String? pumpno,
    int? liter,
    double? cardlimit,
    String? txnid,
    String? stockid,
    String? plate,
    String? customername,
  }) {
    return PresetModel(
      stationid: stationid ?? this.stationid,
      rfno: rfno ?? this.rfno,
      pumpno: pumpno ?? this.pumpno,
      liter: liter ?? this.liter,
      cardlimit: cardlimit ?? this.cardlimit,
      txnid: txnid ?? this.txnid,
      stockid: stockid ?? this.stockid,
      plate: plate ?? this.plate,
      customername: customername ?? this.customername,
    );
  }

  @override
  String toString() {
    return "------------------\nŞuan elimizdekilere bakacak olursak:\n  stationid: $stationid\n  rfno: $rfno\n  pumpno: $pumpno\n  liter: $liter\n  stockid: $stockid\n  cardlimit: $cardlimit\n  txnid: $txnid\n  plate: $plate\n  customername: $customername\n-------------------";
  }
}
