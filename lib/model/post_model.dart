class ProductsResponse {
  List<Product> products;

  ProductsResponse({required this.products});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      products: List<Product>.from(
        json['products'].map((x) => Product.fromJson(x)),
      ),
    );
  }
}

class Product {
  int id;
  String title;
  String description;
  double price;
  String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      thumbnail: json['thumbnail'],
    );
  }
}