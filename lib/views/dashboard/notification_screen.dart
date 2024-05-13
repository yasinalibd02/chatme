import 'package:flutter/material.dart';

import '../../widget/dashbaord/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  // Add padding to the top
          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const NotificationItem(
                title: 'Notification Title',
                message:
                    'Notification message goes here. This is a sample notification message.',
                time: '10:00 AM',
              );
            },
          
        
      ),
    );
  }
}
