import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobimap/app/data/model/quality_of_accessibility.dart';

class MyRadioButtonGroup extends StatefulWidget {
  const MyRadioButtonGroup({
    super.key,
    required this.onSelectedQuality,
  });

   final Function onSelectedQuality;

  @override
  State<MyRadioButtonGroup> createState() => _MyRadioButtonGroupState();
}

class _MyRadioButtonGroupState extends State<MyRadioButtonGroup> {
  List<String> qualityPoint = QualilityOfAccessibility.qualility;

  var selected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.tertiaryContainer),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Text("Selecione a qualidade do ponto:".tr),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: qualityPoint.map((quality) {
                return Row(
                  children: [
                    Radio<String>(
                      value: quality,
                      groupValue: selected,
                      onChanged: (value) {
                        setState(() {
                          selected = value!;
                          widget.onSelectedQuality(value);
                        });
                      },
                    ),
                    Text(quality)
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
