// To parse this JSON data, do
//
//     final checkRfidResponse = checkRfidResponseFromMap(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

CheckRfidResponse checkRfidResponseFromMap(String str) =>
    CheckRfidResponse.fromMap(json.decode(str));

String checkRfidResponseToMap(CheckRfidResponse data) =>
    json.encode(data.toMap());

class CheckRfidResponse {
  CheckRfidResponse({
    this.result,
    this.errorMessage,
    this.errorCode,
    this.cardType,
    this.authorizationType,
    this.requestId,
    this.cardName,
    this.plate,
    this.rfid,
    this.cusId,
    this.kmUnitId,
    this.scoreTotal,
    this.password,
    this.promoGroupNo,
    this.ttsPause,
    this.printScore,
    this.remMoney,
    this.remTotal,
    this.scorePreset,
    this.scorePresetType,
    this.defaultUnitPrice,
    this.unitPrice,
    this.rfReaderNote,
    this.paidType,
    this.onlineQueryId,
    this.kmStatus,
  });

  @override
  String toString() {
    // TODO: implement toString
    return "rfid : $rfid , plate : $plate";
  }

  bool? result;
  String? errorMessage;
  String? errorCode;
  int? cardType;
  int? authorizationType;
  String? requestId;
  String? cardName;
  String? plate;
  String? rfid;
  String? cusId;
  String? kmUnitId;
  double? scoreTotal;
  String? password;
  int? promoGroupNo;
  int? ttsPause;
  int? printScore;
  double? remMoney;
  String? remTotal;
  double? scorePreset;
  int? scorePresetType;
  double? defaultUnitPrice;
  double? unitPrice;
  String? rfReaderNote;
  int? paidType;
  String? onlineQueryId;
  int? kmStatus;

  factory CheckRfidResponse.fromMap(Map<String, dynamic> json) =>
      CheckRfidResponse(
        result: json["Result"] == null ? null : json["Result"],
        errorMessage:
            json["ErrorMessage"] == null ? null : json["ErrorMessage"],
        errorCode: json["ErrorCode"] == null ? null : json["ErrorCode"],
        cardType: json["CardType"] == null ? null : json["CardType"],
        authorizationType: json["AuthorizationType"] == null
            ? null
            : json["AuthorizationType"],
        requestId: json["RequestID"] == null ? null : json["RequestID"],
        cardName: json["CardName"] == null ? null : json["CardName"],
        plate: json["Plate"] == null ? null : json["Plate"],
        rfid: json["RFID"] == null ? null : json["RFID"],
        cusId: json["CusID"] == null ? null : json["CusID"],
        kmUnitId: json["KmUnitId"] == null ? null : json["KmUnitId"],
        scoreTotal: json["ScoreTotal"] == null ? null : json["ScoreTotal"],
        password: json["Password"] == null ? null : json["Password"],
        promoGroupNo:
            json["PromoGroupNo"] == null ? null : json["PromoGroupNo"],
        ttsPause: json["TTSPause"] == null ? null : json["TTSPause"],
        printScore: json["PrintScore"] == null ? null : json["PrintScore"],
        remMoney: json["RemMoney"] == null ? null : json["RemMoney"],
        remTotal: json["RemTotal"] == null ? null : json["RemTotal"],
        scorePreset: json["ScorePreset"] == null ? null : json["ScorePreset"],
        scorePresetType:
            json["ScorePresetType"] == null ? null : json["ScorePresetType"],
        defaultUnitPrice:
            json["DefaultUnitPrice"] == null ? null : json["DefaultUnitPrice"],
        unitPrice: json["UnitPrice"] == null ? null : json["UnitPrice"],
        rfReaderNote:
            json["RfReaderNote"] == null ? null : json["RfReaderNote"],
        paidType: json["PaidType"] == null ? null : json["PaidType"],
        onlineQueryId:
            json["OnlineQueryID"] == null ? null : json["OnlineQueryID"],
        kmStatus: json["KMStatus"] == null ? null : json["KMStatus"],
      );

  Map<String, dynamic> toMap() => {
        "Result": result == null ? null : result,
        "ErrorMessage": errorMessage == null ? null : errorMessage,
        "ErrorCode": errorCode == null ? null : errorCode,
        "CardType": cardType == null ? null : cardType,
        "AuthorizationType":
            authorizationType == null ? null : authorizationType,
        "RequestID": requestId == null ? null : requestId,
        "CardName": cardName == null ? null : cardName,
        "Plate": plate == null ? null : plate,
        "RFID": rfid == null ? null : rfid,
        "CusID": cusId == null ? null : cusId,
        "KmUnitId": kmUnitId == null ? null : kmUnitId,
        "ScoreTotal": scoreTotal == null ? null : scoreTotal,
        "Password": password == null ? null : password,
        "PromoGroupNo": promoGroupNo == null ? null : promoGroupNo,
        "TTSPause": ttsPause == null ? null : ttsPause,
        "PrintScore": printScore == null ? null : printScore,
        "RemMoney": remMoney == null ? null : remMoney,
        "RemTotal": remTotal == null ? null : remTotal,
        "ScorePreset": scorePreset == null ? null : scorePreset,
        "ScorePresetType": scorePresetType == null ? null : scorePresetType,
        "DefaultUnitPrice": defaultUnitPrice == null ? null : defaultUnitPrice,
        "UnitPrice": unitPrice == null ? null : unitPrice,
        "RfReaderNote": rfReaderNote == null ? null : rfReaderNote,
        "PaidType": paidType == null ? null : paidType,
        "OnlineQueryID": onlineQueryId == null ? null : onlineQueryId,
        "KMStatus": kmStatus == null ? null : kmStatus,
      };
}
