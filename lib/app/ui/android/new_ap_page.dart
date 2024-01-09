import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:mobimap/app/ui/widgets/android/my_chip_list.dart';
import 'package:mobimap/app/ui/widgets/android/my_material_field.dart';
import 'package:mobimap/app/ui/widgets/android/my_material_text_field.dart';
import 'package:mobimap/app/ui/widgets/android/my_radio_button_group.dart';

class NewAPPage extends StatelessWidget {
  NewAPPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameAPController = TextEditingController();
  final selectedTypesOfAccessibility = <String>[];
  String selectedQualityOfAccessibility = "";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );

    void onSelectedQuality(String quality) {
      selectedQualityOfAccessibility = quality;
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
        onPressed: () {
          _formKey.currentState!.validate();
          print(selectedTypesOfAccessibility);
          print(selectedQualityOfAccessibility);
        },
        child: const Icon(FontAwesomeIcons.check),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyMaterialTextField(
                formKey: _formKey,
                nameAPController: _nameAPController,
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
                selectedTypesOfAccessibility: selectedTypesOfAccessibility,
              ),
              const SizedBox(height: 15),
              MyRadioButtonGroup(
                onSelectedQuality: onSelectedQuality,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
