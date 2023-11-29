//import 'package:dio/dio.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jossapp/model/preset_model.dart';
import 'package:jossapp/services/preset_manager.dart';
import 'package:jossapp/services/process_manager.dart';

import '../model/process_model.dart';

final presetStateNotifierProvider =
    StateNotifierProvider<PresetManager, PresetModel>((ref) {
  return PresetManager();
});

final processStateNotifierProvider =
    StateNotifierProvider<ProcessManager, ProcessModel>((ref) {
  return ProcessManager();
});

// final saleStatusProvider = FutureProvider<SalesStatusResponse>((ref) async {
//   var _dio = ref.watch(httpClientProvider);
//   var _requestId = ref.watch(presetStateNotifierProvider).txnid;
//   Timer.periodic(Duration(seconds: 3), (timer) {});
//   try {
//     var result =
//         await _dio.post("salesstatus", data: {"requestId": _requestId});
//     var response = salesStatusResponseFromMap(result.data);
//     return response;
//   } on DioError catch (e) {
//     if (e.type == DioErrorType.connectTimeout) {
//       throw Exception("Connection  Timeout Exception");
//     } else if (e.type == DioErrorType.cancel) {
//       throw Exception("Request is Cancelled");
//     } else if (e.type == DioErrorType.receiveTimeout) {
//       throw Exception("Receive Timeout");
//     } else if (e.type == DioErrorType.response) {
//       throw Exception("Server Error. Please contact your services");
//     } else if (e.type == DioErrorType.other) {
//       throw Exception("An unexpected error has occurred");
//     } else if (e.type == DioErrorType.sendTimeout) {
//       throw Exception("Url Send Timeout");
//     } else {
//       throw Exception(e.toString());
//     }
//     //return 500;
//   }
// });
//----------------------------BETA -------------------------------//

// final locationNowProvider = FutureProvider<List<double>>((ref) async {
//   List<double> loclist = List.empty(growable: true);
//   await Geolocator.requestPermission();
//   var konum = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.high);
//   loclist[0] = konum.latitude;
//   loclist[1] = konum.longitude;
//   debugPrint("latitude : ${konum.latitude} , langitude : ${konum.longitude}");
//   return loclist;
// });

// final httpClientProvider = Provider<Dio>(
//   (ref) {
//     Dio dio = Dio(BaseOptions(
//         baseUrl: "http://192.168.0.41:8888/CustomerRestApi/api/v1/",
//         connectTimeout: 5000,
//         receiveTimeout: 3000));
//     return dio;
//   },
// );

// final konumStateProvider =
//     StateProvider.family<double, List<double>>((ref, stationloclist) {
//   final loclist = ref.watch(locationNowProvider);
//   final distance = loclist.when(data: (data) {
//     debugPrint("my latitude : ${data[0]} ,my langitude : ${data[1]}");
//     return Geolocator.distanceBetween(
//         data[0], data[1], stationloclist[0], stationloclist[1]);
//   }, error: (err, stack) {
//     return double.parse(0.toString());
//   }, loading: () {
//     return double.parse(1.toString());
//   });
//   debugPrint(
//       "station latitude : ${stationloclist[0]} ,station langitude : ${stationloclist[1]}");

//   return distance;
// });

//----------------------------BETA -------------------------------//