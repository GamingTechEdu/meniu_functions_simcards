import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/task_model.dart';

class IncludeRadioSupplierWidget extends StatelessWidget {
  final String value;
  final String? groupValue;
  final TaskModel taskModel;
  final Function(String)? onChanged;
  String? selectedValue;

  IncludeRadioSupplierWidget(
      {super.key,
      required this.value,
      this.groupValue,
      required this.taskModel,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Radio(
      value: value,
      groupValue: groupValue,
      onChanged: (value) {
        taskModel.idSupplier = value;
        selectedValue = value;
        onChanged!(value!);
      },
    );
  }
}
