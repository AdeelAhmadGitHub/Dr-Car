import 'dart:io';

import 'package:dr_cars/Controllers/add_post_controller.dart';
import 'package:dr_cars/Controllers/home_controller.dart';
import 'package:dr_cars/search_places_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Models/TypeUsedNew.dart';
import '../../Models/getAllColorModel.dart';
import '../../Widgets/custom_text.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

class PostingAdd1 extends StatefulWidget {
  bool isEdited = false;
  PostingAdd1({Key? key, required this.isEdited}) : super(key: key);

  @override
  State<PostingAdd1> createState() => _PostingAdd1State();
}

class _PostingAdd1State extends State<PostingAdd1> {
  String? currentExteriorColor;
  String? address;
  String? currentLocationName;
  final Mode _mode = Mode.fullscreen;
  List<String> exteriorColor = [
    tr("Black"),
    tr("Red"),
    tr("White"),
  ];
  String? currentInteriorColor;
  List<String> interiorColor = [
    tr("Blue"),
    tr("Red"),
    tr("White"),
  ];
  String? currentType;
  List<String> type = [
    tr("Brand new"),
    tr("Used"),
  ];
  int? choice;
  int isImages = 0;
  int isImages1 = 0;
  int isImages2 = 0;
  int isImages3 = 0;
  final addPostCont = Get.put(AddPostController());
  final homeCont = Get.put(HomeController());

  @override
  void initState() {
    if (widget.isEdited) {
      addPostCont.dataList = homeCont.dataList;
      addPostCont.title.text = homeCont.dataList?.title ?? "";
      addPostCont.actualPrice.text = homeCont.dataList?.actualPrice ?? "";
      addPostCont.discountPrice.text = homeCont.dataList?.discountPrice ?? "";
      addPostCont.engineType.text = homeCont.dataList?.engineType ?? "";
      addPostCont.mpg.text = homeCont.dataList?.mpg ?? "";
      addPostCont.drivetrain.text = homeCont.dataList?.drivetrain ?? "";
      addPostCont.transmission.text = homeCont.dataList?.transmission ?? "";
      addPostCont.door.text = homeCont.dataList?.door ?? "";
      addPostCont.seatCapacity.text = homeCont.dataList?.seatCapacity ?? "";
      addPostCont.vin.text = homeCont.dataList?.vin ?? "";
      //addPostCont.stock="";
      addPostCont.location = homeCont.dataList?.location ?? "";
    }
    addPostCont.getAllColor();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    addPostCont.title.clear();
    addPostCont.actualPrice.clear();
    addPostCont.discountPrice.clear();
    addPostCont.engineType.clear();
    addPostCont.mpg.clear();
    addPostCont.drivetrain.clear();
    addPostCont.transmission.clear();
    addPostCont.door.clear();
    addPostCont.seatCapacity.clear();
    addPostCont.vin.clear();
    // addPostCont.stock.clear();
    addPostCont.location = "";
    homeCont.maximumCont.clear();
    homeCont.minimumCont.clear();
    currentType = '';
    homeCont.currentType = '';
    address = '';
    addPostCont.lat = '';
    addPostCont.long = '';
    // TODO: implement dispose
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/Homebck.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: GetX<AddPostController>(
          builder: (cont) {
            return cont.loadingColor.value
                ? const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      titleSpacing: 25,
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
                          text: tr('Posting add'),
                          fontColor: const Color(0xffFFFFFF),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    body: SingleChildScrollView(
                      child: SafeArea(
                        child: Container(
                          padding: const EdgeInsets.only(top: 20).r,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: tr('Please enter the following details'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: tr('Upload Images'),
                                      fontColor: const Color(0xffFFFFFF),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      textAlign: TextAlign.start,
                                    ),
                                    CustomText(
                                      text: tr('Up to 10 Photos'),
                                      fontColor: const Color(0xffFFFFFF),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // isImages = 0;
                                    cont.selectImages();
                                    // _showChoiceDialog(context);
                                  },
                                  child: Container(
                                    height: 100.h,
                                    width: 90.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white,
                                    ),
                                    child: Image.asset('assets/Images/upload .png'),
                                  ),
                                ),

                                Obx(
                                  () => cont.imagesPath.isNotEmpty
                                      ? Column(
                                          children: [
                                            SizedBox(height: 10.h),
                                            SizedBox(
                                              height: 100.h,
                                              child: ListView.separated(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: cont.imagesPath.length,
                                                separatorBuilder: (context, index) => SizedBox(width: 10.w),
                                                itemBuilder: (context, index) => Container(
                                                  height: 100.h,
                                                  width: 90.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6),
                                                    color: Colors.white,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(6),
                                                    child: Image.file(
                                                      File(cont.imagesPath[index]),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : SizedBox(),
                                ),
                                // Container(
                                //   height: 90.h,
                                //   child: ListView.builder(
                                //     physics: const ScrollPhysics(),
                                //     shrinkWrap: true,
                                //     scrollDirection: Axis.horizontal,
                                //     itemCount: cont.images.length + 1,
                                //     itemBuilder: (BuildContext context, int index) {
                                //       if (index == 0) {
                                //         // Show the container with GestureDetector as the first item
                                //         return GestureDetector(
                                //           onTap: () {
                                //             isImages = 0;
                                //             _showChoiceDialog(context);
                                //           },
                                //           child: Container(
                                //             height: 128.h,
                                //             width: 90.w,
                                //             decoration: BoxDecoration(
                                //               borderRadius: BorderRadius.circular(6),
                                //               color: Colors.white,
                                //             ),
                                //             child: Image.asset('assets/Images/upload .png'),
                                //           ),
                                //         );
                                //       } else {
                                //         // Show the remaining items with spacing
                                //         return Padding(
                                //           padding: EdgeInsets.only(left: 20.w),
                                //           child: Container(
                                //             height: 128.h,
                                //             width: 90.w,
                                //             decoration: BoxDecoration(
                                //               borderRadius: BorderRadius.circular(6),
                                //               color: Colors.white,
                                //             ),
                                //             child: Image.file(
                                //               cont.images[index - 1],
                                //               fit: BoxFit.fill,
                                //             ),
                                //           ),
                                //         );
                                //       }
                                //     },
                                //   ),
                                // ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('Title*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  child: TextFormField(
                                    cursorColor: const Color(0xff054255),
                                    controller: cont.title,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffFFFFFF),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: const Color(0xffECECEC).withOpacity(0.16),
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffECECEC).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffFFFFFF).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      contentPadding:
                                          EdgeInsets.only(top: 4.h, bottom: 4.h, left: 20.w, right: 10.w),
                                      hintText: tr("Enter Title"),
                                      hintStyle: TextStyle(
                                          fontFamily: "DM Sans",
                                          color: const Color(0xffC0C0C0),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return tr("Please fill all fields");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('Actual Price*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    cursorColor: const Color(0xff054255),
                                    controller: cont.actualPrice,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffFFFFFF),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: const Color(0xffECECEC).withOpacity(0.16),
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffECECEC).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffFFFFFF).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      contentPadding:
                                          EdgeInsets.only(top: 4.h, bottom: 4.h, left: 20.w, right: 10.w),
                                      hintText: tr("Enter Actual Price"),
                                      hintStyle: TextStyle(
                                          fontFamily: "DM Sans",
                                          color: const Color(0xffC0C0C0),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return tr("Please fill all fields");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('Discounted price*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    cursorColor: const Color(0xff054255),
                                    controller: cont.discountPrice,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffFFFFFF),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: const Color(0xffECECEC).withOpacity(0.16),
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffECECEC).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffFFFFFF).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      contentPadding:
                                          EdgeInsets.only(top: 4.h, bottom: 4.h, left: 20.w, right: 10.w),
                                      hintText: tr("Enter Discounted price"),
                                      hintStyle: TextStyle(
                                          fontFamily: "DM Sans",
                                          color: const Color(0xffC0C0C0),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return tr("Please fill all fields");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('Engine Type*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  child: TextFormField(
                                    cursorColor: const Color(0xff054255),
                                    controller: cont.engineType,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffFFFFFF),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: const Color(0xffECECEC).withOpacity(0.16),
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffECECEC).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffFFFFFF).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      contentPadding:
                                          EdgeInsets.only(top: 4.h, bottom: 4.h, left: 20.w, right: 10.w),
                                      hintText: tr("Enter Engine Type"),
                                      hintStyle: TextStyle(
                                          fontFamily: "DM Sans",
                                          color: const Color(0xffC0C0C0),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return tr("Please fill all fields");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('MPG*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  child: TextFormField(
                                    cursorColor: const Color(0xff054255),
                                    controller: cont.mpg,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffFFFFFF),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: const Color(0xffECECEC).withOpacity(0.16),
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffECECEC).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffFFFFFF).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      contentPadding:
                                          EdgeInsets.only(top: 4.h, bottom: 4.h, left: 20.w, right: 10.w),
                                      hintText: tr("Enter MPG"),
                                      hintStyle: TextStyle(
                                          fontFamily: "DM Sans",
                                          color: const Color(0xffC0C0C0),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return tr("Please fill all fields");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('Exterior Color*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  height: 44.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xffF4F8FB),
                                      )),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<ColorD>(
                                        hint: CustomText(
                                          text: tr('Select Color'),
                                          fontColor: const Color(0xffC0C0C0),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.end,
                                        ),
/*
                                hint: const CustomText(
                                  text: "Interi",
                                  color: Color(0xffE5E5E5),
                                ),
*/
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: Color(0xff000000),
                                        ),
                                        value: cont.exteriorColorId,
                                        items: cont.getAllColorModel!.colors!
                                            .map((e) => DropdownMenuItem<ColorD>(
                                                value: e,
                                                child: CustomText(
                                                  text: e.name,
                                                  fontColor: const Color(0xff8E8694),
                                                )))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            cont.exteriorColorId = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),

/*
                        Container(
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffF4F8FB),
                            ),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            icon: const ImageIcon(
                              AssetImage('assets/Icons/icondropdown.png'),
                            ),
                            underline: const SizedBox(),
                            value: 'Black',
                            items: ['White', 'Red', 'Black']
                                .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: CustomText(
                                text: value,
                                fontColor: const Color(0xff8E8694),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ))
                                .toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ),
*/
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('Interior Color*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  height: 44.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xffF4F8FB),
                                      )),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<ColorD>(
                                        hint: CustomText(
                                          text: tr('Select Color'),
                                          fontColor: const Color(0xffC0C0C0),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.end,
                                        ),
/*
                                hint: const CustomText(
                                  text: "Interi",
                                  color: Color(0xffE5E5E5),
                                ),
*/
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: Color(0xff000000),
                                        ),
                                        value: cont.interiorColorId,
                                        items: cont.getAllColorModel!.colors!
                                            .map((e) => DropdownMenuItem<ColorD>(
                                                value: e,
                                                child: CustomText(
                                                  text: e.name,
                                                  fontColor: const Color(0xff8E8694),
                                                )))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            cont.interiorColorId = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),

/*
                        Container(
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffF4F8FB),
                            ),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            icon: const ImageIcon(
                              AssetImage('assets/Icons/icondropdown.png'),
                            ),
                            underline: const SizedBox(),
                            value: 'Being',
                            items: ['White', 'Red', 'Being']
                                .map((String color) => DropdownMenuItem<String>(
                              value: color,
                              child: CustomText(
                                text: color,
                                fontColor: const Color(0xff8E8694),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ))
                                .toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ),
*/
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('Drivetrain*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  child: TextFormField(
                                    cursorColor: const Color(0xff054255),
                                    controller: cont.drivetrain,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffFFFFFF),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: const Color(0xffECECEC).withOpacity(0.16),
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffECECEC).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffFFFFFF).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      contentPadding:
                                          EdgeInsets.only(top: 4.h, bottom: 4.h, left: 20.w, right: 10.w),
                                      hintText: tr("Enter Drivetrain"),
                                      hintStyle: TextStyle(
                                          fontFamily: "DM Sans",
                                          color: const Color(0xffC0C0C0),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return tr("Please fill all fields");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('Transmission*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  child: TextFormField(
                                    cursorColor: const Color(0xff054255),
                                    controller: cont.transmission,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffFFFFFF),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: const Color(0xffECECEC).withOpacity(0.16),
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffECECEC).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffFFFFFF).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      contentPadding:
                                          EdgeInsets.only(top: 4.h, bottom: 4.h, left: 20.w, right: 10.w),
                                      hintText: tr("Enter Auto/Manual Transmission"),
                                      hintStyle: TextStyle(
                                          fontFamily: "DM Sans",
                                          color: const Color(0xffC0C0C0),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return tr("Please fill all fields");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('Doors*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  child: TextFormField(
                                    cursorColor: const Color(0xff054255),
                                    controller: cont.door,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffFFFFFF),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: const Color(0xffECECEC).withOpacity(0.16),
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffECECEC).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffFFFFFF).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      contentPadding:
                                          EdgeInsets.only(top: 4.h, bottom: 4.h, left: 20.w, right: 10.w),
                                      hintText: tr("Enter Doors"),
                                      hintStyle: TextStyle(
                                          fontFamily: "DM Sans",
                                          color: const Color(0xffC0C0C0),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return tr("Please fill all fields");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('Seating*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  child: TextFormField(
                                    cursorColor: const Color(0xff054255),
                                    controller: cont.seatCapacity,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffFFFFFF),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: const Color(0xffECECEC).withOpacity(0.16),
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffECECEC).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffFFFFFF).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedErrorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.red,
                                      )),
                                      errorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.red,
                                      )),
                                      contentPadding:
                                          EdgeInsets.only(top: 4.h, bottom: 4.h, left: 20.w, right: 10.w),
                                      hintText: tr("Enter Seating"),
                                      hintStyle: TextStyle(
                                          fontFamily: "DM Sans",
                                          color: const Color(0xffC0C0C0),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please fill all fields";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('Type*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Container(
                                  height: 44.h,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xffF4F8FB),
                                      )),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20.0.h),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<TypeUsedNew>(
                                        hint: CustomText(
                                          text: tr('Select Type'),
                                          fontColor: const Color(0xffC0C0C0),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.end,
                                        ),

/*
                                hint: const CustomText(
                                  text: "Interi",
                                  color: Color(0xffE5E5E5),
                                ),
*/
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: Color(0xff000000),
                                        ),
                                        value: cont.typeId,
                                        items: cont.typeUsedNewList
                                            .map((e) => DropdownMenuItem<TypeUsedNew>(
                                                value: e,
                                                child: CustomText(
                                                  text: e.name,
                                                  fontColor: const Color(0xff8E8694),
                                                )))
                                            .toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            cont.typeId = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),

/*
                        Container(
                          height: 44,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1, color: const Color(0xffF4F8FB)),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            icon: const ImageIcon(
                              AssetImage('assets/Icons/icondropdown.png'),
                            ),
                            underline: const SizedBox(),
                            value: 'Brand New',
                            items: ['Brand New', 'Used']
                                .map((String brand) => DropdownMenuItem<String>(
                              value: brand,
                              child: CustomText(
                                text: brand,
                                fontColor: const Color(0xff8E8694),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ))
                                .toList(),
                            onChanged: (String? newValue) {},
                          ),
                        ),
*/
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr('VIN*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 44.h,
                                  child: TextFormField(
                                    cursorColor: const Color(0xff054255),
                                    controller: cont.vin,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xffFFFFFF),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: const Color(0xffECECEC).withOpacity(0.16),
                                      )),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffECECEC).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: const Color(0xffFFFFFF).withOpacity(0.16),
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                        color: Colors.red,
                                      )),
                                      contentPadding:
                                          EdgeInsets.only(top: 4.h, bottom: 4.h, left: 20.w, right: 10.w),
                                      hintText: tr("Enter VIN"),
                                      hintStyle: TextStyle(
                                          fontFamily: "DM Sans",
                                          color: const Color(0xffC0C0C0),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return tr("Please fill all fields");
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                CustomText(
                                  text: tr("Location*"),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                                    //   return SearchPlacesScreen();
                                    // }));
                                    _handlePressButton();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: const Color(0xffF4F8FB),
                                    ),
                                    width: double.infinity,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 14.h),
                                      child: Center(
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 318.w,
                                              child: CustomText(
                                                text: cont.location ?? tr("Select Location"),
                                                fontColor: const Color(0xffC0C0C0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   height: 10.h,
                                // ),
                                // CustomText(
                                //   text: 'Stock*',
                                //   fontColor: const Color(0xffFFFFFF),
                                //   fontSize: 16.sp,
                                //   fontWeight: FontWeight.w600,
                                //   textAlign: TextAlign.end,
                                // ),
                                // SizedBox(
                                //   height: 10.h,
                                // ),
                                // SizedBox(
                                //   height: 44.h,
                                //   child: TextFormField(
                                //     cursorColor: const Color(0xff054255),
                                //     controller: cont.stock,
                                //     decoration: InputDecoration(
                                //       filled: true,
                                //       fillColor: Color(0xffFFFFFF),
                                //
                                //       disabledBorder: OutlineInputBorder(
                                //           borderSide: BorderSide(
                                //             color: const Color(0xffECECEC).withOpacity(0.16),
                                //           )),
                                //       enabledBorder: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: const Color(0xffECECEC).withOpacity(0.16),
                                //         ),
                                //       ),
                                //       focusedBorder: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //           color: const Color(0xffFFFFFF).withOpacity(0.16),
                                //         ),
                                //       ),
                                //       focusedErrorBorder: OutlineInputBorder(
                                //           borderSide: const BorderSide(
                                //             color: Colors.red,
                                //           )),
                                //       errorBorder: OutlineInputBorder(
                                //           borderSide: const BorderSide(
                                //             color: Colors.red,
                                //           )),
                                //       contentPadding:
                                //       EdgeInsets.only(top: 4.h, bottom: 4.h, left: 20.w, right: 10.w),
                                //       hintText: "",
                                //       hintStyle: TextStyle(
                                //           fontFamily: "DM Sans",
                                //           color: const Color(0xffC0C0C0),
                                //           fontWeight: FontWeight.w400,
                                //           fontSize: 16.sp),
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(
                                //   height: 10.h,
                                // ),
                                // SizedBox(
                                //   height: 10.h,
                                // ),
                                // CustomText(
                                //   text: 'Location*',
                                //   fontColor: const Color(0xffFFFFFF),
                                //   fontSize: 16.sp,
                                //   fontWeight: FontWeight.w600,
                                //   textAlign: TextAlign.end,
                                // ),
                                // SizedBox(
                                //   height: 10.h,
                                // ),
                                // Container(
                                //   height: 44.h,
                                //   decoration: BoxDecoration(
                                //     color: const Color(0xffFAFAFD),
                                //     border: Border.all(
                                //         width: 1, color: const Color(0xffF4F8FB)),
                                //   ),
                                //   child: Center(
                                //     child: TextFormField(
                                //       controller: cont.location,
                                //       decoration: InputDecoration(
                                //         contentPadding: EdgeInsets.only(
                                //             left: 20.w, right: 20.w, bottom: 5.h),
                                //         hintText: '',
                                //         hintStyle: const TextStyle(
                                //             color: Color(0xff8E8694),
                                //             fontSize: 12,
                                //             fontWeight: FontWeight.w400),
                                //         border: InputBorder.none,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                CustomText(
                                  text: tr('Upload Original window sticker*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(height: 10.h),
                                InkWell(
                                  onTap: () async {
                                    isImages = 1;
                                    await _showChoiceDialog(context);
                                    // assignImage();
                                  },
                                  child: SizedBox(
                                    height: 105.h,
                                    width: 150.w,
                                    child: Card(
                                      child: Center(
                                        child: cont.image == null
                                            ? Image.asset("assets/Images/upload .png")
                                            : ClipRRect(
                                                borderRadius: BorderRadius.circular(5),
                                                child: Image.file(
                                                  cont.image!,
                                                  height: 105.h,
                                                  width: 150.w,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                CustomText(
                                  text: tr('This below information is only for Admin Approval'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(height: 10.h),
                                CustomText(
                                  text: tr('Upload car Paper Image*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(height: 10.h),
                                InkWell(
                                  onTap: () async {
                                    isImages1 = 1;
                                    await _showChoiceDialog1(context);
                                    // assignImage();
                                  },
                                  child: SizedBox(
                                    height: 105.h,
                                    width: 150.w,
                                    child: Card(
                                      child: Center(
                                        child: cont.image1 == null
                                            ? Image.asset("assets/Images/upload .png")
                                            : ClipRRect(
                                                borderRadius: BorderRadius.circular(5),
                                                child: Image.file(
                                                  cont.image1!,
                                                  height: 105.h,
                                                  width: 150.w,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                CustomText(
                                  text: tr('Upload Seller Document Image*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(height: 10.h),
                                InkWell(
                                  onTap: () async {
                                    isImages2 = 1;
                                    await _showChoiceDialog2(context);
                                    // assignImage();
                                  },
                                  child: SizedBox(
                                    height: 105.h,
                                    width: 150.w,
                                    child: Card(
                                      child: Center(
                                        child: cont.image2 == null
                                            ? Image.asset("assets/Images/upload .png")
                                            : ClipRRect(
                                                borderRadius: BorderRadius.circular(5),
                                                child: Image.file(
                                                  cont.image2!,
                                                  height: 105.h,
                                                  width: 150.w,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                CustomText(
                                  text: tr('Upload Car Tile Image*'),
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.end,
                                ),
                                SizedBox(height: 10.h),
                                InkWell(
                                  onTap: () async {
                                    isImages3 = 1;
                                    await _showChoiceDialog3(context);
                                    // assignImage();
                                  },
                                  child: SizedBox(
                                    height: 105.h,
                                    width: 150.w,
                                    child: Card(
                                      child: Center(
                                        child: cont.image3 == null
                                            ? Image.asset("assets/Images/upload .png")
                                            : ClipRRect(
                                                borderRadius: BorderRadius.circular(5),
                                                child: Image.file(
                                                  cont.image3!,
                                                  height: 105.h,
                                                  width: 150.w,
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
/*
                        GestureDetector(
                          onTap: () {
                            _showChoiceDialog(context);
                          },
                          child: Container(
                            height: 90.h,
                            width:140.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white,
                            ),
                            child:imageFile== null
                              ?Image.asset('assets/Images/upload .png'),
                          ),
                        ),
*/
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  height: 45.h,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (cont.title.text.isEmpty ||
                                          cont.actualPrice.text.isEmpty ||
                                          cont.discountPrice.text.isEmpty ||
                                          cont.engineType.text.isEmpty ||
                                          cont.mpg.text.isEmpty ||
                                          cont.drivetrain.text.isEmpty ||
                                          cont.transmission.text.isEmpty ||
                                          cont.door.text.isEmpty ||
                                          cont.seatCapacity.text.isEmpty ||
                                          cont.vin.text.isEmpty ||
                                          cont.location == null ||
                                          cont.typeId == null ||
                                          cont.exteriorColorId == null ||
                                          cont.interiorColorId == null ||
                                          cont.imagesPath.isEmpty &&
                                              cont.images1.isEmpty &&
                                              cont.images2.isEmpty &&
                                              cont.images3.isEmpty) {
                                        Get.snackbar(tr("Fill"), tr("Please Fill all Fields"));
                                      } else {
                                        if (widget.isEdited) {
                                          cont.postingEdited(context);
                                        } else {
                                          cont.postingAdd1(context);
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: const Color(0xFF054255),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(16.0, 10.0, 12.0, 10.0),
                                    ),
                                    child: CustomText(
                                      text: tr('Submit'),
                                      fontColor: const Color(0xffFFFFFF),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
          },
        ));
  }

  _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      if (isImages == 0) {
        addPostCont.images.add(File(pickedFile.path));
      } else {
        addPostCont.image = File(pickedFile.path);
      }
      setState(() {});
    }
  }

  _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (isImages == 0) {
        addPostCont.images.add(File(pickedFile.path));
      } else {
        addPostCont.image = File(pickedFile.path);
      }
    }
    setState(() {});
  }

  _openCamera1(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      if (isImages == 0) {
        addPostCont.images1.add(File(pickedFile.path));
      } else {
        addPostCont.image1 = File(pickedFile.path);
      }
      setState(() {});
    }
  }

  _openGallery1(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (isImages == 0) {
        addPostCont.images1.add(File(pickedFile.path));
      } else {
        addPostCont.image1 = File(pickedFile.path);
      }
    }
    setState(() {});
  }

  _openCamera2(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      if (isImages == 0) {
        addPostCont.images2.add(File(pickedFile.path));
      } else {
        addPostCont.image2 = File(pickedFile.path);
      }
      setState(() {});
    }
  }

  _openGallery2(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (isImages == 0) {
        addPostCont.images2.add(File(pickedFile.path));
      } else {
        addPostCont.image2 = File(pickedFile.path);
      }
    }
    setState(() {});
  }

  _openCamera3(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      if (isImages == 0) {
        addPostCont.images3.add(File(pickedFile.path));
      } else {
        addPostCont.image3 = File(pickedFile.path);
      }
      setState(() {});
    }
  }

  _openGallery3(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (isImages == 0) {
        addPostCont.images3.add(File(pickedFile.path));
      } else {
        addPostCont.image3 = File(pickedFile.path);
      }
    }
    setState(() {});
  }

  Future _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              tr("Choose option"),
              style: TextStyle(color: const Color(0xff000000).withOpacity(.6)),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                      Navigator.pop(context);
                    },
                    title: Text(tr("Gallery")),
                    leading: const Icon(
                      Icons.account_box,
                      color: Color(0xff8C8FA5),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                      Navigator.pop(context);
                    },
                    title: Text(tr("Camera")),
                    leading: const Icon(
                      Icons.camera,
                      color: Color(0xff8C8FA5),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _showChoiceDialog1(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              tr("Choose option"),
              style: TextStyle(color: const Color(0xff000000).withOpacity(.6)),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    onTap: () {
                      _openGallery1(context);
                      Navigator.pop(context);
                    },
                    title: Text(tr("Gallery")),
                    leading: const Icon(
                      Icons.account_box,
                      color: Color(0xff8C8FA5),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera1(context);
                      Navigator.pop(context);
                    },
                    title: Text(tr("Camera")),
                    leading: const Icon(
                      Icons.camera,
                      color: Color(0xff8C8FA5),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _showChoiceDialog2(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              tr("Choose option"),
              style: TextStyle(color: const Color(0xff000000).withOpacity(.6)),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    onTap: () {
                      _openGallery2(context);
                      Navigator.pop(context);
                    },
                    title: Text(tr("Gallery")),
                    leading: const Icon(
                      Icons.account_box,
                      color: Color(0xff8C8FA5),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera2(context);
                      Navigator.pop(context);
                    },
                    title: Text(tr("Camera")),
                    leading: const Icon(
                      Icons.camera,
                      color: Color(0xff8C8FA5),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _showChoiceDialog3(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              tr("Choose option"),
              style: TextStyle(color: const Color(0xff000000).withOpacity(.6)),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    onTap: () {
                      _openGallery3(context);
                      Navigator.pop(context);
                    },
                    title: Text(tr("Gallery")),
                    leading: const Icon(
                      Icons.account_box,
                      color: Color(0xff8C8FA5),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera3(context);
                      Navigator.pop(context);
                    },
                    title: Text(tr("Camera")),
                    leading: const Icon(
                      Icons.camera,
                      color: Color(0xff8C8FA5),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: _mode,
      language: 'en',
      strictbounds: false,
      types: [""],
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
      components: [
        // Component(Component.country, "pk"),
        // Component(Component.country, "usa"),
        // Component(Component.country, "ind")
      ],
    );

    displayPrediction(p!, homeScaffoldKey.currentState);
  }

  onError(PlacesAutocompleteResponse response) {
    // homeScaffoldKey.currentState!
    //     .showSnackBar(SnackBar(content: Text(response.errorMessage!)));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future displayPrediction(Prediction p, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);
    addPostCont.lat = detail.result.geometry!.location.lat.toString();
    addPostCont.long = detail.result.geometry!.location.lng.toString();
    address = detail.result.formattedAddress;
    addPostCont.location = detail.result.formattedAddress;
    print("///////////////////////////////////");
    print(addPostCont.lat);
    print(addPostCont.long);
    print(detail.result.formattedAddress);
    setState(() {});
  }
}
