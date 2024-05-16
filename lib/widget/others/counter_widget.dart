import 'package:flutter/material.dart';

class ProductCounter extends StatefulWidget {
  @override
  _ProductCounterState createState() => _ProductCounterState();
}

class _ProductCounterState extends State<ProductCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (count > 0) {
                count--;
              }
            });
          },
        ),
        Text(
          count.toString(),
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        ),
      ],
    );
  }
}
