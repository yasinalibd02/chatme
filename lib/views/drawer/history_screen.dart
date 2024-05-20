import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_sized.dart';
import '../../constants/app_strings.dart';
import '../../constants/routes.dart';
import '../../widget/custom_button.dart';
import '../../widget/drawer/history_widget.dart';
import '../../widget/input_filed.dart';
import '../../widget/others/my_app_bar_widget.dart';

class HistoryScreen extends StatelessWidget {
   HistoryScreen({super.key});
    final List<Map<String, String>> orders = [
    {
      'orderId': '123456',
      'date': '2024-05-18',
      'totalAmount': '\$199.99',
      'status': 'Delivered',
    },
    {
      'orderId': '123457',
      'date': '2024-05-17',
      'totalAmount': '\$89.99',
      'status': 'Pending',
    },
    // Add more orders as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppString.history.tr,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(Dimensions.paddingSizeHorizontal * 0.5),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderItem(
            orderId: order['orderId']!,
            date: order['date']!,
            totalAmount: order['totalAmount']!,
            status: order['status']!,
          );
        },
    );
  }
}
