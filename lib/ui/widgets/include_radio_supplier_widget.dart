import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_functions_simcards/common/global_config.dart';

import '../../models/task_model.dart';

class IncludeRadioSupplierWidget extends StatelessWidget {
  final String value;
  final String? groupValue;
  final Function(String)? onChanged;
  String? selectedValue;
  final String label;

  IncludeRadioSupplierWidget(
      {super.key,
      required this.value,
      this.groupValue,
      this.onChanged,
      required this.label});

  @override
  Widget build(BuildContext context) {
    final task = TaskModel();
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: (value) {
            task.idSupplier = value;
            selectedValue = value;
            onChanged!(value!);
          },
        ),
        Text(label),
        GlobalConfig.formHorizontalSpace20
      ],
    );
  }
}
