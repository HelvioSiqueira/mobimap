import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobimap/app/controllers/home_controller.dart';
import 'package:mobimap/app/data/providers/firebase_database_manager_impl.dart';
import 'package:mobimap/app/routes/app_routes.dart';
import 'package:mobimap/app/ui/widgets/android/my_loading_alert_dialog.dart';
import 'package:mobimap/app/ui/widgets/android/my_circle_avatar.dart';
import 'package:mobimap/app/utils/map_style.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.background,
      ),
    );

    var firebase = FirebaseDatabaseManagerImpl();
    firebase.getAccessibilityPointsToDatabase();

    //Get.find<HomeController>().getUserLocation();

    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          return SafeArea(
            child: Scaffold(
                floatingActionButton: snapshot.hasData
                    ? FloatingActionButton(
                        onPressed: () {

                          if(snapshot.hasData){
                            Get.lazyPut(() => snapshot.data);
                          }

                          Get.toNamed(Routes.NEWAP);
                        },
                        child: const Icon(Icons.add),
                      )
                    : null,
                body: GetX<HomeController>(initState: (state) {
                  if (!Get.find<HomeController>().getUserLocationHasCalled) {
                    Get.find<HomeController>().getUserLocation();
                  }
                }, builder: (_) {
                  if (_.loading.isTrue) {
                    return MyLoadingAlertDialog(
                        title: "Obtendo localização...".tr);
                  }

                  var userLocation = _.userLocation.value;

                  var initialCameraPosition =
                      CameraPosition(target: userLocation, zoom: 16);

                  return Stack(
                    children: [
                      GoogleMap(
                        onMapCreated: (controller) {
                          var brightness =
                              MediaQuery.of(context).platformBrightness;
                          bool isDarkMode = brightness == Brightness.dark;

                          googleMapController = controller;
                          if (isDarkMode) {
                            googleMapController.setMapStyle(mapStyle);
                          }
                        },
                        markers: {
                          Marker(
                            markerId: const MarkerId("1"),
                            position: userLocation,
                          )
                        },
                        zoomControlsEnabled: false,
                        initialCameraPosition: initialCameraPosition,
                      ),
                      snapshot.hasData
                          ? MyCircleAvatar(
                              onPressed: () {
                                Get.toNamed(Routes.LOGIN);
                              },
                              childCircleAvatar:
                                  Text(snapshot.data!.email.toString()[0]),
                            )
                          : MyCircleAvatar(
                              onPressed: () {
                                Get.toNamed(Routes.LOGIN);
                              },
                              childCircleAvatar: const Icon(
                                Icons.login,
                                size: 25,
                              ),
                            ),
                    ],
                  );
                })),
          );
        });
  }
}
