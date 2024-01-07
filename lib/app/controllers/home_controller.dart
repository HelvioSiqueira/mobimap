import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {

  RxBool loading = false.obs;
  RxMap<String, double> userLocation = <String, double>{}.obs;

  getUserLocation() async {
    loading(true);

    var latLong = <String, double>{};

    await Permission.location.request();

    var hasPermission = await Geolocator.checkPermission();

    if (hasPermission != LocationPermission.denied) {
      var location = await Geolocator.getCurrentPosition();

      latLong["lat"] = location.latitude;
      latLong["long"] = location.longitude;

      userLocation.value = latLong;
    } else {
      latLong["lat"] = 37.422;
      latLong["long"] = -122.084;

      userLocation.value = latLong;
    }

    loading(false);
  }
}
