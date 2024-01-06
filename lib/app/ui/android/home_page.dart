import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: Permission.location.request(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }

            var permissionStatus = snapshot.data!;

            if (permissionStatus == PermissionStatus.granted) {
              return const GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.422, -122.084),
                ),
              );
            } else if (permissionStatus == PermissionStatus.denied) {
              return const GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.422, -122.084),
                ),
              );
            } else {
              return const GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.422, -122.084),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
