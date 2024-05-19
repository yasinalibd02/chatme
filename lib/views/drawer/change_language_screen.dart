import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chatme/constants/app_colors.dart';
import 'package:chatme/constants/app_sized.dart';
import 'package:chatme/constants/style.dart';
import '../../backend/local_storage.dart';
import '../../widget/others/my_app_bar_widget.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class Language {
  final String code;
  final String name;

  Language({required this.code, required this.name});
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  final List<Language> languages = [
    Language(code: 'en', name: 'English'),
    Language(code: 'ar', name: 'Arabic'),
  ];

  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage =
        LocalStorage.getLanguage()[0]; // Read the locale from LocalStorage
  }

  void _changeLanguage(String languageCode) {
    setState(() {
      _selectedLanguage = languageCode;
    });

    String langCap = languageCode == 'ar' ? 'SA' : 'US';
    Locale locale = Locale(languageCode, langCap);

    LocalStorage.saveLanguage(
      langSmall: languageCode,
      langCap: langCap,
      languageName: languageCode == 'ar' ? 'Arabic' : 'English',
    );

    Get.updateLocale(locale); // Update the locale with GetX
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'changeLanguage'.tr,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal,
          vertical: Dimensions.marginSizeVertical * 0.2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${'changeLanguage'.tr} :',
              style: CustomStyle.largeTextStyle,
            ),
            Column(
              children: [
                ...languages.map((language) {
                  bool isSelected = language.code == _selectedLanguage;
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: Dimensions.paddingSizeVertical * 0.1),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        surfaceTintColor:
                            isSelected ? AppColor.primaryColor : Colors.black,
                        backgroundColor:
                            isSelected ? AppColor.primaryColor : Colors.black,
                      ),
                      onPressed: () => _changeLanguage(language.code),
                      child: Text(
                        language.name.tr,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }).toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
