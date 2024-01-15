import 'package:conscious/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AppColor {
  static Color getGreyColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF6f7275)
        : const Color(0xFFA0A4A8);
  }

  static Color getGrayColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF919191)
        : const Color(0xFF6E6E6E);
  }

  static Color getSearchBg(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF585a5c)
        : const Color(0xFFF4F7FC);
  }

  static Color getBackgroundColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF343636)
        : const Color(0xFFF4F7FC);
  }

  static Color getHintColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF98a1ab)
        : const Color(0xFF52575C);
  }

  static Color getGreyBunkerColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFE4E8EC)
        : const Color(0xFF25282B);
  }

  static Color getChatAdminColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFa1916c)
        : const Color(0xFFFFDDD9);
  }

  static Color getFooterColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? Theme.of(context).cardColor
        : const Color(0xFFF5EFFF);
  }

  static Color footerTextColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF111111);
  }

  static Color menuHeaderBannerColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF111111)
        : Theme.of(context).primaryColor;
  }

  static const Color colorGrey = Color(0xFFA0A4A8);
  static const Color colorNero = Color(0xFF1F1F1F);
  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color colorHint = Color(0xFF52575C);
  static const Color searchBg = Color(0xFFF4F7FC);
  static const Color colorGray = Color(0xff6E6E6E);
  static const Color colorOxfordBlue = Color(0xff282F39);
  static const Color colorNigherRider = Color(0xff303030);
  static const Color backgroundColor = Color(0xffF4F7FC);
  static const Color colorGreyBunker = Color(0xff25282B);
  static const Color colorGreyChateau = Color(0xffA0A4A8);
  static const Color borderColor = Color(0xFFDCDCDC);
  static const Color disableColor = Color(0xFF979797);
  static const Color categoryShadow = Color(0xFFA7A7A7);

  static const Map<int, Color> colorMap = {
    50: Color(0x10192D6B),
    100: Color(0x20192D6B),
    200: Color(0x30192D6B),
    300: Color(0x40192D6B),
    400: Color(0x50192D6B),
    500: Color(0x60192D6B),
    600: Color(0x70192D6B),
    700: Color(0x80192D6B),
    800: Color(0x90192D6B),
    900: Color(0xff192D6B),
  };

  static const Color webHeaderColor = Color(0xFFFF5C00);
  static const Color redColor = Color(0xFFFF5C00);
  static const Color searchBgColor = Color(0xFFE0E0E0);
  static const Color webFooterColor = Color(0xFFF5EFFF);

  static Color getHeaderColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF363636).withOpacity(0.6)
        : const Color(0xFFFFFFFF);
  }

  static Color getTextColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFFFFFFF).withOpacity(0.6)
        : const Color(0xFF1F1F1F);
  }

  static Color getBlackAndWhiteColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFFFFFFFF)
        : const Color(0xFF000000);
  }

  static Color getWebCardColor(BuildContext context) {
    return Provider.of<ThemeProvider>(context).darkTheme
        ? const Color(0xFF363636)
        : const Color(0xFFFFFFFF);
  }
}
