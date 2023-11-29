// To parse this JSON data, do
//
//     final stationResponse = stationResponseFromMap(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

StationResponse stationResponseFromMap(String str) =>
    StationResponse.fromMap(json.decode(str));

String stationResponseToMap(StationResponse data) => json.encode(data.toMap());

class StationResponse {
  StationResponse({
    this.result,
    this.response,
    this.processDate,
    this.errorMessage,
    this.errorCode,
  });

  bool? result;
  List<CevapStation>? response;
  DateTime? processDate;
  String? errorMessage;
  int? errorCode;

  factory StationResponse.fromMap(Map<String, dynamic> json) => StationResponse(
        result: json["Result"] == null ? null : json["Result"],
        response: json["Response"] == null
            ? null
            : List<CevapStation>.from(
                json["Response"].map((x) => CevapStation.fromMap(x))),
        processDate: json["ProcessDate"] == null
            ? null
            : DateTime.parse(json["ProcessDate"]),
        errorMessage:
            json["ErrorMessage"] == null ? null : json["ErrorMessage"],
        errorCode: json["ErrorCode"] == null ? null : json["ErrorCode"],
      );

  Map<String, dynamic> toMap() => {
        "Result": result == null ? null : result,
        "Response": response == null
            ? null
            : List<dynamic>.from(response!.map((x) => x.toMap())),
        "ProcessDate":
            processDate == null ? null : processDate!.toIso8601String(),
        "ErrorMessage": errorMessage == null ? null : errorMessage,
        "ErrorCode": errorCode == null ? null : errorCode,
      };
}

class CevapStation {
  CevapStation({
    this.stationId,
    this.stationname,
    this.latitude,
    this.longitude,
    this.uscmacaddress,
    this.stocks,
    this.dist, //bunu içeride kullanacağız dışarıdan gelmiyor.
  });

  String? stationId;
  String? stationname;
  String? latitude;
  String? longitude;
  String? uscmacaddress;
  List<Stock>? stocks;
  int? dist; //bunu içeride kullanacağız dışarıdan gelmiyor.

  factory CevapStation.fromMap(Map<String, dynamic> json) => CevapStation(
        stationId: json["station_id"] == null ? null : json["station_id"],
        stationname: json["stationname"] == null ? null : json["stationname"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        uscmacaddress:
            json["uscmacaddress"] == null ? null : json["uscmacaddress"],
        stocks: json["stocks"] == null
            ? null
            : List<Stock>.from(json["stocks"].map((x) => Stock.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "station_id": stationId == null ? null : stationId,
        "stationname": stationname == null ? null : stationname,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "uscmacaddress": uscmacaddress == null ? null : uscmacaddress,
        "stocks": stocks == null
            ? null
            : List<dynamic>.from(stocks!.map((x) => x.toMap())),
      };
}

class Stock {
  Stock({
    this.stockId,
    this.stockname,
    this.price,
    this.pumps,
  });

  String? stockId;
  String? stockname;
  double? price;
  List<int>? pumps;

  factory Stock.fromMap(Map<String, dynamic> json) => Stock(
        stockId: json["stock_id"] == null ? null : json["stock_id"],
        stockname: json["stockname"] == null ? null : json["stockname"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        pumps: json["pumps"] == null
            ? null
            : List<int>.from(json["pumps"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "stock_id": stockId == null ? null : stockId,
        "stockname": stockname == null ? null : stockname,
        "price": price == null ? null : price,
        "pumps":
            pumps == null ? null : List<dynamic>.from(pumps!.map((x) => x)),
      };
}
