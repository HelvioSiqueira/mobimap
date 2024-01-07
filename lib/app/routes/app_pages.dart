import 'package:get/get.dart';
import 'package:mobimap/app/bindings/new_ap_binding.dart';
import 'package:mobimap/app/routes/app_routes.dart';
import 'package:mobimap/app/ui/android/home_page.dart';
import 'package:mobimap/app/ui/android/new_ap_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.NEWAP,
      page: () => NewAPPage(),
      binding: NewAPBinding(),
      transition: Transition.downToUp
    ),
  ];
}
