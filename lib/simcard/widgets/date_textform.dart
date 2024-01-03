import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_side_menu/src/kdl_menu_simcards/common/simcard_focusnode.dart';

class DateTextForm extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final Function(String)? onChanged;

  const DateTextForm({
    Key? key,
    this.onChanged,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  @override
  _DateTextFormState createState() => _DateTextFormState();
}

class _DateTextFormState extends State<DateTextForm> {
  final RegExp dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      cancelText: 'Cancelar',
      confirmText: 'Confirmar',
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      String formattedDate = "${pickedDate.day.toString().padLeft(2, '0')}/"
          "${pickedDate.month.toString().padLeft(2, '0')}/"
          "${pickedDate.year.toString()}";
      widget.controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            RegExp(r'[0-9/]'),
          ),
          LengthLimitingTextInputFormatter(10),
        ],
        validator: (value) {
          if (!dateRegex.hasMatch(value!)) {
            return 'Formato Inválido\nUse dd/mm/aaaa';
          }
          return null;
        },
        // onChanged: (value){
        //   widget.onChanged!(value);
        // },
        controller: widget.controller,
        readOnly: true,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ),
      ),
    );
  }
}
