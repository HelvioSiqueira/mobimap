import 'package:firebase_database/firebase_database.dart';
import 'package:mobimap/app/data/model/accessibility_point.dart';

import '../../utils/fire_database_url.dart';

class FirebaseDatabaseManager {
  FirebaseDatabase databaseRef = FirebaseDatabase.instance;

  void addAccessibilityPointToDatabase(AccessibilityPoint ap) async {
    final ref = databaseRef.refFromURL(FireDatabaseUrl.AC);
    await ref.push().set(ap.toJson());
  }

  Future<List<AccessibilityPoint>> getAccessibilityPointsToDatabase() async {
    List<AccessibilityPoint> accessibilityPoints = [];

    final ref = databaseRef.refFromURL(FireDatabaseUrl.AC);
    final snapshot = await ref.get();
    if (snapshot.exists) {
      Map<dynamic, dynamic> t = snapshot.value as Map<dynamic, dynamic>;
      t.forEach((key, value) {
        accessibilityPoints.add(AccessibilityPoint.fromJson(value, key));
      });
    }

    return accessibilityPoints;
  }
}
