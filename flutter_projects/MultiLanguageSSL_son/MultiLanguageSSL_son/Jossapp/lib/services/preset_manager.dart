import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jossapp/model/preset_model.dart';

class PresetManager extends StateNotifier<PresetModel> {
  PresetManager()
      : super(PresetModel(
            stationid: '',
            rfno: '',
            pumpno: '',
            liter: 0,
            cardlimit: 0,
            txnid: '',
            stockid: '',
            plate: '',
            customername: ''));

  void aracDoldur(
      {String? customrfno,
      String? customplate,
      String? customcustomername,
      double? customcardlimit}) {
    state = PresetModel(
        stationid: state.stationid,
        rfno: customrfno != null
            ? state.rfno = customrfno
            : state.rfno = state.rfno,
        pumpno: state.pumpno,
        liter: state.liter,
        cardlimit: customcardlimit != null
            ? state.cardlimit = customcardlimit
            : state.cardlimit = state.cardlimit,
        txnid: state.txnid,
        stockid: state.stockid,
        plate: customplate != null
            ? state.plate = customplate
            : state.plate = state.plate,
        customername: customcustomername != null
            ? state.customername = customcustomername
            : state.customername = state.customername);
  }

  void pumpNoDoldur({String? custompumpno, String? customstockid}) {
    state = PresetModel(
        stationid: state.stationid,
        rfno: state.rfno,
        pumpno: custompumpno != null
            ? state.pumpno = custompumpno
            : state.pumpno = state.pumpno,
        liter: state.liter,
        cardlimit: state.cardlimit,
        txnid: state.txnid,
        stockid: customstockid != null
            ? state.stockid = customstockid
            : state.stockid = state.stockid,
        plate: state.plate,
        customername: state.customername);
  }

  void requestIdDoldur({String? customtxnid}) {
    state = PresetModel(
        stationid: state.stationid,
        rfno: state.rfno,
        pumpno: state.pumpno,
        liter: state.liter,
        cardlimit: state.cardlimit,
        txnid: customtxnid != null
            ? state.txnid = customtxnid
            : state.txnid = state.txnid,
        stockid: state.stockid,
        plate: state.plate,
        customername: state.customername);
  }

//düzgün şekilde preset hazırlanırsa true, herhangi bir limit girilmez ise false döner.
  bool presetHazirla({int? customliter, String? customstationid}) {
    if (customliter != 0) {
      // var zaman = DateTime.now();
      // String cuxtomtxnid =
      //     "mbl${zaman.year}${zaman.month < 10 ? ('0${zaman.month}') : zaman.month}${zaman.day < 10 ? ('0${zaman.day}') : zaman.day}${zaman.hour}${zaman.minute}${zaman.second}${zaman.millisecond}${zaman.microsecond}";
      // debugPrint(cuxtomtxnid);
      // debugPrint(zaman.toString());
      state = PresetModel(
          stationid: customstationid != null
              ? state.stationid = customstationid
              : state.stationid = state.stationid,
          rfno: state.rfno,
          pumpno: state.pumpno,
          liter: customliter != null
              ? state.liter = customliter
              : state.liter = state.liter,
          cardlimit: state.cardlimit,
          txnid: state.txnid,
          stockid: state.stockid,
          plate: state.plate,
          customername: state.customername);
      debugPrint(
          "Preset şu şekilde hazırlandı :\n stationid: ${state.stationid}\n rfno: ${state.rfno} \n pumpno: ${state.pumpno} \n stockid: ${state.stockid}\n liter: ${state.liter}\n txnid: ${state.txnid}\n plate: ${state.plate}\n customername: ${state.customername}");
      return true;
    } else {
      return false;
    }
  }

  bool presetTemizle() {
    state = PresetModel(
        stationid: "",
        rfno: "",
        pumpno: "",
        liter: 0,
        cardlimit: 0,
        txnid: "",
        stockid: "",
        plate: "",
        customername: state.customername);
    return true;
  }
}
