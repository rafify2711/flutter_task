import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/data/models/order_model.dart';

class OrderRemoteDataSource {
  final CollectionReference _userCollection =
  FirebaseFirestore.instance.collection('users');
  OrderRemoteDataSource();

  Future<List<OrderModel>> getUserOrders(String userId) async {
    try {
      final snapshot = await _userCollection
          .doc(userId)
          .collection('orders')
          .get();

      return snapshot.docs
          .map((doc) => OrderModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      log(' Error fetching orders: $e');
      rethrow;
    }
  }
}
