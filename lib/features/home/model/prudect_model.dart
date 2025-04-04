class ProductModel {
  final String description;
  final String id;
  final String name;
  final String image;
  final double price;

  ProductModel({
    required this.description,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: double.parse(json['price'].toString()),
    );
  }
}
