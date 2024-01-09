import 'package:flutter/material.dart';
import 'package:mobimap/app/data/model/types_of_accessibility.dart';

class MyChipList extends StatefulWidget {
  const MyChipList({
    super.key,
    required this.selectedTypesOfAccessibility,
  });

  final List<String> selectedTypesOfAccessibility;

  @override
  State<MyChipList> createState() => _MyChipListState();
}

class _MyChipListState extends State<MyChipList> {

  List<String> typesOfAccessibility = TypesOfAccessibility.types;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.tertiaryContainer),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Selecione os tipos de pontos: '),
          const SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            spacing: 5,
            children: typesOfAccessibility
                .map((type) => FilterChip(
                    label: Text(type),
                    selected: widget.selectedTypesOfAccessibility.contains(type),
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          widget.selectedTypesOfAccessibility.add(type);
                        });
                      } else {
                        setState(() {
                          widget.selectedTypesOfAccessibility.remove(type);
                        });
                      }
                    }))
                .toList(),
          )
        ]),
      ),
    );
  }
}
