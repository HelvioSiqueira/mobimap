import 'package:get/get.dart';
import 'package:mobimap/app/controllers/new_ap_controller.dart';
import 'package:mobimap/app/data/providers/firebase_database_manager.dart';
import 'package:mobimap/app/data/repository/new_ap_repository.dart';

class NewAPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewAPController>(() => NewAPController(
          newApRepository: NewApRepository(
              firebaseDatabaseManager: FirebaseDatabaseManager()),
        ));
  }
}
