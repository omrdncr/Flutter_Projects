import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jossapp/constants/api_constants.dart';
import 'package:jossapp/constants/app_constants.dart';
import 'package:jossapp/model/preset_model.dart';
import 'package:jossapp/model/preset_response_model.dart';
import 'package:jossapp/services/all_providers.dart';
import 'package:jossapp/util/helpers/trans_helper.dart';

//ignore: must_be_immutable
class PumpsDetail extends ConsumerWidget {
  PumpsDetail({super.key});

  List<double> loclist = List.filled(2, 0);
  final _formKey = GlobalKey<FormState>();
  double distanceInMeters = 0;
  bool isErrorNavigate = false;

  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final List<dynamic> pumpLatLong =
        (ModalRoute.of(context)!.settings.arguments as List<dynamic>);
    double lat = pumpLatLong[0];
    double long = pumpLatLong[1];
    String stationId = pumpLatLong[2];
    List<int> pumps = pumpLatLong[3];

    pumps.sort();

    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20.0, bottom: 8, right: 8, left: 8),
          // ignore: avoid_unnecessary_containers
          child: Container(
              child: ListView.builder(
            itemCount: pumps.length,
            itemBuilder: ((context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    //herhangi birine tıklandığında listeyi kapat
                    ref
                        .read(processStateNotifierProvider.notifier)
                        .showLoaderDialog(context, "p-loader".tr());
                    var screenwidth = MediaQuery.of(context).size.width;
                    //setState(() {});

                    _konumAl().then((value) => {
                          Navigator.pop(context),
                          distanceInMeters = Geolocator.distanceBetween(
                              value[0], value[1], lat, long),
                          if (distanceInMeters > 300.0)
                            {
                              //debugPrint("300 metre"),
                              AnimatedSnackBar.rectangle(
                                'p-distant'.tr(),
                                TransHelper.getDeviceLanguage(
                                    context, "x>200", distanceInMeters),
                                type: AnimatedSnackBarType.warning,
                                brightness: Brightness.dark,
                              ).show(
                                context,
                              ),
                            }
                          //buradaki 70 değerini düzeltmeyi unutma
                          else if (distanceInMeters < 300 &&
                              distanceInMeters >= 100)
                            {
                              //debugPrint("60 metre"),
                              AnimatedSnackBar.rectangle(
                                'p-get-closer'.tr(),
                                TransHelper.getDeviceLanguage(
                                    context, "100<x<200", distanceInMeters),
                                type: AnimatedSnackBarType.info,
                                brightness: Brightness.dark,
                              ).show(
                                context,
                              ),
                            }
                          else if (distanceInMeters < 100)
                            {
                              //bir kereliğine success göster pumpno dolunca gösterme
                              if (ref
                                  .watch(presetStateNotifierProvider)
                                  .pumpno
                                  .isEmpty)
                                {
                                  AnimatedSnackBar.rectangle(
                                    'p-actnable-distance'.tr(),
                                    TransHelper.getDeviceLanguage(
                                        context, "x<100", distanceInMeters),
                                    type: AnimatedSnackBarType.success,
                                    brightness: Brightness.dark,
                                  ).show(
                                    context,
                                  ),
                                },

                              //dialog panel aç

                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    var screenHeightDialog =
                                        MediaQuery.of(context).size.height;

                                    //listeyi geri bas ekrana

                                    return Dialog(
                                      backgroundColor:
                                          const Color.fromARGB(0, 0, 0, 0),
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          Container(
                                            height: 300,
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              border: Border.all(
                                                  color: Colors.white),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(100),
                                                      topRight:
                                                          Radius.circular(100)),
                                            ),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  margin:
                                                      const EdgeInsets.all(15),
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 80,
                                                        child: Container(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          height:
                                                              double.infinity,
                                                          child: SvgPicture.asset(
                                                              "lib/assets/gaspump.svg",
                                                              fit: BoxFit
                                                                  .contain,
                                                              height: double
                                                                  .infinity,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: screenwidth / 6),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "p-pumpno".tr() +
                                                          "\n${ref.watch(presetStateNotifierProvider).pumpno}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize:
                                                              screenHeightDialog /
                                                                  40),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 200,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(90))),
                                            padding: const EdgeInsets.all(10.0),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10, left: 15),
                                              child: Column(children: [
                                                Expanded(
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text("p-usid".tr() +
                                                        "${ref.watch(presetStateNotifierProvider).customername}"),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text("p-plate".tr() +
                                                        "${ref.watch(presetStateNotifierProvider).plate}"),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text("p-rfid".tr() +
                                                        "${ref.watch(presetStateNotifierProvider).rfno}"),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 250,
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 150,
                                                  color: Colors.white,
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Form(
                                                      autovalidateMode:
                                                          AutovalidateMode
                                                              .always,
                                                      key: _formKey,
                                                      child: TextFormField(
                                                        onSaved: (newValue) {
                                                          ref
                                                              .read(
                                                                  presetStateNotifierProvider
                                                                      .notifier)
                                                              .presetHazirla(
                                                                  customliter:
                                                                      int.parse(
                                                                          newValue!),
                                                                  customstationid:
                                                                      stationId);
                                                        },
                                                        validator: (newValue) {
                                                          //limit kontrol yapılmalı
                                                          double limit = ref
                                                              .watch(
                                                                  presetStateNotifierProvider)
                                                              .cardlimit;
                                                          //bu kısımda istediğimiz şartları kontrol edebiliriz
                                                          if (newValue!
                                                              .isEmpty) {
                                                            return 'p-required'
                                                                .tr();
                                                          } else if (double.parse(
                                                                  newValue) ==
                                                              0) {
                                                            return "p-not-zero"
                                                                .tr();
                                                          } else if (double
                                                                  .parse(
                                                                      newValue) >
                                                              limit) {
                                                            return "p-balance"
                                                                    .tr() +
                                                                TransHelper
                                                                    .getDeviceLanguage(
                                                                        context,
                                                                        "remaining",
                                                                        limit);
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .digitsOnly
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              "p-liter".tr(),
                                                          labelText:
                                                              "p-liter".tr(),
                                                          prefixIcon:
                                                              const Icon(
                                                            Icons.person,
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black45),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            255,
                                                                            0,
                                                                            0)),
                                                          ),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide:
                                                                const BorderSide(),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            50,
                                                                            204,
                                                                            201)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 100,
                                                  child: Container(
                                                    color: Colors.white,
                                                    child: Center(
                                                      child: ElevatedButton(
                                                        child: Text(
                                                          "p-btn-start".tr(),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                        onPressed: () {
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            _formKey
                                                                .currentState!
                                                                .save();
                                                            var screenHeight =
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height;
                                                            //bottom sheet
                                                            showModalBottomSheet<
                                                                void>(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Container(
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .all(10),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          39,
                                                                          163,
                                                                          161),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30)),
                                                                  height:
                                                                      (screenHeight /
                                                                              5) *
                                                                          2,
                                                                  child: Center(
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: <
                                                                          Widget>[
                                                                        Padding(
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          child: Text(
                                                                              'p-sixty-seconds'.tr(),
                                                                              style: const TextStyle(color: BadColors.stawizWhite)),
                                                                        ),
                                                                        const Divider(),
                                                                        Text(
                                                                          'p-confirm'
                                                                              .tr(),
                                                                          style:
                                                                              const TextStyle(color: BadColors.stawizWhite),
                                                                        ),
                                                                        ButtonBar(
                                                                          alignment:
                                                                              MainAxisAlignment.center,
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            ElevatedButton(
                                                                              style: ElevatedButton.styleFrom(
                                                                                backgroundColor: BadColors.stawizWhite,
                                                                              ),
                                                                              child: Text(
                                                                                'p-confirm-y'.tr(),
                                                                                style: const TextStyle(
                                                                                  color: BadColors.stawizBlack,
                                                                                  fontSize: 20,
                                                                                ),
                                                                              ),
                                                                              onPressed: () => {
                                                                                postPresetApi(ref.watch(presetStateNotifierProvider), ref).then((value) {
                                                                                  if (value) {
                                                                                    //Navigator.pushReplacementNamed(context, '/salestatus', arguments: ref.read(presetStateNotifierProvider).txnid);
                                                                                    Navigator.of(context).pushNamedAndRemoveUntil('/salestatus', arguments: ref.read(presetStateNotifierProvider).txnid, (Route<dynamic> route) => false);
                                                                                  }
                                                                                }, onError: (exception) {
                                                                                  isErrorNavigate = true;
                                                                                  if (exception != null) {
                                                                                    AnimatedSnackBar.rectangle('p-err-preset'.tr(), exception.toString(), type: AnimatedSnackBarType.error, brightness: Brightness.dark, duration: const Duration(seconds: 1))
                                                                                        .show(
                                                                                      context,
                                                                                    )
                                                                                        .then((value) {
                                                                                      Navigator.pop(context);
                                                                                    });
                                                                                  }
                                                                                })

                                                                                // buraya preset işlemi yapılacak.
                                                                              },
                                                                            ),
                                                                            ElevatedButton(
                                                                              // ignore: deprecated_member_use
                                                                              style: ElevatedButton.styleFrom(primary: Colors.white),
                                                                              child: Container(
                                                                                child: Text(
                                                                                  'p-confirm-n'.tr(),
                                                                                  style: const TextStyle(color: BadColors.stawizBlack, fontSize: 20),
                                                                                ),
                                                                              ),
                                                                              onPressed: () => Navigator.pop(context),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) {
                                                              if (isErrorNavigate ==
                                                                  true) {
                                                                Navigator.pop(
                                                                    context);
                                                              }
                                                            });
                                                            //Preset isteği burada gerçekleştirilecek.
                                                            // /pumppreset
                                                          } else {
                                                            AnimatedSnackBar
                                                                .rectangle(
                                                              'p-anim-snack-err'
                                                                  .tr(),
                                                              'p-anim-snack-entr-value'
                                                                  .tr(),
                                                              type:
                                                                  AnimatedSnackBarType
                                                                      .error,
                                                              duration:
                                                                  const Duration(
                                                                      seconds:
                                                                          1),
                                                              brightness:
                                                                  Brightness
                                                                      .dark,
                                                            ).show(
                                                              context,
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ]),
                                      ),
                                    );
                                  }).then((value) {
                                if (isErrorNavigate == true) {
                                  isErrorNavigate == false;
                                  Navigator.pop(context);
                                }
                              }),

                              //providera yaz.
                              ref
                                  .read(presetStateNotifierProvider.notifier)
                                  .pumpNoDoldur(
                                      custompumpno: pumps[index].toString()),

                              // debugPrint(ref
                              //     .watch(presetStateNotifierProvider)
                              //     .toString()),
                            }
                        });
                    // setState(() {});
                  },
                  title: Text(TransHelper.getDeviceLanguage(
                      context, "pumpsno", pumps[index])),
                  subtitle: const Text(""),
                  leading: const Icon(Icons.local_gas_station),
                ),
              );
            }),
          )),
        ),
      ),
    );
  }

  Future<List<double>> _konumAl() async {
    await Geolocator.requestPermission();
    var konum = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    List<double> loclist = List.filled(2, 0);
    loclist[0] = konum.latitude;
    loclist[1] = konum.longitude;
    return loclist;
  }

//ref gönder
  Future<bool> postPresetApi(PresetModel preset, WidgetRef ref) async {
    Map<String, dynamic> postBody = {
      "stationid": preset.stationid,
      "stock_id": preset.stockid,
      "rfno": preset.rfno,
      "pumpno": preset.pumpno,
      "liter": preset.liter,
      "txnid": preset.txnid,
      "plate": preset.plate,
      "customername": preset.customername
    };

    Dio dio = Dio(BaseOptions(
        baseUrl: ApiConstants.myBaseUrl,
        connectTimeout: 15000,
        receiveTimeout: 15000));

    try {
      var response = await dio.post("pumppreset", data: postBody);
      if (response.statusCode == 200) {
        var result = presetResponseFromMap(response.data);
        if (result.responseCode == "200") {
          // transaction id yi al
          ref
              .watch(presetStateNotifierProvider.notifier)
              .requestIdDoldur(customtxnid: result.transactionId);

          return true;
        } else {
          throw (result.responseMsg.toString());
        }
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
