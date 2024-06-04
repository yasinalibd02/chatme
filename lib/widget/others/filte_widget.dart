import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_strings.dart';
import 'package:chatme/constants/style.dart';
import 'package:flutter/material.dart';

void showFilterDialog(BuildContext context) {
  final List<String> categories = ['Electronics', 'Fashion', 'Home', 'Books'];
  final List<String> products = ['Laptop', 'Shoes', 'Sofa', 'Novel'];
  String? selectedCategory;
  String? selectedProduct;
  double minAmount = 0;
  double maxAmount = 1000;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            surfaceTintColor: AppColor.whiteColor,
            title: Text(AppString.filterOptions,
            style: CustomStyle.largeTextStyle,
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                    
                      labelText: 'Select Category',
                      border: OutlineInputBorder(),
                    ),
                    items: categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                    value: selectedCategory,
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: 'Select Product',
                      border: OutlineInputBorder(),
                    ),
                    items: products.map((String product) {
                      return DropdownMenuItem<String>(
                        value: product,
                        child: Text(product),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedProduct = value;
                      });
                    },
                    value: selectedProduct,
                  ),
                  const SizedBox(height: 16.0),
                   Text('Select Price Range',
                  // style: Custom,
                  ),
                  RangeSlider(
                    values: RangeValues(minAmount, maxAmount),
                    min: 0,
                    max: 2000,
                    divisions: 40,
                    labels: RangeLabels(
                      minAmount.toString(),
                      maxAmount.toString(),
                    ),
                    onChanged: (RangeValues values) {
                      setState(() {
                        minAmount = values.start;
                        maxAmount = values.end;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Min: \$${minAmount.toStringAsFixed(0)}'),
                      Text('Max: \$${maxAmount.toStringAsFixed(0)}'),
                    ],
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Apply'),
                onPressed: () {
                  // Apply filter logic with selectedCategory, selectedProduct, minAmount, maxAmount
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}
