class Product {
  final String id;
  final String title;
  final String category;
  final double price;
  final String condition;
  final String description;
  final String? imageUrl;
  final int numberOfBids;
  final double highestBid;
  final int numberOfViews;
  final DateTime listedDate;

  Product({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.condition,
    required this.description,
    this.imageUrl,
    required this.numberOfBids,
    required this.highestBid,
    required this.numberOfViews,
    required this.listedDate,
  });

  int get daysSinceListed {
    return DateTime.now().difference(listedDate).inDays;
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      price: json['price'].toDouble(),
      condition: json['condition'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      numberOfBids: json['numberOfBids'],
      highestBid: json['highestBid'].toDouble(),
      numberOfViews: json['numberOfViews'],
      listedDate: DateTime.parse(json['listedDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'price': price,
      'condition': condition,
      'description': description,
      'imageUrl': imageUrl,
      'numberOfBids': numberOfBids,
      'highestBid': highestBid,
      'numberOfViews': numberOfViews,
      'listedDate': listedDate.toIso8601String(),
    };
  }
}
