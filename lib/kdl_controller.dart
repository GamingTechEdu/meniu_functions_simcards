import 'package:flutter/material.dart';
import 'package:menu_functions_simcards/common/label_value.dart';

class KdlController {
  Future<List<LabelValue>> loadListSimucDropDown() async {
    print("KdlController-->loadListSimucDropDown");
    await Future.delayed(const Duration(seconds: 1));
    return [
      LabelValue<String>(label: "1234567890", value: "1234567890"),
      LabelValue<String>(label: "1234564569", value: "1234564569"),
      LabelValue<String>(label: "1234567896", value: "1234567896"),
      LabelValue<String>(label: "1234561236", value: "1234561236"),
      LabelValue<String>(label: "1234561237", value: "1234561237"),
      LabelValue<String>(label: "1234561238", value: "1234561238"),
      LabelValue<String>(label: "1234561285", value: "1234561285"),
    ];
  }

  final TextEditingController idSimcardController =
      TextEditingController(text: "22222222222222222222");
  final TextEditingController idSimconController =
      TextEditingController(text: "2222222");
  final TextEditingController nfSimconController =
      TextEditingController(text: "22222");
  final TextEditingController idLineController =
      TextEditingController(text: "2222222222222");
  final TextEditingController idIpController =
      TextEditingController(text: "222.222.222/12");
  final TextEditingController idDateActiController =
      TextEditingController(text: "20/12/1212");
  final TextEditingController idDateInstaController =
      TextEditingController(text: "20/12/1212");
  final TextEditingController idObservationController =
      TextEditingController(text: "ndfaskndaksnsakn");

  void dispose() {
    idSimcardController.dispose();
    idSimconController.dispose();
    idLineController.dispose();
    idIpController.dispose();
    idDateActiController.dispose();
    idDateInstaController.dispose();
    idObservationController.dispose();
  }
}
