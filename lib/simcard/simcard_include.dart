import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:menu_functions_simcards/api/api_client.dart';
import 'package:menu_functions_simcards/common/global_config.dart';
import 'package:menu_functions_simcards/common/simcard_focusnode.dart';
import 'package:menu_functions_simcards/common/tabbar_back.dart';
import 'package:menu_functions_simcards/kdl_controller.dart';
import 'package:menu_functions_simcards/models/task_model.dart';

import './widgets/widgets.dart';

import '../api/table_controller.dart';
import '../ui/pages/include/atoms/drop_down_atom.dart';

class SimcardInclude extends StatefulWidget {
  final OnOutput onOutput;
  final VoidCallback onBack;
  final TaskModel taskModel;
  final EdgeInsets padding;
  final KdlController controller;
  final VoidCallback onExecute;

  const SimcardInclude({
    super.key,
    required this.onExecute,
    required this.onOutput,
    required this.onBack,
    required this.taskModel,
    required this.controller,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  });

  @override
  State<SimcardInclude> createState() => _SimcardIncludeState();
}

class _SimcardIncludeState extends State<SimcardInclude> {
  String? selectedValue;
  String? plan;
  String? slot;
  String? apn;
  String? supplierType;
  final controller = KdlController();
  final RegExp dateRegex = RegExp(r'^\d{2}/\d{2}/\d{4}$');
  String selectedCostumer = costumerList[1];
  String? costumer = '';
  bool isInListIccid = false;
  bool isInListSimcon = false;
  bool isInListMsisdn = false;

  void IsInListIccid(bool newValue) {
    isInListIccid = newValue;
  }

  void IsInListSimcon(bool newValue) {
    isInListSimcon = newValue;
  }

  void IsInListMsisdn(bool newValue) {
    isInListMsisdn = newValue;
  }

  String formatDate(String inputDate) {
    final inputFormat = DateFormat('dd/MM/yyyy');
    final outputFormat = DateFormat('yyyy-MM-dd');
    final date = inputFormat.parse(inputDate);
    return outputFormat.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            TabBarBack(onBack: widget.onBack, title: "INCLUIR / SIMCARD"),
            Positioned(
              top: 45,
              bottom: 0,
              left: 0,
              right: 0,
              child: FutureBuilder(
                future: widget.controller.loadListSimucDropDown(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return ListView(
                      children: [
                        Padding(
                          padding: widget.padding,
                          child: Form(
                            key: GlobalConfig.formKey,
                            child: Column(
                              children: [
                                DropDownAtom(
                                  onChanged: (value) {
                                    selectedCostumer = value!;
                                  },
                                ),
                                GlobalConfig.formVerticalSpace,
                                IccidTextForm(
                                  controller: controller.idSimcardController,
                                  callback: IsInListIccid,
                                  taskModel: widget.taskModel,
                                  validator: (value) {
                                    if (isInListIccid == true) {
                                      return "Número do ICCID já cadastrado!";
                                    }
                                    if (value!.isEmpty) {
                                      return "Número do SIMCON obrigatório";
                                    }
                                    return null;
                                  },
                                ),
                                GlobalConfig.formVerticalSpace,
                                MsisdnTextForm(
                                  callback: IsInListMsisdn,
                                  controller: controller.idLineController,
                                  taskModel: widget.taskModel,
                                  validator: (value) {
                                    if (isInListMsisdn == true) {
                                      return "Número do MSISDN já cadastrado!";
                                    }
                                    if (value!.isEmpty) {
                                      return "Número do MSISDN obrigatório";
                                    }
                                    return null;
                                  },
                                ),
                                GlobalConfig.formVerticalSpace,
                                IpTextForm(
                                    controller: controller.idIpController,
                                    taskModel: widget.taskModel),
                                GlobalConfig.formVerticalSpace,
                                Row(children: [
                                  DateTextForm(
                                    controller: controller.idDateActiController,
                                    labelText: 'Data Ativação',
                                  ),
                                  GlobalConfig.formHorizontalSpace20,
                                  DateTextForm(
                                    controller:
                                        controller.idDateInstaController,
                                    labelText: 'Data Instalação',
                                  ),
                                ]),
                                GlobalConfig.formVerticalSpace,
                                SimcardSupplier(
                                  selectedValue: selectedValue,
                                  taskModel: widget.taskModel,
                                  onChanged: (value) {
                                    selectedValue = value;
                                    if (selectedValue == "NLT") {
                                      slot = "1";
                                      supplierType = "VIVO";
                                      apn = "datelo.nlt.br";
                                    } else if (selectedValue == "ARQIA") {
                                      slot = "2";
                                      supplierType = "TIM";
                                      apn = "kdl.br";
                                    } else {
                                      slot = "2";
                                      supplierType = "CLARO";
                                      apn = "lira.br";
                                    }
                                  },
                                  onChanged2: (value) {
                                    plan = value;
                                  },
                                  onChanged3: (value) {
                                    slot = value;
                                  },
                                ),
                                GlobalConfig.formVerticalSpace,
                                SimconTextForm(
                                  controller: controller.idSimconController,
                                  callback: IsInListSimcon,
                                  taskModel: widget.taskModel,
                                  validator: (value) {
                                    if (isInListSimcon == true) {
                                      return "Número do SIMCON já cadastrado!";
                                    }
                                    if (value!.isEmpty) {
                                      return "Número do SIMCON obrigatório";
                                    }
                                    return null;
                                  },
                                ),
                                GlobalConfig.formVerticalSpace,
                                NfSimconInput(
                                  taskModel: widget.taskModel,
                                  controller: controller.nfSimconController,
                                ),
                                GlobalConfig.formVerticalSpace,
                                Row(
                                  children: [
                                    DateTextForm(
                                      controller: controller.idDateExpedition,
                                      labelText: 'Data de Expedição',
                                    ),
                                  ],
                                ),
                                GlobalConfig.formVerticalSpace,
                                TextFormField(
                                  maxLines: 2,
                                  controller:
                                      controller.idObservationController,
                                  decoration: const InputDecoration(
                                    label: Text('Observações'),
                                    contentPadding: EdgeInsets.only(
                                        top: 20,
                                        left: 15,
                                        right: 15,
                                        bottom: 15),
                                  ),
                                  onChanged: (value) =>
                                      widget.taskModel.idObservations = value,
                                ),
                                GlobalConfig.formVerticalSpace,
                                SizedBox(
                                  width: double.infinity,
                                  height: 40,
                                  child: TextButton(
                                    onPressed: () async {
                                      if (GlobalConfig.formKey.currentState!
                                          .validate()) {
                                        GlobalConfig.formKey.currentState!
                                            .save();

                                        widget.onOutput(widget.taskModel);

                                        final formattedExpeditionDate =
                                            formatDate(controller
                                                .idDateExpedition.text);

                                        final formattedActivationDate =
                                            formatDate(controller
                                                .idDateActiController.text);
                                        final formattedInstallationDate =
                                            formatDate(controller
                                                .idDateInstaController.text);

                                        final task = TaskModel(
                                          idCostumer: selectedCostumer,
                                          idSimcard: controller
                                              .idSimcardController.text,
                                          idSimcon: controller
                                              .idSimconController.text,
                                          nfSimcon: controller
                                              .nfSimconController.text,
                                          idLine:
                                              controller.idLineController.text,
                                          idIP: controller.idIpController.text,
                                          supplierType: supplierType,
                                          idSlot: slot,
                                          idPlan: plan,
                                          idSupplier: selectedValue,
                                          idObservations: controller
                                              .idObservationController.text,
                                          idDateExpe: formattedExpeditionDate,
                                          idDateActi: formattedActivationDate,
                                          idDateinsta:
                                              formattedInstallationDate,
                                          idApn: apn,
                                        );

                                        await DataRecordSimcard.recordSimcard(
                                            context, task);

                                        GlobalConfig.formKey.currentState!
                                            .reset();
                                        controller.idSimcardController.clear();
                                        controller.idSimconController.clear();
                                        controller.idLineController.clear();
                                        controller.idIpController.clear();
                                        final callFunctionTable =
                                            Provider.of<TableController>(
                                                context,
                                                listen: false);
                                        callFunctionTable.fetch();
                                        widget.onExecute();
                                      }
                                    },
                                    child: Text("Confirmar"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        backgroundColor: Colors.black12,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
