import 'package:geolocator/geolocator.dart';

class GeolocatorFunctions {
  //Sistemde lokasyon işlemleri için geolocator kütüphanesi değişse bile ön yüzde herhangi bir değişiklik olmaz.
  Future<List<double>> getLocation() async {
    List<double> locList = List.filled(2, 0.0);
    locList = await _geolocatorGetLocation();
    return locList;
  }

  double getDistance(startLatitude, startLongitude, endLatitude, endLongitude) {
    return Geolocator.distanceBetween(
        startLatitude, startLongitude, endLatitude, endLongitude);
  }

  //Geolocator kütüphanesi ile konum çekme
  Future<List<double>> _geolocatorGetLocation() async {
    final _geolocatorLocList = List.filled(2, 0.0);
    await Geolocator.requestPermission();
    var konum = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _geolocatorLocList[0] = konum.latitude;
    _geolocatorLocList[1] = konum.longitude;
    return _geolocatorLocList;
  }
}
