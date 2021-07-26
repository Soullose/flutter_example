import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IndexPage with ChangeNotifier, DiagnosticableTreeMixin {
  int index = 0;

  int get getIndex => index;

  void setIndex(int i) {
    index = i;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('indexPage', index));
  }
}
