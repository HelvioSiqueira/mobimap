import 'package:get/get.dart';

class NewAPController extends GetxController{

  RxBool isQualityEmpty = false.obs;
  RxBool isTypesEmpty = false.obs;

  void validateForm(String quality, List<String> types){
    if(quality.isEmpty){
      isQualityEmpty.value = true;
    }
    
    if(types.isEmpty){
      isTypesEmpty.value = true;
    }
  }
}