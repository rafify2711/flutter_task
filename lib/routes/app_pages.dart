
import 'package:get/get.dart';
import '../modules/orders/views/orders_screen.dart';
import '../modules/profile/views/edit_profile_screen.dart';
import '../modules/profile/views/profile_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => EditProfileScreen(),
    ),
    GetPage(
      name: AppRoutes.orders,
      page: () =>  OrdersScreen(),
    ),
  ];
}
