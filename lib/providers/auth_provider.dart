import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/vendor.dart';
import '../services/mock_api_service.dart';

class AuthProvider extends ChangeNotifier {
  Vendor? _currentVendor;
  bool _isLoading = false;
  String? _errorMessage;

  Vendor? get currentVendor => _currentVendor;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _currentVendor != null;

  AuthProvider() {
    _loadSavedAuth();
  }

  Future<void> _loadSavedAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('vendor_email');
    if (savedEmail != null) {
      _currentVendor = await MockApiService.getVendorProfile(savedEmail);
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final success = await MockApiService.login(email, password);
      if (success) {
        _currentVendor = await MockApiService.getVendorProfile(email);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('vendor_email', email);
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Invalid email or password';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'Login failed. Please try again.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    _currentVendor = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('vendor_email');
    notifyListeners();
  }
}
