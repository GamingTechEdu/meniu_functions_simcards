import 'package:flutter/material.dart';
import 'package:menu_functions_simcards/common/menu_button.dart';

class SimcardMenu extends StatelessWidget {
  final ValueChanged<MenuButtonType> onPressed;
  final EdgeInsets padding;

  const SimcardMenu({
    super.key,
    required this.onPressed,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MenuButton(
            label: 'Incluir SIMCARD',
            icon: 'include.svg',
            onPressed: () {
              onPressed(MenuButtonType.simcardInclude);
            },
          ),
          MenuButton(
            label: 'Incluir ESTOQUE',
            icon: 'include_batch.svg',
            onPressed: () {
              onPressed(MenuButtonType.simcardEdit);
            },
          ),
        ],
      ),
    );
  }
}
