import 'package:flutter/material.dart';

import '../../common/global_config.dart';
import '../../models/task_model.dart';

class SimcardSupplier extends StatefulWidget {
  String? selectedValue, selectedValue2;
  final Function(String)? onChanged, onChanged2, onChanged3;
  final TaskModel taskModel;

  SimcardSupplier({
    this.onChanged,
    this.onChanged2,
    this.onChanged3,
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
            Radio(
              value: 'NLT',
              groupValue: widget.selectedValue,
              onChanged: (value) {
                setState(() {
                  widget.taskModel.idSupplier = value;
                  widget.selectedValue = value;
                  widget.onChanged!(value!);
                });
              },
            ),
            Text("NLT"),
            GlobalConfig.formHorizontalSpace,
            Radio(
              value: "ARQIA",
              groupValue: widget.selectedValue,
              onChanged: (value) {
                setState(() {
                  widget.taskModel.idSupplier = value;
                  widget.selectedValue = value;
                  widget.onChanged!(value!);
                });
              },
            ),
            Text("ARQIA"),
            GlobalConfig.formHorizontalSpace,
            Radio(
              value: "LIRA",
              groupValue: widget.selectedValue,
              onChanged: (value) {
                setState(() {
                  widget.taskModel.idSupplier = value;
                  widget.selectedValue = value;
                  widget.onChanged!(value!);
                });
              },
            ),
            Text("LIRA"),
          ],
        ),
        GlobalConfig.formVerticalSpace,
        if (widget.selectedValue != null && widget.selectedValue == "NLT")
          DropdownButtonFormField(
            elevation: 1,
            isDense: true,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            focusColor: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            hint: const Text("Selecione o Plano"),
            items: NltPlan.map((plan) {
              return DropdownMenuItem<String>(
                value: plan,
                child: Text(plan),
              );
            }).toList(),
            onChanged: (value) {
              // selectedCostumer = value!;
              widget.taskModel.idPlan = value;
              plan = value;
              widget.onChanged2!(value!);
            },
          ),
        GlobalConfig.formHorizontalSpace,
        if (widget.selectedValue != null && widget.selectedValue == "ARQIA")
          DropdownButtonFormField(
            elevation: 1,
            isDense: true,
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down_outlined),
            borderRadius: BorderRadius.circular(5),
            focusColor: Colors.transparent,
            hint: const Text("Selecione o Plano"),
            items: ArqiaPlan.map((plan) {
              return DropdownMenuItem<String>(
                value: plan,
                child: Text(plan),
              );
            }).toList(),
            onChanged: (value) {
              widget.taskModel.idPlan = value;
              plan = value;
              print(widget.onChanged2!(value!));
              widget.onChanged2!(value!);
            },
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
                    groupValue: widget.selectedValue,
                    onChanged: (value) {
                      setState(() {
                        //   widget.taskModel.idSupplier = value;
                        widget.selectedValue2 = value;
                        widget.onChanged3!(value!);
                      });
                    },
                  ),
                  Text("Slot 1"),
                  GlobalConfig.formHorizontalSpace,
                  Radio(
                    value: "2",
                    groupValue: widget.selectedValue,
                    onChanged: (value) {
                      // setState(() {
                      //   widget.taskModel.idSupplier = value;
                      //   widget.selectedValue = value;
                      //   widget.onChanged!(value!);
                      // });
                    },
                  ),
                  Text("Slot 2"),
                ],
              ),
              GlobalConfig.formVerticalSpace10,
              DropdownButtonFormField(
                elevation: 1,
                isDense: true,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                borderRadius: BorderRadius.circular(5),
                focusColor: Colors.transparent,
                hint: const Text("Selecione o Plano"),
                items: ArqiaPlan.map((plan) {
                  return DropdownMenuItem<String>(
                    value: plan,
                    child: Text(plan),
                  );
                }).toList(),
                onChanged: (value) {
                  widget.taskModel.idPlan = value;
                  plan = value;
                  print(widget.onChanged2!(value!));
                  widget.onChanged2!(value!);
                },
              ),
            ],
          ),
      ],
    );
  }
}
