import 'dart:async';

import 'package:get/get.dart';

import '../ui/pages/include/include_presenter.dart';
import 'protocols/protocols.dart';

class GetxIncludePresenter extends GetxController implements IncludePresenter {
  final Validation validation;

  GetxIncludePresenter({required this.validation});

  String? _email;

  final _emailError = Rx<String?>(null);

  @override
  Stream<String?>? get usernameErrorStream => _emailError.stream;

  @override
  void validateUsername(String username) {
    _email = username;
    _emailError.value =
        validation.validate(field: 'Simcard(ICCID)', value: username);
  }
}
