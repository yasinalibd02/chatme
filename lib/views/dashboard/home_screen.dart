import 'package:flutter/material.dart';

import 'home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Center(child: HomeTopContainer(),),
    );
  }
}