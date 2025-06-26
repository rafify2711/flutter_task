import 'package:get/get.dart';
import 'package:flutter_task/data/models/order_model.dart';
import 'package:flutter_task/data/data_sources/order_remote_data_source.dart';

class OrderController extends GetxController {
  final OrderRemoteDataSource _remoteDataSource = OrderRemoteDataSource();

  RxList<OrderModel> orders = <OrderModel>[].obs;
  RxBool isLoading = false.obs;

  Future<void> fetchOrders(String userId) async {
    try {
      isLoading.value = true;
      final fetchedOrders = await _remoteDataSource.getUserOrders(userId);
      orders.value = fetchedOrders;
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: 'Error',
          message: e.toString(),
          duration: const Duration(seconds: 3),
        ),

      );
      orders.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
