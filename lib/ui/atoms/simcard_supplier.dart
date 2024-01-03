import 'package:flutter/material.dart';

import '../../common/global_config.dart';
import '../../models/task_model.dart';
import '../widgets/widgets.dart';

class SimcardSupplier extends StatefulWidget {
  String? selectedValue, selectedValue2;
  final Function(String)? onChanged;
  final TaskModel taskModel;

  SimcardSupplier({
    this.onChanged,
    required this.selectedValue,
    this.selectedValue2,
    required this.taskModel,
  });

  @override
  State<SimcardSupplier> createState() => _SimcardSupplierState();
}

class _SimcardSupplierState extends State<SimcardSupplier> {
  String? plan;
  String? slot;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IncludeRadioSupplierWidget(
              value: 'NLT',
              label: "NLT",
              groupValue: widget.selectedValue,
              onChanged: (value) {
                setState(() {
                  widget.taskModel.idSupplier = value;
                  widget.selectedValue = value;
                  widget.onChanged!(value!);
                });
              },
            ),
            IncludeRadioSupplierWidget(
              value: 'ARQIA',
              label: "ARQIA",
              groupValue: widget.selectedValue,
              onChanged: (value) {
                setState(() {
                  widget.taskModel.idSupplier = value;
                  widget.selectedValue = value;
                  widget.onChanged!(value!);
                });
              },
            ),
            IncludeRadioSupplierWidget(
              value: 'LIRA',
              label: "LIRA",
              groupValue: widget.selectedValue,
              onChanged: (value) {
                setState(() {
                  widget.taskModel.idSupplier = value;
                  widget.selectedValue = value;
                  widget.onChanged!(value!);
                });
              },
            ),
          ],
        ),
        GlobalConfig.formVerticalSpace,
        if (widget.selectedValue != null && widget.selectedValue == "NLT")
          IncludeDropSupplierAtom(
            items: NltPlan.map((plan) {
              return DropdownMenuItem<String>(
                value: plan,
                child: Text(plan),
              );
            }).toList(),
            taskModel: widget.taskModel,
          ),
        GlobalConfig.formHorizontalSpace,
        if (widget.selectedValue != null && widget.selectedValue == "ARQIA")
          IncludeDropSupplierAtom(
            items: ArqiaPlan.map((plan) {
              return DropdownMenuItem<String>(
                value: plan,
                child: Text(plan),
              );
            }).toList(),
            taskModel: widget.taskModel,
          ),
        if (widget.selectedValue != null && widget.selectedValue == "LIRA")
          Column(
            children: [
              Text('Selecione o Slot'),
              GlobalConfig.formVerticalSpace10,
              Row(
                children: [
                  Radio(
                    value: "1",
                    groupValue: widget.selectedValue2,
                    onChanged: (value) {
                      setState(() {
                        widget.taskModel.idSlot = value;
                        widget.selectedValue2 = value;
                        widget.onChanged!(value!);
                      });
                    },
                  ),
                  Text("Slot 1"),
                  GlobalConfig.formHorizontalSpace,
                  Radio(
                    value: "2",
                    groupValue: widget.selectedValue2,
                    onChanged: (value) {
                      setState(() {
                        widget.taskModel.idSlot = value;
                        widget.selectedValue2 = value;
                        widget.onChanged!(value!);
                      });
                    },
                  ),
                  Text("Slot 2"),
                ],
              ),
              GlobalConfig.formVerticalSpace10,
              IncludeDropSupplierAtom(
                  items: ArqiaPlan.map((plan) {
                    return DropdownMenuItem<String>(
                      value: plan,
                      child: Text(plan),
                    );
                  }).toList(),
                  taskModel: widget.taskModel),
            ],
          ),
      ],
    );
  }
}

// IncludeRadioSupplierWidget(
//   value: 'NLT',
//   groupValue: widget.selectedValue,
//   onChanged: (value) {
//     setState(() {
//       widget.taskModel.idSupplier = value;
//       widget.selectedValue = value;
//       widget.onChanged!(value!);
//     });
//   },
// ),
// const Text("NLT"),
// GlobalConfig.formHorizontalSpace,
// IncludeRadioSupplierWidget(
//   value: "ARQIA",
//   groupValue: widget.selectedValue2,
//   taskModel: widget.taskModel,
// ),
// const Text("ARQIA"),
// GlobalConfig.formHorizontalSpace,
// IncludeRadioSupplierWidget(
//   value: "LIRA",
//   groupValue: widget.selectedValue3,
//   taskModel: widget.taskModel,
// ),
// const Text("LIRA"),
