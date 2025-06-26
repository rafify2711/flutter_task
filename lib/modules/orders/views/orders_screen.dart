import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/order_card.dart';
import '../../profile/controllers/order_controller.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<OrderController>(
      init: OrderController()..fetchOrders('user_1'),
      builder: (controller) {
        if (controller.isLoading.value) {
          return const Scaffold(
            backgroundColor: AppColors.white,
            appBar: CustomAppBar(title: 'My Orders'),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return Scaffold(
          appBar: const CustomAppBar(title: 'My Orders'),
          body: controller.orders.isEmpty
              ? const Center(child: Text('No orders found.'))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: controller.orders.length,
                  itemBuilder: (context, index) {
                    return OrderCard(order: controller.orders[index]);
                  },
                ),
        );
      },
    );
  }
}
