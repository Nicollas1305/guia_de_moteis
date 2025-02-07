import 'package:flutter/material.dart';
import '../../models/suite_model.dart';

class SuiteProvider with ChangeNotifier {
  List<Suite> _suites = [];

  List<Suite> get suites => _suites;

  void updateSuites(List<Suite> newSuites) {
    _suites = newSuites;
    notifyListeners();
  }
}
