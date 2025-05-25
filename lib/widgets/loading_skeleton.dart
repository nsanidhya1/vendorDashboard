import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/app_theme.dart';

class LoadingSkeleton extends StatelessWidget {
  final double height;
  final double? width;
  final BorderRadius? borderRadius;

  const LoadingSkeleton({
    Key? key,
    required this.height,
    this.width,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: borderRadius ?? BorderRadius.circular(4),
      ),
      child: SpinKitPulse(color: Colors.grey[400]!, size: height * 0.3),
    );
  }
}

class ProductCardSkeleton extends StatelessWidget {
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
                LoadingSkeleton(
                  height: 60,
                  width: 60,
                  borderRadius: BorderRadius.circular(8),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoadingSkeleton(height: 16, width: double.infinity),
                      const SizedBox(height: 4),
                      LoadingSkeleton(height: 12, width: 80),
                      const SizedBox(height: 4),
                      LoadingSkeleton(height: 14, width: 60),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                LoadingSkeleton(height: 24, width: 80),
                const SizedBox(width: 8),
                LoadingSkeleton(height: 24, width: 90),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                LoadingSkeleton(height: 24, width: 100),
                const SizedBox(width: 8),
                LoadingSkeleton(height: 24, width: 110),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
