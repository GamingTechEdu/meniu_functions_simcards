import 'package:flutter/material.dart';
import 'package:menu_functions_simcards/common/global_config.dart';
import 'package:menu_functions_simcards/common/menu_button.dart';
import 'package:menu_functions_simcards/kdl_controller.dart';
import 'package:menu_functions_simcards/models/task_model.dart';
import 'package:menu_functions_simcards/simcard/edit_simcard.dart';
import 'package:menu_functions_simcards/simcard/model.dart';
import 'package:menu_functions_simcards/simcard/simcard_include.dart';
import 'package:menu_functions_simcards/simcard/simcard_menu.dart';
import 'called_filter_tabs.dart';

class SimcardsManager extends StatefulWidget {
  final OnOutput onOutput;
  final EdgeInsets padding;
  final KdlController controller;

  const SimcardsManager({
    super.key,
    required this.onOutput,
    required this.controller,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  });

  @override
  State<SimcardsManager> createState() => _SimcardsManagerState();
}

class _SimcardsManagerState extends State<SimcardsManager> {
  MenuButtonType activeAction = MenuButtonType.simcardMenu;
  dynamic activeStatus = {'type': 'SIMCARD'};

  TaskModel? activeTaskModel;

  Widget buildView() {
    late Function result;

    switch (activeAction) {
      case MenuButtonType.simcardMenu:
        return SimcardMenu(
          onPressed: (value) {
            setState(() {
              activeAction = value;
              activeStatus = {'type': 'SIMCARD'};
            });
          },
        );

      case MenuButtonType.simcardInclude:
        return SimcardInclude(
          onExecute: () {
            setState(() {});
          },
          onOutput: widget.onOutput,
          controller: widget.controller,
          onBack: () {
            setState(() {
              activeAction = MenuButtonType.simcardMenu;
              activeStatus = {'type': 'SIMCARD'};
            });
          },
          taskModel: TaskModel(),
        );

      case MenuButtonType.simcardEdit:
        return SimcardEdit(
          onExecute: () {
            setState(() {});
          },
          onOutput: widget.onOutput,
          controller: widget.controller,
          onBack: () {
            setState(() {
              activeAction = MenuButtonType.simcardMenu;
              activeStatus = {'type': 'SIMCARD'};
            });
          },
          taskModel: TaskModel(),
          simCard: SimCardTeste(
            id: "1",
            name: "Teste",
            number: "123456789",
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // if (activeAction == MenuButtonType.simcardMenu)
        //   ToogleTabs(
        //       onTabSelect: (CalledFilterTabs value) {
        //         setState(() {
        //           final activeMenu = value.status["type"]!;
        //           if (activeMenu == "SIMCARD") {
        //             activeAction = MenuButtonType.simcardMenu;
        //           }
        //         });
        //       },
        //       activeStatus: activeStatus
        //   ),
        if (activeAction == MenuButtonType.simcardMenu)
          SimcardMenu(onPressed: (value) {
            setState(() {
              activeAction = value;
              print(activeAction);
            });
          }),
        if (activeAction != MenuButtonType.simcardMenu) buildView(),
      ],
    );
  }
}
