import 'package:dr_cars/Views/Home/Home.dart';
import 'package:dr_cars/Views/Languages/languages.dart';
import 'package:dr_cars/Views/ManufactureDetails/ManufactureDetails.dart';
import 'package:dr_cars/Views/NavigationBar/NavigationBar.dart';
import 'package:dr_cars/Views/SignUp/SignUp.dart';
import 'package:dr_cars/Views/Trending/Trending.dart';
import 'package:dr_cars/Widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Widgets/CustomButton.dart';
import '../Manufacture/Manufacture.dart';
import '../Messange/Messange.dart';
import '../Recent Upload Item/RecentUploadItems.dart';
import '../Sign in/Sign in.dart';

class Started extends StatefulWidget {
  const Started({Key? key}) : super(key: key);

  @override
  State<Started> createState() => _StartedState();
}

class _StartedState extends State<Started> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Images/started.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Center(
                  child: Image.asset('assets/Icons/icon.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 34.0.w, top: 340.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: tr('Welcome!'),
                        fontColor: const Color(0xffFFFFFF),
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 34.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 131,
                        child: CustomText(
                          text: tr('Buy and sell any car you prefer'),
                          fontColor: const Color(0xffFFFFFF),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.045,
                  //height: 43,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 69.0.w, right: 69.w),
                  child: CustomButton(
                      text: tr("Get Started"),
                      onPressed: () {
                        Get.to(const SignUp());
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
