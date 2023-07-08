/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Widgets/custom_text.dart';

class FilterAndSort extends StatefulWidget {
  const FilterAndSort({Key? key}) : super(key: key);

  @override
  State<FilterAndSort> createState() => _FilterAndSortState();
}

class _FilterAndSortState extends State<FilterAndSort> {
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
                text: 'Search Filter',
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
              padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 35.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Sorting',
                    fontColor: const Color(0xffFFFFFF),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 30.w,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const ImageIcon(
                                size: 22,
                                color: Color(0xffA2A2A2),
                                AssetImage(
                                  "assets/Icons/recent.png",
                                )),
                            SizedBox(
                              width: 30.w,
                            ),
                            CustomText(
                              text: 'LATEST',
                              fontColor: const Color(0xffFFFFFF),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                        Image.asset('assets/Icons/checkk.png'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffF4F4F4),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const ImageIcon(
                            size: 22,
                            color: Color(0xffA2A2A2),
                            AssetImage(
                              "assets/Icons/papolar.png",
                            )),
                        SizedBox(
                          width: 30.w,
                        ),
                        CustomText(
                          text: 'POPULAR',
                          fontColor: const Color(0xffFFFFFF),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffF4F4F4),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.w,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const ImageIcon(
                            size: 22,
                            color: Color(0xffA2A2A2),
                            AssetImage(
                              "assets/Icons/papolar.png",
                            )),
                        SizedBox(
                          width: 30.w,
                        ),
                        CustomText(
                          text: 'POPULAR',
                          fontColor: const Color(0xffFFFFFF),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffF4F4F4),
                          width: 1.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.w,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const ImageIcon(
                            size: 22,
                            color: Color(0xffA2A2A2),
                            AssetImage(
                              "assets/Icons/papolar.png",
                            )),
                        SizedBox(
                          width: 30.w,
                        ),
                        CustomText(
                          text: 'POPULAR',
                          fontColor: const Color(0xffFFFFFF),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.w,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffF4F4F4),
                          width: 1.0,
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
*/
