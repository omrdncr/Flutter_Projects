// ignore_for_file: public_member_api_docs, sort_constructors_first
class StationRequest {
  final String latitude;
  final String longitude;

  StationRequest({required this.latitude, required this.longitude});

  StationRequest copyWith({
    String? latitude,
    String? longitude,
  }) {
    return StationRequest(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
