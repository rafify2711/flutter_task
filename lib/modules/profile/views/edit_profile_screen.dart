import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/constants/app_style.dart';
import 'package:flutter_task/core/widgets/app_button.dart';
import 'package:flutter_task/core/widgets/custom_app_bar.dart';
import '../../../core/constants/validators.dart';
import '../../../core/widgets/app_text_field.dart';
import '../controllers/user_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userController.fetchUser('user_1');
    });
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(title: 'Edit Profile'),
      body: GetX<UserController>(
        builder: (controller) {
          if (controller.isLoading.value || controller.user.value == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              userController.user.value!.imageUrl != null &&
                                      userController
                                          .user
                                          .value!
                                          .imageUrl!
                                          .isNotEmpty
                                  ? NetworkImage(
                                    userController.user.value!.imageUrl!,
                                  )
                                  : const AssetImage(
                                        'assets/imgs/default_profile_pictue.jpg',
                                      )
                                      as ImageProvider,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap:
                              () => userController.pickAndUploadProfileImage(
                                userController.user.value!.id,
                              ),
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.salmon,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    color: AppColors.beige,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Name: ${userController.user.value?.name ?? ''}'),
                        Text('ID: ${userController.user.value?.id ?? ''}'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: AppStyle.screenPadding,
                  child: Form(
                    key: userController.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Full Name', style: AppStyle.headingSmall),
                        AppTextField(
                          controller: userController.nameController,
                          hintText: 'Enter your name',
                        ),
                        const SizedBox(height: 16),

                        Text('Email', style: AppStyle.headingSmall),
                        AppTextField(
                          controller: userController.emailController,
                          hintText: 'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          validator: Validators.email,
                        ),
                        const SizedBox(height: 16),

                        Text('Phone', style: AppStyle.headingSmall),
                        AppTextField(
                          controller: userController.phoneController,
                          hintText: 'Enter your phone number',
                          keyboardType: TextInputType.phone,
                          validator: Validators.phone,
                        ),
                        const SizedBox(height: 16),

                        Text('Date of Birth', style: AppStyle.headingSmall),
                        AppTextField(
                          controller: userController.dobController,
                          hintText: 'DD/MM/YYYY',
                          keyboardType: TextInputType.datetime,
                          validator: Validators.date,
                        ),
                        const SizedBox(height: 16),

                        Text('Gender', style: AppStyle.headingSmall),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(child: _buildGenderTile('Male')),
                            const SizedBox(width: 12),
                            Expanded(child: _buildGenderTile('Female')),
                          ],
                        ),
                        if (userController.selectedGender.value == null)
                          const Padding(
                            padding: EdgeInsets.only(top: 6, left: 4),
                            child: Text(
                              'Please select gender',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        const SizedBox(height: 24),

                        Center(
                          child: AppButton(
                            text: 'Update Profile',
                            onPressed: () {
                              if (userController.formKey.currentState!
                                      .validate() &&
                                  userController.selectedGender.value != null) {
                                userController.updateProfile();
                              } else {
                                userController.selectedGender.refresh();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGenderTile(String gender) {
    final userController = Get.find<UserController>();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.beige,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Obx(
        () => RadioListTile<String>(
          title: Text(gender),
          value: gender,
          groupValue: userController.selectedGender.value,
          activeColor: AppColors.salmon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onChanged: (value) {
            userController.selectedGender.value = value!;
          },
        ),
      ),
    );
  }
}
