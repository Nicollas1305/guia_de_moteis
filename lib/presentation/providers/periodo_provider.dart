import 'package:flutter/material.dart';

import '../../models/period_model.dart';

class PeriodProvider with ChangeNotifier {
  List<Period> _periods = [];

  List<Period> get periods => _periods;

  void updatePeriods(List<Period> newPeriods) {
    _periods = newPeriods;
    notifyListeners();
  }
}
