import 'package:dr_cars/Views/FilterAndSort/FilterAndSort.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Widgets/custom_text.dart';
import '../Filter And Sort/Filter And Sort.dart';

class Manufacture extends StatefulWidget {
  const Manufacture({Key? key}) : super(key: key);

  @override
  State<Manufacture> createState() => _ManufactureState();
}

class _ManufactureState extends State<Manufacture> {
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
          appBar: AppBar(
            titleSpacing: 20,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: EdgeInsets.only(left: 10.0.w, top: 25.h),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const ImageIcon(
                    size: 22,
                    color: Colors.white,
                    AssetImage(
                      "assets/Icons/back arrow.png",
                    )),
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: CustomText(
                text: tr('Manufacture'),
                fontColor: const Color(0xffFFFFFF),
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
              padding: EdgeInsets.only(
                top: 86.0.h,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.w, bottom: 20.0.h, right: 20.0.w),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Honda',
                            fontColor: const Color(0xffFFFFFF),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(const FilterAndSort());
                                },
                                child: const ImageIcon(
                                    size: 22,
                                    color: Color(0xff37DC44),
                                    AssetImage(
                                      "assets/Icons/filter.png",
                                    )),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              const ImageIcon(
                                  size: 22,
                                  color: Color(0xffF0F2FF),
                                  AssetImage(
                                    "assets/Icons/Vector 30.png",
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w),
                      child: Container(
                        height: 600.h,
                        child: ListView(
                          children: [
                            ListTile(
                              leading: CustomText(
                                text: 'General Motors',
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                              trailing: const ImageIcon(
                                  size: 22,
                                  color: Color(0xffF0F2FF),
                                  AssetImage(
                                    "assets/Icons/Vector 30.png",
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              leading: CustomText(
                                text: 'Toyota',
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                              trailing: const ImageIcon(
                                  size: 22,
                                  color: Color(0xffF0F2FF),
                                  AssetImage(
                                    "assets/Icons/Vector 30.png",
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              leading: CustomText(
                                text: 'Nissan',
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                              trailing: const ImageIcon(
                                  size: 22,
                                  color: Color(0xffF0F2FF),
                                  AssetImage(
                                    "assets/Icons/Vector 30.png",
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              leading: CustomText(
                                text: 'BMW',
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                              trailing: const ImageIcon(
                                  size: 22,
                                  color: Color(0xffF0F2FF),
                                  AssetImage(
                                    "assets/Icons/Vector 30.png",
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              leading: CustomText(
                                text: 'Ford',
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                              trailing: const ImageIcon(
                                  size: 22,
                                  color: Color(0xffF0F2FF),
                                  AssetImage(
                                    "assets/Icons/Vector 30.png",
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              leading: CustomText(
                                text: 'KIA',
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                              trailing: const ImageIcon(
                                  size: 22,
                                  color: Color(0xffF0F2FF),
                                  AssetImage(
                                    "assets/Icons/Vector 30.png",
                                  )),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ListTile(
                              leading: CustomText(
                                text: 'Tesla',
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.center,
                              ),
                              trailing: const ImageIcon(
                                  size: 22,
                                  color: Color(0xffF0F2FF),
                                  AssetImage(
                                    "assets/Icons/Vector 30.png",
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          )),
    );
  }
}
