import 'package:dr_cars/Views/DeleteAccount/DeleteAccount.dart';
import 'package:dr_cars/Views/log_out/log_out_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Widgets/custom_text.dart';
import '../Drawer/Drawer.dart';
import '../Languages/languages.dart';
import '../delete_account/delete_account_screen.dart';
import '../select_languge/select_language_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Images/Homebck.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        drawer: const DrawerNavigation(),
        appBar: AppBar(
          titleSpacing: 20,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          /* Padding(
            padding: EdgeInsets.only(left: 10.0.w, top: 25.h),
            child: Builder(
              builder: (BuildContext context) => InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset(
                  'assets/Icons/drawer.png',
                ),
              ),
            ),
          ),*/

          leading: Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.keyboard_backspace_outlined)),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 25.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: tr('Setting'),
                  fontColor: const Color(0xffFFFFFF),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                ),
                const Icon(Icons.notifications_none_outlined, size: 25, color: Color(0xffFFFFFF)),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(LanguagesScreen());
                },
                child: Container(
                  height: 90.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: tr("Select Language"),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              fontColor: Colors.white,
                            ),
                            SizedBox(height: 15.h),
                            CustomText(
                              text: tr("Policy Statement"),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontColor: Colors.white,
                            ),
                          ],
                        ),
                        const Spacer(),
                        const ImageIcon(
                          AssetImage("assets/Icons/arroww.png"),
                          size: 20,
                          color: Color(0xffF4F8FB),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                height: 90.h,
                width: double.maxFinite,
                decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Term & Conditions",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontColor: Colors.white,
                          ),
                          SizedBox(height: 15.h),
                          CustomText(
                            text: "Terms and Conditions Statement",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontColor: Colors.white,
                          ),
                        ],
                      ),
                      const Spacer(),
                      const ImageIcon(
                        AssetImage("assets/Icons/arroww.png"),
                        size: 20,
                        color: Color(0xffF4F8FB),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  Get.to(DeleteAccountScreen());
                },
                child: Container(
                  height: 90.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: CustomText(
                                text: tr("Delete Account"),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                fontColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const ImageIcon(
                          AssetImage("assets/Icons/arroww.png"),
                          size: 20,
                          color: Color(0xffF4F8FB),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              GestureDetector(
                onTap: () {
                  Get.to(Logout());
                },
                child: Container(
                  height: 90.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: CustomText(
                                text: tr("Log Out"),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                fontColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const ImageIcon(
                          AssetImage("assets/Icons/arroww.png"),
                          size: 20,
                          color: Color(0xffF4F8FB),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
