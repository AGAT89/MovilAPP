class Product {
  final String id;
  final String slug;
  final String name;
  final String description;
  final double price;
  final int stock;
  int quantity;

  Product({
    required this.id,
    required this.slug,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    this.quantity = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      slug: json['slug'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'],
      stock: json['stock'],
    );
  }
}
