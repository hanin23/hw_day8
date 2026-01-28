class ProductModel {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  String? thumbnail;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      category: json["category"],
      price: (json["price"] as num).toDouble(),
      thumbnail: json["thumbnail"],
    );
  }
}
