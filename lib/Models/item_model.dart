class ItemModel {
  final String name;
  final String category;
  final double price;
  final String month;
  final int id;
  ItemModel({
    required this.category,
    required this.month,
    required this.name,
    required this.price,
    required this.id,
  });
  factory ItemModel.fromJson(Map<dynamic, dynamic> json) {
    return ItemModel(
      category: json['category'],
      month: json['month'],
      name: json['name'],
      price: json['price'] is int
          ? (json['price'] as int).toDouble()
          : json['price'] is double
          ? json['price']
          : double.parse(json['price']),
      id: json['id'],
    );
  }
}
