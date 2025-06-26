import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/data/models/user_model.dart';

import '../models/order_model.dart';

class UserDataSource {
  final CollectionReference _userCollection =
  FirebaseFirestore.instance.collection('users');

  Future<UserModel> getUserById(String id) async {
    try {
      final doc = await _userCollection.doc(id).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data() as Map<String, dynamic>, doc.id);
      } else {
        throw Exception("User with ID $id not found");
      }
    } on FirebaseException catch (e) {
      if (e.code == 'unavailable' || e.message?.contains('network') == true) {
        throw Exception('Network error: Please check your internet connection.');
      } else {
        throw Exception('Firebase error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _userCollection.doc(user.id).update(user.toJson());
    } catch (e) {
      rethrow;
    }
  }
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
      log('Error fetching orders: $e');
      rethrow;
    }
  }

}
