import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_assets.dart';
import 'package:get/get.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/constants/app_style.dart';
import 'package:flutter_task/core/widgets/custom_app_bar.dart';

import '../../../core/widgets/profile_menu_item.dart';
import '../../../routes/app_routes.dart';
import '../controllers/user_controller.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'My Profile',
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: AppColors.salmon),
            onPressed: () {
               Get.toNamed(AppRoutes.editProfile);
            },
          )
        ],
      ),
      body: GetX<UserController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          final user = controller.user.value;
          if (user == null) {
            return const Center(child: Text("No user data found."));
          }

          return SingleChildScrollView(
            child: Padding(
              padding: AppStyle.screenPadding,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                   CircleAvatar(
                    radius: 60,
                     backgroundImage: user.imageUrl != null && user.imageUrl!.isNotEmpty
                       ? NetworkImage(user.imageUrl!)
                       : const AssetImage(AppAssets.defaultProfile) as ImageProvider,
                   ),
                  const SizedBox(height: 10),
                  Text(user.name, style: AppStyle.headingSmall),
                 Text('ID:${user.id}', style: AppStyle.label),

                  const SizedBox(height: 30),

                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.salmon,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileScreenIconItem(
                              onTap: (){},
                              icon: Icons.person_outlined,
                              label: 'My Profile',
                            ),
                            Container(
                              height: 50,
                              width: 1,
                              color: AppColors.white,
                            ),
                            ProfileScreenIconItem(
                              onTap: (){},
                              icon: Icons.list_alt_outlined,
                              label: 'Wishlist',
                            ),
                            Container(
                              height: 50,
                              width: 1,
                              color: AppColors.white,
                            ),
                            ProfileScreenIconItem(
                              onTap: (){

                                Get.toNamed(AppRoutes.orders);
                              },
                              icon: Icons.shopping_cart_outlined,
                              label: 'My Orders',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                ProfileMenuItem(icon: Icons.key_outlined, label: 'Privacy Policy'),
              ProfileMenuItem(icon: Icons.credit_card, label: 'Payment Methods'),
              ProfileMenuItem(icon: Icons.notifications, label: 'Notifications'),
              ProfileMenuItem(icon: Icons.settings, label: 'Settings'),
              ProfileMenuItem(icon: Icons.headphones, label: 'Help'),
              ProfileMenuItem(icon: Icons.login_outlined, label: 'Logout'),
            ],
          ),
        ),
          );
  }));
}}

class ProfileScreenIconItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function()? onTap;

  const ProfileScreenIconItem({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Column(
        children: [
          Icon(icon,size: 50,color: AppColors.black,),
          Text(label, style: AppStyle.label.copyWith(color: AppColors.black))
        ],
      ),
    );
  }
}

