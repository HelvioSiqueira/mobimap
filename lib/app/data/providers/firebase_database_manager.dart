import '../model/accessibility_point.dart';

abstract class FirebaseDatabaseManager {
  Future<void> addAccessibilityPointToDatabase(AccessibilityPoint ap);

  Future<List<AccessibilityPoint>> getAccessibilityPointsToDatabase();
}
