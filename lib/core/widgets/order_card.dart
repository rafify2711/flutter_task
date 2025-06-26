import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_colors.dart';
import 'package:flutter_task/core/constants/app_style.dart';
import 'package:flutter_task/core/constants/helper_methods.dart';
import '../../data/models/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;
  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      padding: const EdgeInsets.all(12),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  order.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.name,
                      style: AppStyle.headingSmall.copyWith(color: AppColors.salmon)
                    ),
                    const SizedBox(height: 2),
                    Text(
                      order.description,
                      style: AppStyle.label.copyWith(color: AppColors.orangeDark),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                  ],
                ),
              ),
              Row(
                children: [
                  CircleAvatar(radius:12,
                      backgroundColor: AppColors.white,
                      child: Icon(Icons.delete_outline, color: AppColors.salmon)),
                  const SizedBox(height: 8),
                  CircleAvatar(radius:12,
                      backgroundColor: AppColors.salmon,
                  child: Icon(Icons.add, color: AppColors.white)),
                ],
              ),
            ],
          ),

          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 70,),
              Expanded(child: Text(order.price.toString(), style:AppStyle.light,)),
              Expanded(child: Text('${order.quantity}x uds.', style:AppStyle.light,)),

              Text('Total: \$${order.total}', style:AppStyle.light,)
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order: ${order.status}', style: const TextStyle(color: Colors.black54, fontSize: 14)),
              Text(
                HelperMethods.formatDate(order.date),
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ],
          ),
          Divider(color: AppColors.salmon,)
        ],
      ),
    );
  }


}
