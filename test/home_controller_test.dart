// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobimap/app/controllers/home_controller.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  HomeController homeController = HomeController();
  var defaultLatLong = const LatLng(37.422, -122.084);

  test('should get default latLong', () async {
    var permissionStatus = PermissionStatus.denied;

    LatLng latLng = await homeController.getLatLong(permissionStatus);

    expect(latLng, defaultLatLong);
  });
}
