// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

UserResponse userResponseFromMap(String str) =>
    UserResponse.fromMap(json.decode(str));

String userResponseToMap(UserResponse data) => json.encode(data.toMap());

class UserResponse {
  UserResponse({
    this.result,
    this.response,
    this.errorMessage,
    this.errorCode,
  });

  bool? result;
  List<Cevap>? response;
  String? errorMessage;
  int? errorCode;

  factory UserResponse.fromMap(Map<String, dynamic> json) => UserResponse(
        result: json["Result"] == null ? null : json["Result"],
        response: json["Response"] == null
            ? null
            : List<Cevap>.from(json["Response"].map((x) => Cevap.fromMap(x))),
        errorMessage:
            json["ErrorMessage"] == null ? null : json["ErrorMessage"],
        errorCode: json["ErrorCode"] == null ? null : json["ErrorCode"],
      );

  Map<String, dynamic> toMap() => {
        "Result": result == null ? null : result,
        "Response": response == null
            ? null
            : List<dynamic>.from(response!.map((x) => x.toMap())),
        "ErrorMessage": errorMessage == null ? null : errorMessage,
        "ErrorCode": errorCode == null ? null : errorCode,
      };
}

class Cevap {
  Cevap({
    this.userid,
    this.customername,
    this.vehicles,
  });

  int? userid;
  String? customername;
  List<Vehicle>? vehicles;

  factory Cevap.fromMap(Map<String, dynamic> json) => Cevap(
        userid: json["userid"] == null ? null : json["userid"],
        customername:
            json["customername"] == null ? null : json["customername"],
        vehicles: json["vehicles"] == null
            ? null
            : List<Vehicle>.from(
                json["vehicles"].map((x) => Vehicle.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "userid": userid == null ? null : userid,
        "customername": customername == null ? null : customername,
        "vehicles": vehicles == null
            ? null
            : List<dynamic>.from(vehicles!.map((x) => x.toMap())),
      };
}

class Vehicle {
  Vehicle({
    this.plate,
    this.cards,
  });

  String? plate;
  List<RfCard>? cards;

  factory Vehicle.fromMap(Map<String, dynamic> json) => Vehicle(
        plate: json["plate"] == null ? null : json["plate"],
        cards: json["cards"] == null
            ? null
            : List<RfCard>.from(json["cards"].map((x) => RfCard.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "plate": plate == null ? null : plate,
        "cards": cards == null
            ? null
            : List<dynamic>.from(cards!.map((x) => x.toMap())),
      };
}

class RfCard {
  RfCard({
    this.rfno,
    this.remaininglimit,
  });

  String? rfno;
  String? remaininglimit;

  factory RfCard.fromMap(Map<String, dynamic> json) => RfCard(
        rfno: json["rfno"] == null ? null : json["rfno"],
        remaininglimit:
            json["remaininglimit"] == null ? null : json["remaininglimit"],
      );

  Map<String, dynamic> toMap() => {
        "rfno": rfno == null ? null : rfno,
        "remaininglimit": remaininglimit == null ? null : remaininglimit,
      };
}
