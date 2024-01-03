// focus_nodes.dart

import 'package:flutter/widgets.dart';

class FocusNodes {
  static final iccidFocusNode = FocusNode();
  static final simconFocusNode = FocusNode();
  static final nfSimconFocusNode = FocusNode();
  static final linhaFocusNode = FocusNode();
  static final ipFocusNode = FocusNode();

  static void disposeAll() {
    iccidFocusNode.dispose();
    simconFocusNode.dispose();
    nfSimconFocusNode.dispose();
    linhaFocusNode.dispose();
    ipFocusNode.dispose();
  }
}
