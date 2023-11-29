// To parse this JSON data, do
//
//     final salesStatusResponse = salesStatusResponseFromMap(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

SalesStatusResponse salesStatusResponseFromMap(String str) =>
    SalesStatusResponse.fromMap(json.decode(str));

String salesStatusResponseToMap(SalesStatusResponse data) =>
    json.encode(data.toMap());

class SalesStatusResponse {
  SalesStatusResponse({
    this.transactionId,
    this.responseCode,
    this.responseMsg,
  });

  String? transactionId;
  String? responseCode;
  String? responseMsg;

  factory SalesStatusResponse.fromMap(Map<String, dynamic> json) =>
      SalesStatusResponse(
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
