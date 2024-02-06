import 'package:firebase_database/firebase_database.dart';
import 'package:logger/logger.dart';
import 'package:mobimap/app/data/model/accessibility_point.dart';

import '../../utils/fire_database_url.dart';

class FirebaseDatabaseManager {
  FirebaseDatabase databaseRef = FirebaseDatabase.instance;

  void addAccessibilityPointToDatabase(AccessibilityPoint ap) async {
    var ref = databaseRef.refFromURL(FireDatabaseUrl.AC);
    await ref.push().set(ap.toJson());
  }
}
