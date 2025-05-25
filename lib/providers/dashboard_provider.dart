import 'package:flutter/material.dart';

import '../models/dashboard_stats.dart';
import '../services/mock_api_service.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardStats? _stats;
  bool _isLoading = false;

  DashboardStats? get stats => _stats;
  bool get isLoading => _isLoading;

  Future<void> loadDashboardStats() async {
    _isLoading = true;
    notifyListeners();

    try {
      _stats = await MockApiService.getDashboardStats();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
