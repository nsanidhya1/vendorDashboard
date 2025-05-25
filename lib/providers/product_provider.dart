import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/mock_api_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  String _searchQuery = '';
  String _selectedCategory = 'All';

  List<Product> get products {
    var filteredProducts =
        _products.where((product) {
          final matchesSearch = product.title.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          );
          final matchesCategory =
              _selectedCategory == 'All' ||
              product.category == _selectedCategory;
          return matchesSearch && matchesCategory;
        }).toList();

    return filteredProducts;
  }

  bool get isLoading => _isLoading;
  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;

  List<String> get categories {
    var cats = ['All'];
    cats.addAll(_products.map((p) => p.category).toSet().toList());
    return cats;
  }

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await MockApiService.getProducts();

      // Debug prints - Add these lines
      print('Total products loaded: ${_products.length}');
      for (var product in _products) {
        print('Product: ${product.title}');
        print('  Category: ${product.category}');
        print('  Price: ${product.price}');
        print('  Number of Bids: ${product.numberOfBids}');
        print('  Number of Views: ${product.numberOfViews}');
        print('  Highest Bid: ${product.highestBid}');
        print('  Days Since Listed: ${product.daysSinceListed}');
        print('---');
      }
    } catch (e) {
      // Handle error
      print('Error loading products: $e'); // Add this debug line
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addProduct(Product product) async {
    _isLoading = true;
    notifyListeners();

    try {
      final success = await MockApiService.addProduct(product);
      if (success) {
        _products.add(product);
      }
      _isLoading = false;
      notifyListeners();
      return success;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void updateSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
