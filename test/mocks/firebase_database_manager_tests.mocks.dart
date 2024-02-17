// Mocks generated by Mockito 5.4.4 from annotations
// in mobimap/test/firebase_database_manager_tests.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mobimap/app/data/model/accessibility_point.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

import '../firebase_database_manager_tests.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [FirebaseDatabaseManagerTests].
///
/// See the documentation for Mockito's code generation for more information.
class MockFirebaseDatabaseManagerTests extends _i1.Mock
    implements _i2.FirebaseDatabaseManagerTests {
  MockFirebaseDatabaseManagerTests() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> addAccessibilityPointToDatabase(
          _i4.AccessibilityPoint? ap) =>
      (super.noSuchMethod(
        Invocation.method(
          #addAccessibilityPointToDatabase,
          [ap],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<List<_i4.AccessibilityPoint>> getAccessibilityPointsToDatabase() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAccessibilityPointsToDatabase,
          [],
        ),
        returnValue: _i3.Future<List<_i4.AccessibilityPoint>>.value(
            <_i4.AccessibilityPoint>[]),
      ) as _i3.Future<List<_i4.AccessibilityPoint>>);
}
