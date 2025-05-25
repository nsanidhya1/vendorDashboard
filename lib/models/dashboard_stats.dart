class DashboardStats {
  final int totalListings;
  final int listingsSold;
  final int activeDeals;
  final double earningsThisMonth;

  DashboardStats({
    required this.totalListings,
    required this.listingsSold,
    required this.activeDeals,
    required this.earningsThisMonth,
  });

  factory DashboardStats.fromJson(Map<String, dynamic> json) {
    return DashboardStats(
      totalListings: json['totalListings'],
      listingsSold: json['listingsSold'],
      activeDeals: json['activeDeals'],
      earningsThisMonth: json['earningsThisMonth'].toDouble(),
    );
  }
}
