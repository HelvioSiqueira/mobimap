import 'package:logger/logger.dart';

class AccessibilityPoint {
  AccessibilityPoint({
    required this.apName,
    required this.apTypes,
    required this.apQuality,
    required this.comment,
  });

  String? apName;
  List<String>? apTypes;
  String? apQuality;
  String? comment;

  AccessibilityPoint.fromJson(Map<String, dynamic> json) {
    apName = json["apName"];
    apQuality = json["apQuality"];
    comment = json["comment"];

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

    if (apTypes != null) {
      map["apTypes"] = apTypes;
    }

    return map;
  }
}
