import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_functions_simcards/common/simcard_focusnode.dart';

import '../../models/task_model.dart';

class NfSimconInput extends StatefulWidget {
  final TextEditingController controller;
  final TaskModel taskModel;
  // final Function(bool) callback;
  // String? Function(String?)? validator;

  NfSimconInput({
    super.key,
    // required this.validator,
    // required this.callback,
    required this.controller,
    required this.taskModel,
  });

  @override
  _NfSimconInputState createState() => _NfSimconInputState();
}

class _NfSimconInputState extends State<NfSimconInput> {
  String _inputNumber = "";
  bool _isLoading = false;
  bool _isInList = false;
  List<String> _numberList = [];

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: FocusNodes.nfSimconFocusNode,
      decoration: const InputDecoration(
        labelText: "Nota Fiscal SIMCON",
      ),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(7),
      ],
      // validator: widget.validator,
      onChanged: (value) {
        setState(() {
          if (value.length == 7) {
            FocusNodes.nfSimconFocusNode.unfocus();
            FocusScope.of(context).requestFocus(FocusNodes.linhaFocusNode);
          }
        });
      },
      onSaved: (value) {
        if (value!.isNotEmpty) {
          widget.taskModel.nfSimcon = value;
        }
      },
    );
  }
}
