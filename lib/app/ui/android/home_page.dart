import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobimap/app/controllers/home_controller.dart';
import 'package:mobimap/app/ui/widgets/android/loading_alert_dialog.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
      ),
    );

    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          body: GetX<HomeController>(initState: (state) {
            Get.find<HomeController>().getUserLocation();
          }, builder: (_) {
            if (_.loading.isTrue) {
              return const LoadingAlertDialog(title: "Obtendo localização...");
            }

            var userLocation = _.userLocation;

            var initialCameraPosition = CameraPosition(
                target: LatLng(userLocation["lat"]!, userLocation["long"]!),
                zoom: 20);

            return GoogleMap(
              zoomControlsEnabled: false,
              initialCameraPosition: initialCameraPosition,
            );
          })),
    );
  }
}
