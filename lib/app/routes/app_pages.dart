import 'package:get/get.dart';
import 'package:mobimap/app/routes/app_routes.dart';
import 'package:mobimap/app/ui/android/home_page.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => HomePage())
  ];
}
