import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_cars/Controllers/auth_Controller.dart';
import 'package:dr_cars/Views/Edit%20Profile/Edit%20Profile.dart';
import 'package:dr_cars/Views/Profile/Profile.dart';
import 'package:dr_cars/Views/Trending/Trending.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Controllers/home_controller.dart';
import '../../Widgets/CustomToogleButton.dart';
import '../../Widgets/custom_text.dart';
import 'package:get/get.dart';

import '../Languages/languages.dart';
import '../NavigationBar/NavigationBar.dart';
import '../NavigationBar/NavigationBayer/NavigationBayer.dart';
import '../setting/setting_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  final authController = Get.put(AuthController());
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    final auth = Get.put(AuthController());
    return Container(
        color: const Color(0xff09191E),
        child: Drawer(
          width: 271.w,
          child: Container(
            color: const Color(0xff044B62),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 60.h),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: CachedNetworkImage(
                            imageUrl: "${auth.userData?.value.profilePic}" ?? "N/A",
                            errorWidget: (context, url, error) => Image.asset(
                              "assets/Images/profile.png",
                              height: 100.h,
                              width: 900.w,
                              fit: BoxFit.cover,
                            ),
                            height: 100.h,
                            width: 90.w,
                            fit: BoxFit.cover,
                          ),
                        ),
/*
                        ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Image.network(
                            "${auth.userData?.profilePic}",

                            //"assets/Images/profile.png",
                            height: 50.h,
                            width: 50.w,
                            fit: BoxFit.fill,
                          ),
                        ),
*/
                        SizedBox(
                          width: 17.w,
                        ),
                        SizedBox(
                          height: 50.h,
                          width: 120.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "${auth.userData?.value.firstName ?? "N/A"}",
                                //text: 'Ronald',
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              CustomText(
                                text: "${auth.userData?.value.lastName ?? "N/A"}",
                                fontColor: const Color.fromRGBO(255, 255, 255, 0.8),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
/*
                              CustomText(
                                text: 'Buyer',
                                fontColor:
                                    const Color.fromRGBO(255, 255, 255, 0.71),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
*/
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w, right: 40.w),
                    child: Container(
                      width: 155.w,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xffD0C8C8),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: SizedBox(
                        width: 175.w,
                        height: 35.h,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xff179802), width: 2)),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (auth.isSelected == 0) {
                                    auth.sellerType = "seller";

                                    Get.back();
                                  } else {
                                    homeController.checkUser();
                                    auth.sellerType = "buyer";
                                    authController.checkUserLoggedIn();
                                    Get.to(const NavigationBarScreen());
                                  }
                                  setState(() {
                                    auth.isSelected = 0;
                                  });
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 85.3.w,
                                  decoration: BoxDecoration(
                                      color: auth.isSelected == 0 ? Color(0xff179802) : Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(3),
                                        bottomLeft: Radius.circular(3),
                                      )),
                                  child: Center(
                                    child: CustomText(
                                        text: tr("Seller"),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        fontColor: auth.isSelected == 0 ? Colors.white : Color(0xff179802)),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (auth.isSelected == 1) {
                                    Get.back();
                                  } else {
                                    Get.to(const NavigationBarScreenBayer());
                                  }
                                  setState(() {
                                    auth.isSelected = 1;
                                  });
                                },
                                child: Container(
                                  height: 35.h,
                                  width: 85.3.w,
                                  decoration: BoxDecoration(
                                      color: auth.isSelected == 1 ? Color(0xff179802) : Colors.transparent,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(3),
                                        bottomRight: Radius.circular(3),
                                      )),
                                  child: Center(
                                    child: CustomText(
                                      text: tr("Buyer"),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      fontColor: auth.isSelected == 1 ? Colors.white : Color(0xff179802),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )

                        // CustomToggleButtons(
                        //   titles: const ['Seller', 'Buyer'],
                        //   onPressed: (int newIndex) {
                        //     if (newIndex == 0) {
                        //       Get.to(
                        //           const NavigationBarScreen()); // navigate to seller screen
                        //     } else {
                        //       Get.to(const NavigationBarScreenBayer());
                        //     }
                        //   },
                        // ),
                        ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  //   child: SizedBox(
                  //     width: 200.w,
                  //     child: CustomToggleButtons(
                  //       titles: const ['Seller', 'Buyer'],
                  //       onPressed: (int newIndex) {
                  //         print("?????????????????????????////////////////");
                  //         print(newIndex);
                  //         if (newIndex == 0) {
                  //           Get.to(
                  //               const NavigationBarScreen()); // navigate to seller screen
                  //         } else {
                  //           Get.to(const NavigationBarScreenBayer());
                  //         }
                  //       },
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 27.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.w,
                      right: 40.w,
                    ),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => Get.to(const NavigationBarScreen()),
                          child: Row(
                            children: [
                              Image.asset("assets/Icons/Home.png"),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: tr('Home'),
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        InkWell(
                          onTap: () {
                            Get.to(const Profile());
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Color(0xffFFFFFF),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: tr('Profile'),
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () => Get.to(const SettingScreen()),
                          child: Row(
                            children: [
                              Image.asset("assets/Icons/Settings.png"),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: tr('Settings'),
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () => Get.to(LanguagesScreen()),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/Icons/e.png",
                                height: 20..h,
                                width: 20..w,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CustomText(
                                text: tr("Select Language"),
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 75.h,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/Icons/icon.png',
                      height: 101.h,
                      width: 70.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.w,
                      right: 40.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        ImageIcon(
                            color: Colors.white,
                            size: 22,
                            AssetImage(
                              "assets/Icons/Question mark.png",
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40.w, right: 40.w),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xffD0C8C8),
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 40.w,
                      right: 40.w,
                    ),
                    // child: Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     const ImageIcon(
                    //         color: Colors.white,
                    //         size: 22,
                    //         AssetImage(
                    //           "assets/Icons/Logout.png",
                    //         )),
                    //     const SizedBox(
                    //       width: 10,
                    //     ),
                    //     CustomText(
                    //       text: 'Sign out',
                    //       fontColor: const Color(0xffFFFFFF),
                    //       fontSize: 20.sp,
                    //       fontWeight: FontWeight.w500,
                    //     ),
                    //   ],
                    // ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
