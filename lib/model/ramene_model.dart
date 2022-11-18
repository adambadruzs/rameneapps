class RameneModel {
  final String product_name, img_url, description;
  final int price;

  RameneModel({
    required this.product_name,
    required this.img_url,
    required this.description,
    required this.price,
  });

  factory RameneModel.fromJSON(Map parsedJson) {
    return RameneModel(
      product_name: parsedJson['product_name'],
      img_url: parsedJson['img_url'],
      description: parsedJson['description'],
      price: parsedJson['price'],
    );
  }
}
