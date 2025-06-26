import 'order_model.dart';

class UserModel {
  final String? imageUrl;
  final String id;
  final String name;
  final String email;
  final String phone;
  final String dob;
  final String gender;
  final List<OrderModel>? orders;

  UserModel({
    this.imageUrl,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.dob,
    required this.gender,
    this.orders,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, String docId) {
    return UserModel(
      imageUrl: json['imageUrl'] ?? '',
      id: docId,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      dob: json['dob'] ?? '',
      gender: json['gender'] ?? '',
      orders: json['orders'] != null
          ? List<OrderModel>.from(
        (json['orders'] as List).map((order) => OrderModel.fromJson(order)),
      )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'dob': dob,
      'gender': gender,
      'orders': orders?.map((order) => order.toJson()).toList(),
    };
  }
  UserModel copyWith({
    String? imageUrl,
    String? name,
    String? email,
    String? phone,
    String? dob,
    String? gender,
    List<OrderModel>? orders,
  }) {
    return UserModel(
      imageUrl: imageUrl ?? this.imageUrl,
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      orders: orders ?? this.orders,
    );
  }

}
