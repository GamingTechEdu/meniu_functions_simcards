import 'package:flutter/material.dart';

import '../../../widgets/drop_down_widget.dart';

class DropDownAtom extends StatelessWidget {
  final Function(String?)? onChanged;
  const DropDownAtom({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    List<String> costumerList = [
      'Selecione um Cliente',
      'ILUMINA SP',
      'GUARULHOS LUZ'
    ];

    String selectedCostumer = costumerList[0];

    return DropDownWidget(
      elevation: 1,
      isDense: true,
      isExpanded: false,
      icon: Icons.keyboard_arrow_down_outlined,
      focusColor: Colors.transparent,
      borderRadius: BorderRadius.circular(5),
      value: selectedCostumer,
      items: costumerList.map((costumer) {
        return DropdownMenuItem<String>(
          value: costumer,
          child: Text(costumer),
        );
      }).toList(),
      onChanged: onChanged,
      validator: (value) {
        if (value == 'Selecione um Cliente') {
          return 'Por favor, selecione um cliente';
        }
        return null;
      },
    );
  }
}
