import 'package:dr_cars/Views/Sign%20in/Sign%20in.dart';
import 'package:dr_cars/Widgets/CustomContainer/CustomContainer.dart';
import 'package:dr_cars/Widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Widgets/custom_radio_button/custom_radio.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  ValueNotifier<int> _selectedRadio = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
  }

  void setSelectedRadio(int value) {
    _selectedRadio.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Images/background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 38.0.w, top: 30.0.h),
                child:
                    const Center(child: Icon(Icons.arrow_back_ios_new, size: 25, color: Color(0xffFFFFFF))),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.only(left: 38.0.w, top: 30.0.h, right: 38.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "",
                  fontColor: Color(0xffFFFFFF),
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/Icons/icon.png',
                      height: 180.h,
                      width: 197.w,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(
                  height: 58.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xff606060),
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.to(SignIn());
                          },
                          child: CustomText(
                            text: 'English',
                            fontColor: Color(0xffF0F2FF),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        CustomRadio(
                          value: 0,
                          groupValue: _selectedRadio.value,
                          onChanged: (val) {
                            setState(() {
                              setSelectedRadio(val);
                              EasyLocalization.of(context)?.setLocale(Locale("en"));
                              Get.updateLocale(Locale('en'));
                              // Rest of your code
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xff606060),
                        width: 3.0,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Espanol',
                          fontColor: Color(0xffF0F2FF),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                        ),
                        CustomRadio(
                          value: 1,
                          groupValue: _selectedRadio.value,
                          onChanged: (val) {
                            setState(() {
                              setSelectedRadio(val);
                              EasyLocalization.of(context)?.setLocale(Locale("es"));
                              Get.updateLocale(Locale('es'));
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomText(
                      text: tr('Choose your language'),
                      fontColor: Color(0xffF0F2FF),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
          ))),
    );
  }
}
