import 'package:flutter/material.dart';

import '../../models/task_model.dart';

class IncludeDropSupplierAtom extends StatelessWidget {
  final TaskModel taskModel;
  final List<DropdownMenuItem>? items;
  final Function(String)? onChanged;
  const IncludeDropSupplierAtom({
    super.key,
    required this.items,
    required this.taskModel,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    String? plan;

    return DropdownButtonFormField(
      key: key,
      elevation: 1,
      isDense: true,
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
      borderRadius: BorderRadius.circular(5),
      focusColor: Colors.transparent,
      hint: const Text("Selecione o Plano"),
      items: items,
      onChanged: (value) {
        taskModel.idPlan = value;
        plan = value;
        print(onChanged!(value!));
        onChanged!(value!);
      },
    );
  }
}
