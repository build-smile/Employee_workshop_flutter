// To parse this JSON data, do
//
//     final inventory = inventoryFromJson(jsonString);

import 'dart:convert';

List<Inventory> inventoryFromJson(String str) =>
    List<Inventory>.from(json.decode(str).map((x) => Inventory.fromJson(x)));

String inventoryToJson(List<Inventory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Inventory {
  Inventory({
    this.id,
    this.description = '',
    this.imageName,
    this.price = 0,
    this.stock = 0,
    this.createdDate,
    this.updatedDate,
  });

  int? id;
  String description;
  String? imageName;
  double price;
  double stock;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory Inventory.fromJson(Map<String, dynamic> json) => Inventory(
        id: json["id"],
        description: json["description"],
        imageName: json["image_name"],
        price: double.parse(json["price"].toString()),
        stock: double.parse(json["stock"].toString()),
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "image_name": imageName,
        "price": price,
        "stock": stock,
        "created_date": createdDate!.toIso8601String(),
        "updated_date": updatedDate!.toIso8601String(),
      };
}
