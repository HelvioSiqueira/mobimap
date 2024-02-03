import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobimap/app/data/providers/firebase_database_manager.dart';
import 'package:mobimap/app/ui/widgets/android/my_chip_list.dart';
import 'package:mobimap/app/ui/widgets/android/my_material_field.dart';
import 'package:mobimap/app/ui/widgets/android/my_material_text_field.dart';
import 'package:mobimap/app/ui/widgets/android/my_radio_button_group.dart';
import 'package:mobimap/app/utils/fire_database_url.dart';

import '../../controllers/new_ap_controller.dart';

class NewAPPage extends GetView<NewAPController> {
  NewAPPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  FirebaseDatabaseManager firebaseDatabaseManager = Get.find();

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

    return GetX<NewAPController>(builder: (controller) {
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
          onPressed: () async {
            controller.validateForm(
              _selectedQualityOfAccessibility,
              _selectedTypesOfAccessibility,
            );

            if (_formKey.currentState!.validate() &&
                _selectedQualityOfAccessibility.isNotEmpty &&
                _selectedTypesOfAccessibility.isNotEmpty) {
              var ref = firebaseDatabaseManager.databaseRef
                  .refFromURL(FireDatabaseUrl.AC);

              await ref.push().set({
                'ap_name': _nameAPController.text,
                'ap_types': {
                  'Rampa': _selectedTypesOfAccessibility.contains('Rampa'),
                  'Banheiro': _selectedTypesOfAccessibility.contains('Banheiro'),
                  'Corrimao': _selectedTypesOfAccessibility.contains('Corrimão'),
                  'Trilhas': _selectedTypesOfAccessibility.contains('Trilhas'),
                  'Porta': _selectedTypesOfAccessibility.contains('Porta')
                },
                'ap_quality': _selectedQualityOfAccessibility,
                'comment': _commentAPController.text
              });

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "Ponto de acessibilidade adicionado com sucesso".tr)));

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
                  const MyMaterialField(
                    hintText: '2652 Macedo Rodovia - Buriti, AM / 05880-245',
                    prefixIcon: Icon(Icons.location_on),
                  ),
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
