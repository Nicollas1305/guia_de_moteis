import 'package:flutter/material.dart';
import '../../models/motel_model.dart';
import '../../services/motel_services.dart';

class MotelProvider with ChangeNotifier {
  final MotelService _motelService = MotelService();
  List<Motel> _motels = [];
  bool _isLoading = false;
  bool _isNowSelected = true;

  List<Motel> get moteis => _motels;
  bool get isLoading => _isLoading;
  bool get isNowSelected => _isNowSelected;

  Future<void> loadMotels() async {
    _isLoading = true;
    notifyListeners();

    try {
      _motels = await _motelService.fetchMoteis();
    } catch (e) {
      print('Erro ao carregar motéis: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleIsNowSelected() {
    _isNowSelected = !_isNowSelected;
    notifyListeners();
  }
}
