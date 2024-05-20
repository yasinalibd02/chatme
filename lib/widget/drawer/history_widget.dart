import 'package:flutter/material.dart';
import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/style.dart';

class OrderItem extends StatelessWidget {
  final String orderId;
  final String date;
  final String totalAmount;
  final String status;

  const OrderItem({
    Key? key,
    required this.orderId,
    required this.date,
    required this.totalAmount,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSizeVertical * 0.5),
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 0.1,
        horizontal: Dimensions.marginSizeHorizontal * 0.6,
      ),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0,
          ),
        ],
        borderRadius: BorderRadius.circular(Dimensions.radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order ID: $orderId',
            style: CustomStyle.mediumTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: Dimensions.paddingSizeVertical * 0.2),
          Text(
            'Date: $date',
            style: CustomStyle.smallTextStyle.copyWith(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: Dimensions.paddingSizeVertical * 0.2),
          Text(
            'Total Amount: $totalAmount',
            style: CustomStyle.smallTextStyle.copyWith(
              fontSize: 14,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: Dimensions.paddingSizeVertical * 0.2),
          Text(
            'Status: $status',
            style: CustomStyle.smallTextStyle.copyWith(
              fontSize: 14,
              color: status == 'Delivered' ? Colors.green : Colors.red,
            ),
          ),
          SizedBox(height: Dimensions.paddingSizeVertical * 0.2),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Handle view details tap
              },
              child: Text(
                'View Details',
                style: CustomStyle.smallTextStyle.copyWith(
                  color: AppColor.primaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
