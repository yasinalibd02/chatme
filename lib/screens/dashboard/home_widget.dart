import 'package:flutter/material.dart';

class HomeTopContainer extends StatelessWidget {
  const HomeTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the responsive text size based on screen width
    double textSize = screenWidth * 0.04;
    return Text("yasin arafat is a software engineer , he is 23 year old"
    ,
    style: TextStyle(fontSize: textSize),);
  }
} 