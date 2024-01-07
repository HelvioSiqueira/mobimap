import 'package:get/get.dart';
import 'package:mobimap/app/controllers/new_ap_controller.dart';

class NewAPBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NewAPController>(() => NewAPController());
  }

}