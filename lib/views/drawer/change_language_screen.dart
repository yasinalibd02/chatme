import 'package:chatme/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_strings.dart';
import '../../language/language_model.dart';
import '../../widget/others/my_app_bar_widget.dart';

class ChangeLanguageScreen extends StatelessWidget {
  ChangeLanguageScreen({super.key});
  final List<Language> languages = [
    Language(code: 'en', name: 'English'),
    Language(code: 'ar', name: 'Arabic'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar:  const MyAppBar(
          title: AppString.changePassword,
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                              surfaceTintColor: Colors.black, // Background color

              ),
              onPressed: () {
                Get.updateLocale(Locale('en', 'US'));
              },
              child: Text(
                'English',
                style: TextStyle(color: Colors.white), // Text color
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                surfaceTintColor: Colors.black, // Background color
              ),
              onPressed: () {
                Get.updateLocale(Locale('ar', 'SA'));
              },
              child: Text(
                'عربي',
                style: TextStyle(color: Colors.white), // Text color
              ),
            ),
          ],
        ),
      ),
    );
  }
   void _changeLanguage(BuildContext context, String languageCode) {
    Locale locale;
    switch (languageCode) {
      case 'ar':
        locale = const Locale('ar', 'SA'); // Arabic
        break;
      case 'en':
      default:
        locale = const Locale('en', 'US'); // English
        break;
    }

    Get.updateLocale(locale);
  }

}
