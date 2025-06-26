import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/data/models/user_model.dart';
import 'package:flutter_task/data/data_sources/user_data_source.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/models/order_model.dart';

class UserController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  RxnString selectedGender = RxnString();

  final UserDataSource _dataSource = UserDataSource();

  Rxn<UserModel> user = Rxn<UserModel>();
  var isLoading = false.obs;
  RxList<OrderModel> orders = <OrderModel>[].obs;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dobController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    fetchUser('user_1');
  }

  Future<void> fetchUser(String id) async {
    try {
      isLoading.value = true;
      final fetchedUser = await _dataSource.getUserById(id);

      user.value = fetchedUser;
      orders.value = fetchedUser.orders ?? [];

      nameController.text = fetchedUser.name;
      emailController.text = fetchedUser.email;
      phoneController.text = fetchedUser.phone;
      dobController.text = fetchedUser.dob;
      selectedGender.value = fetchedUser.gender;
    } catch (e) {
      user.value = null;
      if (e.toString().contains('Network error')) {
        Get.snackbar(
          "Connection Error",
          "Please check your internet connection.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Error",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateProfile() async {
    if (user.value == null) return;

    final updated = user.value!.copyWith(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      dob: dobController.text,
      gender: selectedGender.value!,
    );

    await updateUser(updated);
  }

  Future<void> updateUser(UserModel updatedUser) async {
    try {
      isLoading.value = true;
      await _dataSource.updateUser(updatedUser);
      user.value = updatedUser;
      Get.snackbar("Success", "Profile updated successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickAndUploadProfileImage(String userId) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        final file = File(pickedFile.path);

        final ref = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child('$userId.jpg');

        await ref.putFile(file);
        final imageUrl = await ref.getDownloadURL();

        await _dataSource.updateUser(user.value!.copyWith(imageUrl: imageUrl));

        user.value = user.value!.copyWith(imageUrl: imageUrl);

        Get.snackbar("Success", "Profile image updated successfully");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
