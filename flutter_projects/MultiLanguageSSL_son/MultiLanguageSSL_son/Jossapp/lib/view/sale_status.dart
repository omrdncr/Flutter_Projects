// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jossapp/constants/api_constants.dart';
import 'package:jossapp/model/sales_status_model.dart';
import 'package:jossapp/services/all_providers.dart';
import 'package:rive/rive.dart';

class SaleStatus extends ConsumerStatefulWidget {
  const SaleStatus({super.key});

  @override
  SaleStatusState createState() => SaleStatusState();
}

class SaleStatusState extends ConsumerState<SaleStatus> {
  SMIInput<double>? _sceneNumber;
  Artboard? _saleStatusArtboard;
  Timer? myTimer;
  SalesStatusResponse? resp;

  double? _lastStateStatus;
  int counter = 0;
  int cancelCounter = 0; //Connection error olduğunda kullanılacak sayac

  @override
  void initState() {
    super.initState();
    rootBundle.load("lib/assets/anim/salestatus.riv").then((value) {
      final file = RiveFile.import(value);
      final myArtboard = file.mainArtboard;
      var myController =
          StateMachineController.fromArtboard(myArtboard, "PumpStateMachine");
      if (myController != null) {
        myArtboard.addController(myController);
        _sceneNumber = myController.findInput("SceeneNumber");
      }
      setState(() {
        _saleStatusArtboard = myArtboard;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var userInfo = ref.watch(processStateNotifierProvider).userInfo;
    late final String requestId =
        ModalRoute.of(context)!.settings.arguments as String;

    //bu kısım sadece başlangıçta 1 kere çalışacak
    if (resp == null) {
      // ignore: prefer_conditional_assignment
      if (myTimer == null) {
        myTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
          debugPrint("çalışıyor");
          if (ref.watch(processStateNotifierProvider).saleStateStatus == 0.0 ||
              ref.watch(processStateNotifierProvider).saleStateStatus == 1.0) {
            postSalesStatusApi(requestId); //2.0 //3 +6  -- 5 sn anim
          } else {
            if (_sceneNumber!.controller.isActive == false) {
              //tekrardan çalıştırma işlemi için preset temizle
              ref.read(presetStateNotifierProvider.notifier).presetTemizle();
              //tekrardan preset status sahneleri için animasyonu 0.0 a al
              ref
                  .read(processStateNotifierProvider.notifier)
                  .changeSaleStatus(0.0);
              resp = null;
              myTimer = null;
              if (myTimer != null) {
                myTimer!.cancel();
              }
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/vechiles',
                  arguments: userInfo,
                  (Route<dynamic> route) => false);
            }
          }
        });
      }

      //_timerSetup(requestId);
      //timer sonlandırmak veya başka işlemler yapmak için caselere devam edebilirsin
    }

    // if (ref.watch(processStateNotifierProvider).saleStateStatus == 3.0 ||
    //     ref.watch(processStateNotifierProvider).saleStateStatus == 2.0) {
    //   if (_sceneNumber!.controller.isActive == false) {
    //     Navigator.of(context).pushNamedAndRemoveUntil(
    //         '/vechiles',
    //         arguments: ref.watch(processStateNotifierProvider).userInfo,
    //         (Route<dynamic> route) => false);
    //   }
    // }

//----------------------------------------------------------------//
//--------------------------------UI Return-----------------------//
//----------------------------------------------------------------//

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: resp == null
              ? Container(
                  child: Column(
                  children: [
                    const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    Expanded(
                        child: Center(
                      child: Text("s-procces-starting").tr(),
                    )),
                  ],
                ))
              : Center(
                  child: SizedBox(
                    width: _screenWidth,
                    child: Rive(
                      artboard: _saleStatusArtboard!,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )),
    );
  }

//----------------------------------------------------------------//
//--------------------------------UI Return-----------------------//
//----------------------------------------------------------------//

  // Timer _timerSetup(
  //   String requestId,
  // ) {
  //   return mytimer = Timer.periodic(const Duration(seconds: 5), (timer) {
  //     debugPrint("çalışıyor");
  //     postSalesStatusApi(requestId);
  //   });
  // }

  Future<bool> postSalesStatusApi(String requestId) async {
    Dio _dio = Dio(BaseOptions(
        baseUrl: ApiConstants.myBaseUrl,
        connectTimeout: 15000,
        receiveTimeout: 15000));

    var postBody = {"requestId": requestId};

    try {
      var response = await _dio.post("salesstatus", data: postBody);
      if (response.statusCode == 200) {
        var result = salesStatusResponseFromMap(response.data);

        if (result.responseCode == "106") {
          cancelCounter++; //arada bağlantı koptu mesajı dönebiliyor. Eğer bağlantı koptu dönerse 3 kere daha kontrol et
          if (cancelCounter > 2) {
            //connection error
            ref
                .read(processStateNotifierProvider.notifier)
                .changeSaleStatus(3.0);
          }
        } else if (result.responseCode == "11") {
          //satış iptal
          ref.read(processStateNotifierProvider.notifier).changeSaleStatus(3.0);
        } else if (result.responseCode == "10") {
          // satış devam ediyor
          if (counter == 0) {
            cancelCounter = 0; //satış devam ettikçe cancel counterı sıfırla
            ref
                .read(processStateNotifierProvider.notifier)
                .changeSaleStatus(0.0);
            counter++;
          } else {
            ref
                .read(processStateNotifierProvider.notifier)
                .changeSaleStatus(1.0);
          }
        } else if (result.responseCode == "200") {
          //satış tamamlandı
          ref.read(processStateNotifierProvider.notifier).changeSaleStatus(2.0);
        }

        setState(() {
          resp = result;
          if (_lastStateStatus == null) {
            _sceneNumber!.value = 0.0;
            _lastStateStatus = 0.0;
          } else {
            if (_sceneNumber!.controller.isActive == false) {
              if (_lastStateStatus ==
                  ref.watch(processStateNotifierProvider).saleStateStatus) {
                //animasyon önceki sahne ile aynı ise işlem yapılmasın.
              } else {
                _sceneNumber!.value =
                    ref.watch(processStateNotifierProvider).saleStateStatus;
                _lastStateStatus =
                    ref.watch(processStateNotifierProvider).saleStateStatus;
              }
            }
          }
        });
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Exception("g-err-con-timeout".tr());
      } else if (e.type == DioErrorType.cancel) {
        throw Exception("g-err-req-cancelled".tr());
      } else if (e.type == DioErrorType.receiveTimeout) {
        throw Exception("g-err-recive-timeout".tr());
      } else if (e.type == DioErrorType.response) {
        throw Exception("g-err-srv-error".tr());
      } else if (e.type == DioErrorType.other) {
        throw Exception("g-err-unx-error".tr());
      } else if (e.type == DioErrorType.sendTimeout) {
        throw Exception("g-err-url-timeout".tr());
      }
    }
    return false;
  }
}
