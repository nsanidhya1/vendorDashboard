import 'dart:async';
import 'dart:math';

import '../models/dashboard_stats.dart';
import '../models/product.dart';
import '../models/vendor.dart';

class MockApiService {
  static const Duration _mockDelay = Duration(milliseconds: 1500);

  // Mock user credentials
  static const Map<String, String> _mockCredentials = {
    'vendor@bid.ai': 'password123',
    'john.doe@bid.ai': 'password456',
  };

  // Mock vendor data
  static final Map<String, Vendor> _mockVendors = {
    'vendor@bid.ai': Vendor(
      id: '1',
      name: 'John Smith',
      email: 'vendor@bid.ai',
    ),
    'john.doe@bid.ai': Vendor(
      id: '2',
      name: 'John Doe',
      email: 'john.doe@bid.ai',
    ),
  };

  // Mock products data
  static List<Product> _mockProducts = [
    Product(
      id: '1',
      title: 'iPhone 14 Pro',
      category: 'Electronics',
      price: 999.99,
      condition: 'Like New',
      description: 'Barely used iPhone 14 Pro in excellent condition.',
      numberOfBids: 15,
      highestBid: 899.99,
      numberOfViews: 234,
      listedDate: DateTime.now().subtract(Duration(days: 5)),
    ),
    Product(
      id: '2',
      title: 'MacBook Air M2',
      category: 'Electronics',
      price: 1299.99,
      condition: 'Good',
      description: 'MacBook Air with M2 chip, 8GB RAM, 256GB SSD.',
      numberOfBids: 8,
      highestBid: 1150.00,
      numberOfViews: 156,
      listedDate: DateTime.now().subtract(Duration(days: 12)),
    ),
    Product(
      id: '3',
      title: 'Gaming Chair',
      category: 'Furniture',
      price: 299.99,
      condition: 'New',
      description: 'Ergonomic gaming chair with RGB lighting.',
      numberOfBids: 3,
      highestBid: 250.00,
      numberOfViews: 89,
      listedDate: DateTime.now().subtract(Duration(days: 3)),
    ),
  ];

  static Future<bool> login(String email, String password) async {
    await Future.delayed(_mockDelay);
    return _mockCredentials[email] == password;
  }

  static Future<Vendor?> getVendorProfile(String email) async {
    await Future.delayed(_mockDelay);
    return _mockVendors[email];
  }

  static Future<DashboardStats> getDashboardStats() async {
    await Future.delayed(_mockDelay);
    final random = Random();
    return DashboardStats(
      totalListings: 25 + random.nextInt(50),
      listingsSold: 12 + random.nextInt(20),
      activeDeals: 5 + random.nextInt(10),
      earningsThisMonth: 2500.0 + random.nextDouble() * 2000,
    );
  }

  static Future<List<Product>> getProducts() async {
    await Future.delayed(_mockDelay);
    return List.from(_mockProducts);
  }

  static Future<bool> addProduct(Product product) async {
    await Future.delayed(_mockDelay);
    _mockProducts.add(product);
    return true;
  }
}
