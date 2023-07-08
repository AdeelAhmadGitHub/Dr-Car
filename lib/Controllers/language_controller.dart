import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageController extends GetxController {
  final language = 'en'.obs; // Default language

  void changeLanguage(BuildContext context, String newLanguage) {
    language.value = newLanguage;
    EasyLocalization.of(context)!.setLocale(Locale("es"));
  }
}
