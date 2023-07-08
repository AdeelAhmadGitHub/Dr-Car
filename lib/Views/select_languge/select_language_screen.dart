// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../Controllers/language_controller.dart';
//
// class SelectLanguageScreen extends StatelessWidget {
//   final LanguageController _languageController = Get.put(LanguageController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(tr("Choose The Language")),
//       ),
//       body: Column(
//         children: [
//           Obx(() => RadioListTile<String>(
//                 title: Text('English'),
//                 value: 'en',
//                 groupValue: _languageController.language.value,
//                 onChanged: (value) {
//                   _languageController.changeLanguage(context, value!);
//                 },
//               )),
//           Obx(() => RadioListTile<String>(
//                 title: Text('French'),
//                 value: 'es',
//                 groupValue: _languageController.language.value,
//                 onChanged: (value) {
//                   _languageController.changeLanguage(context, value!);
//                 },
//               )),
//         ],
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../NavigationBar/NavigationBayer/NavigationBayer.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  int _value = 0;
  String? currentLocale;

  @override
  Widget build(BuildContext context) {
    currentLocale = context.locale.toString();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Images/Homebck.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        // backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 130,
                left: 40,
                bottom: 20,
              ),
              child: Text(
                context.tr("Choose The Language"),
                style: TextStyle(
                    fontFamily: 'Sk-Modernist-Regular',
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp),
              ),
            ),

            Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Radio<String>(
                      fillColor: MaterialStateColor.resolveWith((states) => const Color(0xff196CA8)),
                      value: "en",
                      groupValue: currentLocale,
                      onChanged: (value) {
                        setState(() {
                          // EasyLocalization.of(context)!.locale = Locale("en");
                          // context.setLocale(Locale('en'));
                          EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
                        });
                      }),
                ),
                SizedBox(width: 15.w),
                SizedBox(width: 15.w),
                Text(
                  "English",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Sk-Modernist-Regular",
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Radio<String>(
                      fillColor: MaterialStateColor.resolveWith((states) => const Color(0xff196CA8)),
                      value: "es",
                      groupValue: currentLocale,
                      onChanged: (value) {
                        setState(() {
                          EasyLocalization.of(context)!.setLocale(Locale('es', 'ES'));
                          // context.setLocale(Locale('es'));
                        });
                      }),
                ),
                SizedBox(width: 15.w),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  "Española",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Sk-Modernist-Regular",
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            ElevatedButton(
              onPressed: () async {
                Get.to(NavigationBarScreenBayer());
              },
              child: Text(
                tr("Keep Going"),
              ),
            ),
            // MyCustomButton(
            //   text1: Text(
            //     tr("keepGoing"),
            //     // "keepGoing".tr(),
            //     style: const TextStyle(
            //       fontWeight: FontWeight.w500,
            //       fontFamily: "Sk-Modernist-Regular",
            //     ),
            //   ),
            //   MyonPressed: () {
            //     UserPreferences.setLanguageCheck(true);
            //     Navigator.pushNamed(
            //       context,
            //       PhoneVerificationScreen.id,
            //       // CustomBottomNavigationBar.id,
            //     );
            //   },
            //   width1: 335,
            //   height1: 45,
            //   color1: const Color(0xff1D69A6),
            //   font1: 20.sp,
            // ),
            //
            // Text(
            //   LocaleKeys.Choose_the_Language.trim()
            // ),
            // Text(
            //   LocaleKeys.hi_text.tr(),
            // ),
            // xt(
            //   LocaleKeys.this_should_be_translated.tr(),
            // ),
            const SizedBox(height: 15),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: <Widget>[
            //     ElevatedButton(
            //       onPressed: () async {
            //         await context.setLocale(Locale('en'));
            //       },
            //       child: Text(
            //         "English",
            //       ),
            //     ),
            //     ElevatedButton(
            //       onPressed: () async {
            //         await context.setLocale(Locale('ar'));
            //       },
            //       child: Text(
            //         "العربية",
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
