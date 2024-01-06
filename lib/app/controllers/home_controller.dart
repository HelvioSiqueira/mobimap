import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart%20';

class HomeController extends GetxController {
  RxBool loading = false.obs;
  RxMap<String, double> userLocation = <String, double>{}.obs;

  getUserLocation() async {
    loading(true);

    var latLong = <String, double>{};

    var permission = await Permission.location.request();

    if (permission.isGranted) {
      var location = await Location().getLocation();

      latLong["lat"] = location.latitude!;
      latLong["long"] = location.longitude!;

      userLocation.value = latLong;
    } else {
      latLong["lat"] = 37.422;
      latLong["long"] = -122.084;

      userLocation.value = latLong;
    }

    loading(false);
  }
}
