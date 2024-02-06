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
  });

  String? apName;
  List<String>? apTypes;
  String? apQuality;
  String? comment;
  double? latitude;
  double? longitude;
  String? address;

  AccessibilityPoint.fromJson(Map<String, dynamic> json) {
    apName = json["apName"];
    apQuality = json["apQuality"];
    comment = json["comment"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    address = json["address"];

    apTypes = [];

    if (json["apTypes"] != null) {
      try {
        json["apTypes"].forEach((type) {
          apTypes!.add(type.toString());
        });
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

    if (apTypes != null) {
      map["apTypes"] = apTypes;
    }

    return map;
  }
}
