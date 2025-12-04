class Property {
  final String id;
  final String title;
  final double price;
  final String location;
  final int bedrooms;
  final int bathrooms;
  final double area;
  final String imageUrl;
  final String description;
  final bool isFeatured;

  Property({
    required this.id,
    required this.title,
    required this.price,
    required this.location,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.imageUrl,
    required this.description,
    this.isFeatured = false,
  });
}