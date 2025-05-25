class AppConstants {
  static const String appName = 'BID.ai Vendor Dashboard';
  static const String baseUrl =
      'https://api.bid.ai'; // For future real API integration

  // Local storage keys
  static const String vendorEmailKey = 'vendor_email';
  static const String authTokenKey = 'auth_token';

  // Mock data constants
  static const Map<String, String> mockCredentials = {
    'vendor@bid.ai': 'password123',
    'john.doe@bid.ai': 'password456',
  };

  static const List<String> productCategories = [
    'Electronics',
    'Furniture',
    'Clothing',
    'Books',
    'Sports',
    'Automotive',
    'Home & Garden',
    'Other',
  ];

  static const List<String> productConditions = [
    'New',
    'Like New',
    'Good',
    'Fair',
    'Poor',
  ];
}
