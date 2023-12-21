import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../include_presenter.dart';

class InputIccidAtom extends StatelessWidget {
  const InputIccidAtom({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<IncludePresenter?>(context);
    return StreamBuilder<String?>(
      stream: presenter?.usernameErrorStream,
      builder: (context, snapshot) {
        return TextFormField(
          decoration: const InputDecoration(
            labelText: "Simcard(ICCID)",
          ),
        );
      },
    );
  }
}
