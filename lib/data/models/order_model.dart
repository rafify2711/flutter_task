import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String imageUrl;
  final String name;
  final String description;
  final double price;
  final int quantity;
  final double total;
  final String status;
  final DateTime date;

  OrderModel({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.total,
    required this.status,
    required this.date,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      imageUrl: json['imageUrl'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      quantity: json['quantity'] ?? 0,
      total: (json['total'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      date: json['date'] != null
          ? (json['date'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'description': description,
      'price': price,
      'quantity': quantity,
      'total': total,
      'status': status,
      'date': date.toIso8601String(),
    };
  }
}
