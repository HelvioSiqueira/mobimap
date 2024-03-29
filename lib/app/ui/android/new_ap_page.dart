import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobimap/app/data/model/accessibility_point.dart';
import 'package:mobimap/app/data/providers/firebase_database_manager_impl.dart';
import 'package:mobimap/app/ui/widgets/android/my_chip_list.dart';
import 'package:mobimap/app/ui/widgets/android/my_material_field.dart';
import 'package:mobimap/app/ui/widgets/android/my_material_text_field.dart';
import 'package:mobimap/app/ui/widgets/android/my_radio_button_group.dart';

import '../../controllers/new_ap_controller.dart';

class NewAPPage extends GetView<NewAPController> {
  NewAPPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirebaseDatabaseManagerImpl firebaseDatabaseManager = Get.find();

  final TextEditingController _nameAPController = TextEditingController();
  final _selectedTypesOfAccessibility = <String>[];
  String _selectedQualityOfAccessibility = "";
  final TextEditingController _commentAPController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.background,
      ),
    );

    User? user = Get.find();

    return GetX<NewAPController>(initState: (_) {
      controller.getAddressByLocation();
    }, builder: (controller) {
      void onSelectedQuality(String quality) {
        _selectedQualityOfAccessibility = quality;
        controller.isQualityEmpty.value = false;
      }

      void onSelectedType() {
        controller.isTypesEmpty.value = false;
        if (_selectedTypesOfAccessibility.isEmpty) {
          controller.isTypesEmpty.value = true;
        }
      }

      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text("Criar ponto de acessibilidade".tr),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.loadingAddress.value
              ? null
              : () async {
                  controller.validateForm(
                    _selectedQualityOfAccessibility,
                    _selectedTypesOfAccessibility,
                  );

                  if (_formKey.currentState!.validate() &&
                      _selectedQualityOfAccessibility.isNotEmpty &&
                      _selectedTypesOfAccessibility.isNotEmpty) {
                    var ap = AccessibilityPoint(
                        apName: _nameAPController.text,
                        apTypes: _selectedTypesOfAccessibility,
                        apQuality: _selectedQualityOfAccessibility,
                        comment: _commentAPController.text,
                        latitude: controller.location.latitude,
                        longitude: controller.location.longitude,
                        address: controller.placemark.value,
                        creator: user?.email);

                    controller.addAccessibilityPointToDatabase(ap);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Ponto de acessibilidade adicionado com sucesso"
                                .tr)));

                    Get.back();
                  }
                },
          child: const Icon(FontAwesomeIcons.check),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyMaterialTextField(
                    controller: _nameAPController,
                    maxLines: 1,
                    hintText: "Nome do ponto",
                    errorText: "O ponto precisa ter um nome",
                    maxLength: 50,
                    removeWhiteSpaces: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Theme.of(context).colorScheme.primaryContainer,
                              Theme.of(context).colorScheme.tertiaryContainer
                            ])),
                    child: Icon(
                      Icons.camera_alt,
                      size: 60,
                      color: Colors.black.withAlpha(70),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Obx(() {
                    if (controller.loadingAddress.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return MyMaterialField(
                      hintText: controller.placemark.value,
                      prefixIcon: const Icon(Icons.location_on),
                    );
                  }),
                  const SizedBox(height: 15),
                  MyChipList(
                    selectedTypesOfAccessibility: _selectedTypesOfAccessibility,
                    onSelectedTypeOfAccessibility: onSelectedType,
                    hasError: controller.isTypesEmpty.value,
                  ),
                  const SizedBox(height: 15),
                  MyRadioButtonGroup(
                    onSelectedQuality: onSelectedQuality,
                    hasError: controller.isQualityEmpty.value,
                  ),
                  const SizedBox(height: 15),
                  MyMaterialTextField(
                    controller: _commentAPController,
                    maxLines: 3,
                    hintText: "Comentario",
                    errorText: null,
                    maxLength: 200,
                    removeWhiteSpaces: false,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  )
                ],
              ),
            ),
          ),
        ),
      ));
    });
  }
}
