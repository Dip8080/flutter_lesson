class PropertyModel {
  final String id;
  final String title;
  final String specs;
  final String price;
  final double rating;
  final int reviewsCount;
  final String imageUrl;

  const PropertyModel({
    required this.id,
    required this.title,
    required this.specs,
    required this.price,
    required this.rating,
    required this.reviewsCount,
    required this.imageUrl,
  });
}
