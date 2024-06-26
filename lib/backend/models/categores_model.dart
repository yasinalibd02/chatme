class Product {
  final String category;
  final String name;
  final String details;
  final String imageUrl;
  final double price;
  bool isFavorite;
  Product(
      {required this.category,
      required this.name,
      required this.details,
      required this.imageUrl,
      required this.price,
      this.isFavorite=false,
      });
}
