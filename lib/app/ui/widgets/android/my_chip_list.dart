import 'package:flutter/material.dart';

class MyChipList extends StatefulWidget {
  const MyChipList({
    super.key,
    required this.typesOfAccessibility,
  });

  final List<String> typesOfAccessibility;

  @override
  State<MyChipList> createState() => _MyChipListState();
}

class _MyChipListState extends State<MyChipList> {
  List<String> selecioned = [];

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
          const Text('Selecione os pontos de acessibilidade: '),
          const SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            spacing: 5,
            children: widget.typesOfAccessibility
                .map((type) => FilterChip(
                    label: Text(type),
                    selected: selecioned.contains(type),
                    onSelected: (selected) {
                      if (selected) {
                        setState(() {
                          selecioned.add(type);
                        });
                      } else {
                        setState(() {
                          selecioned.remove(type);
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
