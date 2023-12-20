import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final bool isDense;
  final String? value;
  final IconData? icon;
  final bool isExpanded;
  final int elevation;
  final Color? focusColor;
  final BorderRadius? borderRadius;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final List<DropdownMenuItem<String>>? items;

  const DropDownWidget({
    super.key,
    this.icon,
    this.items,
    this.value,
    this.onChanged,
    this.validator,
    this.focusColor,
    this.borderRadius,
    this.isDense = true,
    this.isExpanded = false,
    this.elevation = 8,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      elevation: elevation,
      isDense: isDense,
      isExpanded: isExpanded,
      focusColor: focusColor,
      borderRadius: borderRadius,
      icon: Icon(icon),
      value: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
