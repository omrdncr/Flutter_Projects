// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'package:flutter/material.dart';

import 'package:jossapp/model/user_response.dart';

class ProcessModel {
  int timerCounter;
  double saleStateStatus;
  List<Cevap>? userInfo;
  // Color animCol;
  // double animHeight;
  // double animWidth;
  // AlignmentGeometry animAlign;
  // Widget animWidget;

  ProcessModel({
    required this.timerCounter,
    required this.saleStateStatus,
    this.userInfo,

    // required this.animWidget,
    // required this.animAlign,
    // required this.animCol,
    // required this.animHeight,
    // required this.animWidth
  });

  ProcessModel copyWith({
    int? timerCounter,
    double? saleStateStatus,
    List<Cevap>? userInfo,
    // Widget? animWidget,
    // Color? animCol,
    // double? animHeight,
    // double? animWidth,
    // AlignmentGeometry? animAlign,
  }) {
    return ProcessModel(
      timerCounter: timerCounter ?? this.timerCounter,
      saleStateStatus: saleStateStatus ?? this.saleStateStatus,
      userInfo: userInfo ?? this.userInfo,
      // animWidget: animWidget ?? this.animWidget,
      // animCol: animCol ?? this.animCol,
      // animHeight: animHeight ?? this.animHeight,
      // animWidth: animWidth ?? this.animWidth,
      // animAlign: animAlign ?? this.animAlign,
    );
  }
}
