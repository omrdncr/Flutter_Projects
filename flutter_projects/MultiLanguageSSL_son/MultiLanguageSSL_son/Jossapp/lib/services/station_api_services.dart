// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jossapp/constants/api_constants.dart';
import 'package:jossapp/model/station_response.dart';

class StationApiServices {
  final double? latitude;
  final double? longitude;

  Dio dio = Dio(BaseOptions(
      baseUrl: ApiConstants.myBaseUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000));

  StationApiServices({required this.latitude, required this.longitude});

  StationApiServices copyWith({
    double? latitude,
    double? longitude,
  }) {
    return StationApiServices(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Future postStationApi() async {
    Map<String, dynamic> postBody = {
      "latitude": latitude,
      "longitude": longitude
    };

    try {
      var response = await dio.post("stationinfo", data: postBody);
      if (response.statusCode == 200) {
        var stationInfo = stationResponseFromMap(response.data);

        if (stationInfo.result == true &&
            stationInfo.errorCode == 1 &&
            stationInfo.response!.isNotEmpty) {
          return stationInfo.response;
        } else {
          return 500;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
