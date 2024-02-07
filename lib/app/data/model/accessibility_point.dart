import 'package:logger/logger.dart';

class AccessibilityPoint {
  AccessibilityPoint({
    required this.apName,
    required this.apTypes,
    required this.apQuality,
    required this.comment,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.creator,
  });

  String? apName;
  List<String>? apTypes;
  String? apQuality;
  String? comment;
  double? latitude;
  double? longitude;
  String? address;
  String? creator;
  String? apId;

  AccessibilityPoint.fromJson(Map<Object?, Object?> json, String id) {
    apId = id;
    apName = json["apName"] as String;
    apQuality = json["apQuality"] as String;
    comment = json["comment"] as String;
    latitude = json["latitude"] as double;
    longitude = json["longitude"] as double;
    address = json["address"] as String;
    creator = json["creator"] as String;

    apTypes = [];

    if (json["apTypes"] != null) {
      try {
        for (var type in (json["apTypes"] as List<Object?>)) {
          apTypes!.add(type.toString());
        }
      } catch (e) {
        Logger().e(e);
      }
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};

    map["apName"] = apName;
    map["apQuality"] = apQuality;
    map["comment"] = comment;
    map["latitude"] = latitude;
    map["longitude"] = longitude;
    map["address"] = address;
    map["creator"] = creator;

    if (apTypes != null) {
      map["apTypes"] = apTypes;
    }

    return map;
  }

  @override
  String toString() {
    return 'AccessibilityPoint{apName: $apName,'
        ' ipId: $apId,'
        ' apTypes: $apTypes,'
        ' apQuality: $apQuality,'
        ' comment: $comment,'
        ' latitude: $latitude,'
        ' longitude: $longitude,'
        ' address: $address,'
        ' creator: $creator}';
  }
}
