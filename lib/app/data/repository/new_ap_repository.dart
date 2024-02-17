import 'package:mobimap/app/data/model/accessibility_point.dart';
import 'package:mobimap/app/data/providers/firebase_database_manager_impl.dart';

class NewApRepository {
  NewApRepository({required this.firebaseDatabaseManager});

  final FirebaseDatabaseManagerImpl firebaseDatabaseManager;

  void addAccessibilityPointToDatabase(AccessibilityPoint ap) async {
    firebaseDatabaseManager.addAccessibilityPointToDatabase(ap);
  }
}
