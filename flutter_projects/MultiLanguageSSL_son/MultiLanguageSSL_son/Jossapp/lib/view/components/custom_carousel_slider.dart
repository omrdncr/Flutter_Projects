// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:jossapp/constants/api_constants.dart';
import 'package:jossapp/model/check_rfid_response.dart';
import 'package:jossapp/constants/app_constants.dart';
import 'package:jossapp/model/station_response.dart';
import 'package:jossapp/services/all_providers.dart';
import 'package:jossapp/util/helpers/trans_helper.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

class MyCostumCarousel extends StatefulWidget {
  const MyCostumCarousel({
    Key? key,
    required this.rfno,
  }) : super(key: key);

  final String rfno;

  @override
  State<MyCostumCarousel> createState() => _MyCostumCarouselState();
}

class _MyCostumCarouselState extends State<MyCostumCarousel> {
  final CarouselController _controller = CarouselController();

  List<CevapStation>? _stationResult;
  int? _stationCounter;
  int _current = 0;
  List<double> loclist = List.filled(2, 0);
  double distanceInMeters = 0;

  @override
  void initState() {
    super.initState();
    _konumAl().then((value) => {
          //debugPrint("asdasdasd" + value[0].toString())
          postStationApi(value[0], value[1], widget.rfno),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _stationCounter != null
          ? Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      carouselController: _controller,
                      itemCount: _stationCounter,
                      options: CarouselOptions(
                        height: double.infinity,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                        aspectRatio: 15 / 9,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.95,
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 15, bottom: 15, right: 10, left: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: BadColors.carouselBlack,
                                    blurRadius: 6,
                                  ),
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: BadColors.stawizDarkWhite),
                            child: mySliderBody(_stationResult![index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //alt kısımdaki noktalar
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: _stationResult!.length >
                            MediaQuery.of(context).size.width / 40
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  _stationResult!.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () =>
                                      _controller.animateToPage(entry.key),
                                  child: Container(
                                    width: 20.0,
                                    height: 10.0,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 10.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? BadColors.stawizWhite
                                                : BadColors.carouselBlack)
                                            .withOpacity(_current == entry.key
                                                ? 0.95
                                                : 0.35)),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:
                                _stationResult!.asMap().entries.map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    _controller.animateToPage(entry.key),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 20.0,
                                  height: 10.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? BadColors.stawizWhite
                                              : BadColors.carouselBlack)
                                          .withOpacity(_current == entry.key
                                              ? 0.95
                                              : 0.35)),
                                ),
                              );
                            }).toList(),
                          ),
                  ),
                )
              ],
            )
          //ekran yüklenmeden önceki gösterilen kod
          : Center(
              child: SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: const RiveAnimation.asset(
                    "lib/assets/anim/loading_jossapp.riv",
                    fit: BoxFit.fitWidth,
                  )),
            ),
    );
  }

  Widget mySliderBody(CevapStation station) {
    distanceInMeters = Geolocator.distanceBetween(loclist[0], loclist[1],
        double.parse(station.latitude!), double.parse(station.longitude!));
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 150,
                child: Container(
                    decoration: BoxDecoration(
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          color: BadColors.stawizBlack,
                          blurRadius: 6,
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(2),
                        bottomRight: Radius.circular(2),
                      ),
                      border: Border.all(color: BadColors.stawizDarkGray),
                      color: BadColors.stawizDarkGray,
                    ),
                    child: Container(
                      margin:
                          const EdgeInsets.only(bottom: 3, left: 15, right: 15),
                      child: Center(
                          child: Text(
                        station.stationname.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  offset: Offset(1.5, 1.5),
                                  blurRadius: 4.0,
                                  color: BadColors.stawizBlack),
                            ],
                            color: BadColors.stawizDarkWhite),
                      )),
                    ))),
            Expanded(
                flex: 800,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        color: BadColors.carouselBlack,
                        blurRadius: 8,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    border: Border.all(
                        color: const Color.fromARGB(167, 155, 155, 155)),
                    color: BadColors.stawizDarkWhite,
                  ),
                  child: Stack(
                    children: [
                      MyProductList(station: station),
                      Positioned(
                        height: 45,
                        width: 100,
                        child: Container(
                          color: BadColors.stawizDarkGreen,
                          child: Center(
                              child: Text(
                            "c-slct-prdct".tr(),
                            style: const TextStyle(
                                color: BadColors
                                    .stawizDarkWhite), //beyaz yerine kullandığımız renk
                          )),
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                // Sliderın en alt kısmı
                flex: 200,
                child: Container(
                  decoration: BoxDecoration(
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                        color: BadColors.stawizTransparentGrey,
                        blurRadius: 5,
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: BadColors.stawizTransparentGrey),
                    color: BadColors.stawizDarkWhite,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 75,
                          child: ListTile(
                            subtitle: Text("c-now".tr() +
                                "${distanceInMeters.toString().split(".")[0]} m"),
                            leading: const Icon(Icons.home_work,
                                color: BadColors.stawizDarkGreen),
                            title: Text(
                              //station.distance.toString()
                              "c-dist".tr(),
                              style:
                                  const TextStyle(color: BadColors.stawizBlack),
                            ),
                          )),
                      Expanded(
                          flex: 35,
                          child: Container(
                              height: double.infinity,
                              margin: const EdgeInsets.only(
                                  top: 18, bottom: 18, right: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: BadColors.stawizDarkGray,
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                onPressed: (() => _launchUrl(
                                      double.parse(station.latitude.toString()),
                                      double.parse(
                                        station.longitude.toString(),
                                      ),
                                    )),
                                // ignore: prefer_const_constructors
                                child: AutoSizeText(
                                  "c-go-station".tr(),
                                  style: const TextStyle(
                                      color: BadColors.stawizWhite,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              )))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(double lat, double long) async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      String encodedURl = Uri.encodeFull(
          "https://www.google.com/maps/dir/?api=1&origin=${loclist[0]},${loclist[1]}&destination=$lat,$long&travelmode=driving");
      if (await canLaunch(encodedURl)) {
        await launch(encodedURl);
      } else {
        debugPrint('Could not launch $encodedURl');
        throw 'Could not launch $encodedURl';
      }
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      String encodedURl =
          Uri.encodeFull('http://maps.apple.com/?daddr=$lat,$long');
      if (await canLaunch(encodedURl)) {
        await launch(encodedURl);
      } else {
        debugPrint('Could not launch $encodedURl');
        throw 'Could not launch $encodedURl';
      }
    }
  }

  Future<List<double>> _konumAl() async {
    await Geolocator.requestPermission();
    var konum = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    //List<double> loclist = List.filled(2, 0);
    loclist[0] = konum.latitude;
    loclist[1] = konum.longitude;
    return loclist;
  }

  Future postStationApi(double lat, double long, String rfno) async {
    Map<String, dynamic> postBody = {"rfno": rfno};
    // ignore: no_leading_underscores_for_local_identifiers
    double _dist = 0;
    var proceedList = List<CevapStation>.empty(growable: true);
    Dio dio = Dio(BaseOptions(
        baseUrl: ApiConstants.myBaseUrl,
        connectTimeout: 10000,
        receiveTimeout: 10000));

    try {
      //debugPrint("try catch start" + postBody.toString());
      var response = await dio.post("stationinfo", data: postBody);
      if (response.statusCode == 200) {
        //debugPrint("STATUS 200" + response.data.toString());
        var stationInfo = stationResponseFromMap(response.data);
        //debugPrint("selaaam    ----" + stationInfo.result.toString());
        if (stationInfo.result == true &&
            stationInfo.errorCode == 1 &&
            stationInfo.response!.isNotEmpty) {
          //debugPrint(stationInfo.response!.length.toString());

          stationInfo.response!
              .map((e) => {
                    _dist = Geolocator.distanceBetween(lat, long,
                        double.parse(e.latitude!), double.parse(e.longitude!)),
                    if (_dist < 10000)
                      {
                        e.dist = int.parse(
                            _dist.toString().split('.')[0].toString()),
                        proceedList.add(e),
                        debugPrint("Mesafe içindeki petrol : ${e.stationname}")
                      }
                  })
              .toList();

          debugPrint("-----------------------------------------");
          proceedList.map((e) {
            proceedList.sort((a, b) => a.dist!.compareTo(b.dist!));
            debugPrint(
                "${e.stationname} isimli petrolün uzaklığı ${e.dist} dir");
          }).toList();
          debugPrint("-----------------------------------------");

          debugPrint("Listelenen petrol sayısı : ${proceedList.length}");
          //debugPrint(stationInfo.response![0].toString());
          setState(() {
            _stationResult = proceedList;
            _stationCounter = proceedList.length;
          });
          return proceedList;
        } else {
          return 500;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

class MyProductList extends ConsumerWidget {
  const MyProductList({
    Key? key,
    required this.station,
  }) : super(key: key);
  final CevapStation station;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 10.0, top: 15.0, left: 10.0, right: 10.0),
      child: station.stocks!.isNotEmpty
          ? ListView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              shrinkWrap: true,
              children: station.stocks!
                  .map((e) => Column(
                        children: [
                          Card(
                            child: ListTile(
                              onTap: () {
                                ref
                                    .read(processStateNotifierProvider.notifier)
                                    .showLoaderDialog(
                                        context, "c-card-checking".tr());
                                checkRfid(
                                        ref
                                            .watch(presetStateNotifierProvider)
                                            .rfno,
                                        station.uscmacaddress!,
                                        e.stockId!,
                                        ref)
                                    .then((value) {
                                  if (value == true) {
                                    List<dynamic> pump_latlong =
                                        List.empty(growable: true);
                                    ref
                                        .read(presetStateNotifierProvider
                                            .notifier)
                                        .pumpNoDoldur(customstockid: e.stockId);
                                    pump_latlong
                                        .add(double.parse(station.latitude!));
                                    pump_latlong
                                        .add(double.parse(station.longitude!));
                                    pump_latlong.add(station.stationId);
                                    pump_latlong.add(e.pumps);
                                    debugPrint(ref
                                        .watch(presetStateNotifierProvider)
                                        .toString());
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, '/pumpsdetail',
                                        arguments: pump_latlong);
                                  }
                                }, onError: (exception) {
                                  if (exception != null) {
                                    AnimatedSnackBar.rectangle(
                                      'p-anim-snack-err'.tr(),
                                      exception.toString(),
                                      type: AnimatedSnackBarType.error,
                                      brightness: Brightness.dark,
                                    )
                                        .show(
                                      context,
                                    )
                                        .then((value) {
                                      Navigator.pop(context);
                                    });
                                  }
                                });
                              },
                              leading: const Icon(Icons.local_gas_station,
                                  color: BadColors.stawizDarkGray),
                              title: Text(
                                e.stockname.toString(),
                                style: const TextStyle(
                                    color: BadColors.stawizBlack),
                              ),
                              subtitle: Text(
                                  TransHelper.getDeviceLanguage(
                                      context, "pumpcount", e.pumps!.length),
                                  style: const TextStyle(
                                      color: BadColors.stawizGrey)),
                            ),
                          ),
                          const Divider(
                            indent: 30,
                            endIndent: 30,
                          )
                        ],
                      ))
                  .toList(),
            )
          : Center(
              child: Container(
                  margin: const EdgeInsets.all(8),
                  child: AutoSizeText(
                    "c-clsd-station".tr(),
                    style: const TextStyle(
                        color: BadColors.stawizGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ))),
    );
  }

  Future<bool> checkRfid(
      String rfno, String uscid, String stockcode, WidgetRef ref) async {
    //post body'sini oluşturuyoruz.
    Map<String, dynamic> checkPostBody = {
      "rfno": rfno,
      "uscid": uscid,
      "stockcode": stockcode
    };

    Dio dio = Dio(BaseOptions(
        baseUrl: ApiConstants.myBaseUrl,
        connectTimeout: 15000,
        receiveTimeout: 15000));

    try {
      var response = await dio.post("checkrfid", data: checkPostBody);
      if (response.statusCode == 200) {
        debugPrint("CHECK RFID YAPILIYOR.");
        var rfidInfo = checkRfidResponseFromMap(response.data);
        if (rfidInfo.result!) {
          if (rfidInfo.errorMessage!.isEmpty) {
            //burada unitprice ile requestid yi al
            ref
                .watch(presetStateNotifierProvider.notifier)
                .requestIdDoldur(customtxnid: rfidInfo.requestId);

            debugPrint("CHECK RFID YAPILIYOR. ->> ${rfidInfo.toString()}");
            return true;
          } else {
            throw Exception(rfidInfo.errorMessage);
          }
        } else {
          throw Exception(rfidInfo.errorMessage);
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
