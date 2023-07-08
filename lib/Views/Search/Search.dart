import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Widgets/custom_text.dart';
import '../Drawer/Drawer.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> location = [
    tr("Not Set"),
  ];
  String? currentLocationName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Images/Homebck.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: const DrawerNavigation(),
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Builder(
                          builder: (BuildContext context) => InkWell(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: Image.asset(
                              'assets/Icons/drawer.png',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35.w,
                        ),
                        CustomText(
                          text: tr('Search'),
                          fontColor: const Color(0xffFFFFFF),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    const Icon(Icons.notifications_none_outlined, size: 25, color: Color(0xffFFFFFF)),
                  ],
                ),
              ),
            ],
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          toolbarHeight: 110.h,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: tr("Listing Title"),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontColor: Color(0xffFFFFFF),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.h, bottom: 14.h).r,
                  child: Row(children: [
                    Flexible(
                        flex: 1,
                        child: Container(
                          height: 45.h,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: const BoxDecoration(
                            color: Color(0xffF4F8FB),
                            borderRadius: BorderRadius.all(
                              Radius.circular(3),
                            ),
                          ),
                          child: SizedBox(
                            height: 30.h,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: tr("Not Set"),
                                hintStyle: TextStyle(color: Color(0xff000000)),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  color: const Color.fromRGBO(142, 138, 138, 0.61),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter'),
                            ),
                          ),
                        )),
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: tr("Minimum"),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontColor: Color(0xffFFFFFF),
                      ),
                      Flexible(
                          flex: 1,
                          child: Container(
                            height: 37.h,
                            width: 127.w,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xffF4F8FB),
                              borderRadius: BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: tr("Not Set"),
                                hintStyle: TextStyle(color: Color(0xff000000)),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  color: const Color.fromRGBO(142, 138, 138, 0.61),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter'),
                            ),
                          )),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Color(0xff606060),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: tr("Maximum"),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontColor: Color(0xffFFFFFF),
                      ),
                      Flexible(
                          flex: 1,
                          child: Container(
                            height: 37.h,
                            width: 127.w,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: const BoxDecoration(
                              color: Color(0xffF4F8FB),
                              borderRadius: BorderRadius.all(
                                Radius.circular(3),
                              ),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: tr("Not Set"),
                                hintStyle: TextStyle(color: Color(0xff000000)),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                  color: const Color.fromRGBO(142, 138, 138, 0.61),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Inter'),
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                  child: CustomText(
                    text: tr("Location"),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Color(0xffFFFFFF),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xffF4F8FB),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: DropdownButton(
                        hint: CustomText(
                          text: tr("Not set"),
                          fontColor: Color(0xff000000),
                        ),
                        icon: Align(
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff000000),
                          ),
                        ),
                        value: currentLocationName,
                        items: location
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: CustomText(
                                  text: e,
                                  fontColor: Color(0xff000000),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            currentLocationName = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                  child: CustomText(
                    text: tr("Type"),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Color(0xffFFFFFF),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xffF4F8FB),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: DropdownButton(
                        hint: CustomText(
                          text: tr("Not set"),
                          fontColor: Color(0xff000000),
                        ),
                        icon: Align(
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff000000),
                          ),
                        ),
                        value: currentLocationName,
                        items: location
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: CustomText(
                                  text: e,
                                  fontColor: Color(0xff000000),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            currentLocationName = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                  child: CustomText(
                    text: tr("Item Condition"),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Color(0xffFFFFFF),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xffF4F8FB),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: DropdownButton(
                        hint: CustomText(
                          text: tr("Not set"),
                          fontColor: Color(0xff000000),
                        ),
                        icon: Align(
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff000000),
                          ),
                        ),
                        value: currentLocationName,
                        items: location
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: CustomText(
                                  text: e,
                                  fontColor: Color(0xff000000),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            currentLocationName = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                  child: CustomText(
                    text: tr("Price Type"),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Color(0xffFFFFFF),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xffF4F8FB),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: DropdownButton(
                        hint: CustomText(
                          text: tr("Not set"),
                          fontColor: Color(0xff000000),
                        ),
                        icon: Align(
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff000000),
                          ),
                        ),
                        value: currentLocationName,
                        items: location
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: CustomText(
                                  text: e,
                                  fontColor: Color(0xff000000),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            currentLocationName = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                  child: CustomText(
                    text: tr("Transmission"),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Color(0xffFFFFFF),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xffF4F8FB),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: DropdownButton(
                        hint: CustomText(
                          text: tr("Not set"),
                          fontColor: Color(0xff000000),
                        ),
                        icon: Align(
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff000000),
                          ),
                        ),
                        value: currentLocationName,
                        items: location
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: CustomText(
                                  text: e,
                                  fontColor: Color(0xff000000),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            currentLocationName = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                  child: CustomText(
                    text: tr("Color"),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Color(0xffFFFFFF),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xffF4F8FB),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: DropdownButton(
                        hint: CustomText(
                          text: tr("Not set"),
                          fontColor: Color(0xff000000),
                        ),
                        icon: Align(
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff000000),
                          ),
                        ),
                        value: currentLocationName,
                        items: location
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: CustomText(
                                  text: e,
                                  fontColor: Color(0xff000000),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            currentLocationName = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                  child: CustomText(
                    text: tr("Sold Out"),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Color(0xffFFFFFF),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xffF4F8FB),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: DropdownButton(
                        hint: CustomText(
                          text: tr("Not set"),
                          fontColor: Color(0xff000000),
                        ),
                        icon: Align(
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff000000),
                          ),
                        ),
                        value: currentLocationName,
                        items: location
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: CustomText(
                                  text: e,
                                  fontColor: Color(0xff000000),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            currentLocationName = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                  child: CustomText(
                    text: tr("Fuel Type"),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Color(0xffFFFFFF),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xffF4F8FB),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: DropdownButton(
                        hint: CustomText(
                          text: tr("Not set"),
                          fontColor: Color(0xff000000),
                        ),
                        icon: Align(
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff000000),
                          ),
                        ),
                        value: currentLocationName,
                        items: location
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: CustomText(
                                  text: e,
                                  fontColor: Color(0xff000000),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            currentLocationName = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                  child: CustomText(
                    text: tr("Build Type"),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Color(0xffFFFFFF),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xffF4F8FB),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: DropdownButton(
                        hint: CustomText(
                          text: tr("Not set"),
                          fontColor: Color(0xff000000),
                        ),
                        icon: Align(
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff000000),
                          ),
                        ),
                        value: currentLocationName,
                        items: location
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: CustomText(
                                  text: e,
                                  fontColor: Color(0xff000000),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            currentLocationName = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                  child: CustomText(
                    text: tr("Seller Type"),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontColor: Color(0xffFFFFFF),
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Color(0xffF4F8FB),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: DropdownButton(
                        hint: CustomText(
                          text: tr("Not set"),
                          fontColor: Color(0xff000000),
                        ),
                        icon: Align(
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color(0xff000000),
                          ),
                        ),
                        value: currentLocationName,
                        items: location
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: CustomText(
                                  text: e,
                                  fontColor: Color(0xff000000),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            currentLocationName = value.toString();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 36.0.h, bottom: 40.h),
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    elevation: 5.0,
                    minWidth: double.infinity,
                    height: 45,
                    color: Color(0xFF054255),
                    child: Text(tr('Search'), style: TextStyle(fontSize: 16.0, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
