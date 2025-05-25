import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../../providers/product_provider.dart';
import '../../utils/app_theme.dart';

class InsightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search and filter section
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            children: [
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return TextField(
                    onChanged: productProvider.updateSearchQuery,
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              Consumer<ProductProvider>(
                builder: (context, productProvider, child) {
                  return Row(
                    children: [
                      Text(
                        'Category: ',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          value: productProvider.selectedCategory,
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              productProvider.updateSelectedCategory(newValue);
                            }
                          },
                          items:
                              productProvider.categories
                                  .map<DropdownMenuItem<String>>((
                                    String value,
                                  ) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  })
                                  .toList(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),

        // Products list
        Expanded(
          child: Consumer<ProductProvider>(
            builder: (context, productProvider, child) {
              if (productProvider.isLoading) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: AppTheme.primaryColor,
                    size: 50,
                  ),
                );
              }

              final products = productProvider.products;

              if (products.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.inventory_2_outlined,
                        size: 64,
                        color: AppTheme.subtitleColor,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No products found',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppTheme.subtitleColor,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return RefreshIndicator(
                onRefresh: () async {
                  await productProvider.loadProducts();
                },
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return _ProductInsightCard(product: products[index]);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ProductInsightCard extends StatelessWidget {
  final Product product;

  const _ProductInsightCard({Key? key, required this.product})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getCategoryIcon(product.category),
                    color: AppTheme.primaryColor,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textColor,
                        ),
                      ),
                      Text(
                        product.category,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.subtitleColor,
                        ),
                      ),
                      Text(
                        '\${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Stats row
            Row(
              children: [
                _StatChip(
                  icon: Icons.gavel,
                  label: '${product.numberOfBids} bids',
                  color: Colors.blue,
                ),
                const SizedBox(width: 8),
                _StatChip(
                  icon: Icons.visibility,
                  label: '${product.numberOfViews} views',
                  color: Colors.green,
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                _StatChip(
                  icon: Icons.trending_up,
                  label: '\${product.highestBid.toStringAsFixed(2)} highest',
                  color: Colors.orange,
                ),
                const SizedBox(width: 8),
                _StatChip(
                  icon: Icons.schedule,
                  label: '${product.daysSinceListed} days listed',
                  color: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'electronics':
        return Icons.devices;
      case 'furniture':
        return Icons.chair;
      case 'clothing':
        return Icons.checkroom;
      case 'books':
        return Icons.book;
      case 'sports':
        return Icons.sports_basketball;
      default:
        return Icons.category;
    }
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _StatChip({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
