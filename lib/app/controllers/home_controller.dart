import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  RxBool loading = false.obs;
  Rx<LatLng> userLocation = LatLng(0.0, 0.0).obs;
  bool getUserLocationHasCalled = false;

  getUserLocation() async {
    loading(true);

    var permission = await Permission.location.request();

    userLocation.value = await _getLatLong(permission);

    loading(false);
    getUserLocationHasCalled = true;
  }

  Future<LatLng> _getLatLong(PermissionStatus permissionStatus) async {
    if (permissionStatus == PermissionStatus.granted) {
      var location = await Geolocator.getCurrentPosition();

      return LatLng(location.latitude, location.longitude);
    } else {

      return const LatLng(37.422, -122.084);
    }
  }
}
