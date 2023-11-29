// To parse this JSON data, do
//
//     final PresetResponse = PresetResponseFromMap(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

PresetResponse presetResponseFromMap(String str) =>
    PresetResponse.fromMap(json.decode(str));

String presetResponseToMap(PresetResponse data) => json.encode(data.toMap());

class PresetResponse {
  PresetResponse({
    this.transactionId,
    this.responseCode,
    this.responseMsg,
  });

  String? transactionId;
  String? responseCode;
  String? responseMsg;

  factory PresetResponse.fromMap(Map<String, dynamic> json) => PresetResponse(
        transactionId:
            json["TransactionId"] == null ? null : json["TransactionId"],
        responseCode:
            json["ResponseCode"] == null ? null : json["ResponseCode"],
        responseMsg: json["ResponseMsg"] == null ? null : json["ResponseMsg"],
      );

  Map<String, dynamic> toMap() => {
        "TransactionId": transactionId == null ? null : transactionId,
        "ResponseCode": responseCode == null ? null : responseCode,
        "ResponseMsg": responseMsg == null ? null : responseMsg,
      };
}
