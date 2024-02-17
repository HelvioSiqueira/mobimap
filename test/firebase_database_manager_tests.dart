import 'package:flutter_test/flutter_test.dart';
import 'package:mobimap/app/data/model/accessibility_point.dart';
import 'package:mobimap/app/data/providers/firebase_database_manager.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mocks/firebase_database_manager_tests.mocks.dart';

class FirebaseDatabaseManagerTests extends Mock
    implements FirebaseDatabaseManager {}

@GenerateMocks([FirebaseDatabaseManagerTests])
Future<void> main() async {
  late FirebaseDatabaseManagerTests firebaseDatabaseManagerTests;

  setUpAll(() {
    firebaseDatabaseManagerTests = MockFirebaseDatabaseManagerTests();
  });

  test("should return a list of AccessibilityPoint", () async {
    when(firebaseDatabaseManagerTests.getAccessibilityPointsToDatabase())
        .thenAnswer((_) async => listOfAccessibilityPoints);

    var list =
        await firebaseDatabaseManagerTests.getAccessibilityPointsToDatabase();

    expect(list, isA<List<AccessibilityPoint>>());
  });

  test("should return a list with one AccessibilityPoint", () async {
    when(firebaseDatabaseManagerTests.getAccessibilityPointsToDatabase())
        .thenAnswer((_) async => listOfAccessibilityPoints);
    var list =
        await firebaseDatabaseManagerTests.getAccessibilityPointsToDatabase();

    expect(1, list.length);
  });
}

var listOfAccessibilityPoints = [
  AccessibilityPoint(
      apName: "Escadaria Angelim",
      apTypes: ["Rampa", "Corrimão"],
      apQuality: "Bom",
      comment: "",
      latitude: 54.2,
      longitude: 76.2,
      address: "",
      creator: "helvio@gmail.com")
];
