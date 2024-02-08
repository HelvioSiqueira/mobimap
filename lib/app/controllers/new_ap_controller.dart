import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobimap/app/data/model/accessibility_point.dart';
import 'package:mobimap/app/data/repository/new_ap_repository.dart';

class NewAPController extends GetxController {
  NewAPController({required this.newApRepository});

  final NewApRepository newApRepository;
  RxBool isQualityEmpty = false.obs;
  RxBool isTypesEmpty = false.obs;

  RxBool loadingAddress = false.obs;
  RxString placemark = "".obs;
  LatLng location = LatLng(0.0, 0.0);

  void validateForm(String quality, List<String> types) {
    if (quality.isEmpty) {
      isQualityEmpty.value = true;
    }

    if (types.isEmpty) {
      isTypesEmpty.value = true;
    }
  }

  Future<LatLng> getCurrentLocation() async {
    var location = await Geolocator.getCurrentPosition();
    return LatLng(location.latitude, location.longitude);
  }

  getAddressByLocation() async {
    loadingAddress(true);

    location = await getCurrentLocation();

    List<Placemark> placemarks = await placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    );

    Placemark firstPlacemark = placemarks.first;

    placemark.value = "${firstPlacemark.country},"
        " ${firstPlacemark.subAdministrativeArea},"
        " ${firstPlacemark.administrativeArea},"
        " ${firstPlacemark.street},"
        " ${firstPlacemark.postalCode}";

    loadingAddress(false);
  }

  void addAccessibilityPointToDatabase(AccessibilityPoint ap) {
    newApRepository.addAccessibilityPointToDatabase(ap);
  }
}
