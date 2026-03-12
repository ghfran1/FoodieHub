class Meal {
  final String name;
  final String restaurant;
  final String price;
  final String image;
  final double rating;
  final String reviews;

  Meal({
    required this.name,
    required this.restaurant,
    required this.price,
    required this.image,
    this.rating = 5.0,
    this.reviews = "100+",
  });

 
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'restaurant': restaurant,
      'price': price,
      'image': image,
      'rating': rating,
      'reviews': reviews,
    };
  }

 
  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      name: map['name'],
      restaurant: map['restaurant'],
      price: map['price'],
      image: map['image'],
      rating: map['rating'] ?? 0.0,
      reviews: map['reviews'] ?? '0',
    );
  }
}