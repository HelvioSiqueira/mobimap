import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobimap/app/controllers/home_controller.dart';
import 'package:mobimap/app/routes/app_routes.dart';
import 'package:mobimap/app/ui/widgets/android/loading_alert_dialog.dart';
import 'package:mobimap/app/utils/map_style.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );

    //Get.find<HomeController>().getUserLocation();

    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.NEWAP);
            },
            child: const Icon(Icons.add),
          ),
          body: GetX<HomeController>(
              initState: (state){
                Get.find<HomeController>().getUserLocation();
              },
              builder: (_) {
            if (_.loading.isTrue) {
              return LoadingAlertDialog(title: "Obtendo localização...".tr);
            }

            var userLocation = _.userLocation.value;

            var initialCameraPosition =
                CameraPosition(target: userLocation, zoom: 16);

            return GoogleMap(
              onMapCreated: (controller){

                var brightness = MediaQuery.of(context).platformBrightness;
                bool isDarkMode = brightness == Brightness.dark;

                googleMapController = controller;
                if(isDarkMode) googleMapController.setMapStyle(mapStyle);
              },
              markers: {Marker(markerId: const MarkerId("1"), position: userLocation, )},
              zoomControlsEnabled: false,
              initialCameraPosition: initialCameraPosition,
            );
          })),
    );
  }
}
