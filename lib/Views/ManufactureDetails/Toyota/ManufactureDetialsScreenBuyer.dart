import 'package:carousel_slider/carousel_slider.dart';
import 'package:dr_cars/Controllers/auth_Controller.dart';
import 'package:dr_cars/Controllers/home_controller.dart';
import 'package:dr_cars/Views/ManufactureDetails/ManufactureDetailsModel.dart';
import 'package:dr_cars/Views/Posting%20Add/Posting%20add1.dart';
import 'package:dr_cars/Views/chatScreen/chat_room_launcher.dart';
import 'package:dr_cars/Widgets/CustomButton.dart';
import 'package:dr_cars/Widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Controllers/buyer_home_controller.dart';
import '../../../Utils/app_constants.dart';
import '../../SignUp/SignUp.dart';

class ManufactureDetailsBuyer extends StatefulWidget {
  const ManufactureDetailsBuyer({Key? key}) : super(key: key);

  @override
  State<ManufactureDetailsBuyer> createState() => _ManufactureDetailsBuyerState();
}

class _ManufactureDetailsBuyerState extends State<ManufactureDetailsBuyer> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // final homeCont = Get.put(HomeController());
    final auth = Get.put(AuthController());

    final cont = Get.put(BuyerHomeController());
    TabController tabController = TabController(length: 2, vsync: this);
    final List<ManufactureDetailsModel> list = ManufactureDetailsModel.dummyData;

    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/Homebck.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
// titleSpacing: 40,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: EdgeInsets.only(top: 25.h),
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
                text: cont.currentBuyerData?.title,
                // text: '2015 Kia Forte',
                fontColor: const Color(0xffFFFFFF),
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: GetBuilder<BuyerHomeController>(
            builder: (cont) {
              return SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10).r,
                    child: Column(
                      children: [
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
                        SizedBox(height: 25.h),
                        CarouselSlider(
                          options: CarouselOptions(
                            disableCenter: false,
                            aspectRatio: 16 / 8,
                            initialPage: 0,
                            viewportFraction: 1,
                            // 0.8,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            reverse: false,
                            height: 200.h,
                            enableInfiniteScroll: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            // autoPlayAnimationDuration:
                            //     const Duration(milliseconds: 2200),
                            pauseAutoPlayOnTouch: true,
                            scrollDirection: Axis.horizontal,
                            pageSnapping: true,
                            onPageChanged: (index, val) {
                              print('current index $index');
                              //currentIndex = index;
                              setState(() {});
                            },
                          ),
                          items: cont.currentBuyerData?.images!.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  height: 200,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      i ?? "N/A",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        CustomText(
                          text: tr("Vehicle Details"),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          fontColor: const Color(0xff00ABD3),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          color: const Color(0xff00ABD3),
                          height: 3.h,
                          width: 330.w,
                        ),

                        SizedBox(height: 20.h),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                color: Colors.white,
                                child: Center(
                                  child: ListTile(
                                    leading: Text(
                                      textAlign: TextAlign.start,
                                      tr("Actual Price"),
                                      style: TextStyle(
                                        color: const Color(0xff132B47),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "\$ ${cont.currentBuyerData?.actualPrice ?? "N/A"}",
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                color: Colors.white,
                                child: Center(
                                  child: ListTile(
                                    leading: Text(
                                      textAlign: TextAlign.start,
                                      tr("Discounted Price"),
                                      style: TextStyle(
                                        color: const Color(0xff132B47),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "\$${cont.currentBuyerData?.actualPrice ?? "N/A"}",
                                            style: TextStyle(
                                                color: const Color(0xff132B47),
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                                decoration: TextDecoration.lineThrough),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "\$${cont.currentBuyerData?.discountPrice ?? "N/A"}",
                                            // "- 20",
                                            style: TextStyle(
                                              color: const Color(0xff009FC1),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                color: Colors.white,
                                child: Center(
                                  child: ListTile(
                                    leading: Text(
                                      textAlign: TextAlign.start,
                                      tr("Engine Type"),
                                      style: TextStyle(
                                        color: const Color(0xff132B47),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            cont.currentBuyerData?.engineType ?? "N/A",
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                color: Colors.white,
                                child: Center(
                                  child: ListTile(
                                    leading: Text(
                                      textAlign: TextAlign.start,
                                      tr("MPG"),
                                      style: TextStyle(
                                        color: const Color(0xff132B47),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            cont.currentBuyerData?.mpg ?? "N/A",
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                color: Colors.white,
                                child: Center(
                                  child: ListTile(
                                    leading: Text(
                                      textAlign: TextAlign.start,
                                      tr("Exterior Color"),
                                      style: TextStyle(
                                        color: const Color(0xff132B47),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            cont.currentBuyerData?.exteriorColorId ?? "N/A",
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                color: Colors.white,
                                child: Center(
                                  child: ListTile(
                                    leading: Text(
                                      textAlign: TextAlign.start,
                                      tr("Interior Color"),
                                      style: TextStyle(
                                        color: const Color(0xff132B47),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            cont.currentBuyerData?.interiorColorId ?? "N/A",
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                color: Colors.white,
                                child: Center(
                                  child: ListTile(
                                    leading: Text(
                                      textAlign: TextAlign.start,
                                      tr("Drivetrain"),
                                      style: TextStyle(
                                        color: const Color(0xff132B47),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            cont.currentBuyerData?.drivetrain ?? "N/A",
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                color: Colors.white,
                                child: Center(
                                  child: ListTile(
                                    leading: Text(
                                      textAlign: TextAlign.start,
                                      tr("Transmission"),
                                      style: TextStyle(
                                        color: const Color(0xff132B47),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            cont.currentBuyerData?.transmission ?? "N/A",
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                color: Colors.white,
                                child: Center(
                                  child: ListTile(
                                    leading: Text(
                                      textAlign: TextAlign.start,
                                      tr("Doors"),
                                      style: TextStyle(
                                        color: const Color(0xff132B47),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            cont.currentBuyerData?.door ?? "N/A",
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                color: Colors.white,
                                child: Center(
                                  child: ListTile(
                                    leading: Text(
                                      textAlign: TextAlign.start,
                                      tr("Seating"),
                                      style: TextStyle(
                                        color: const Color(0xff132B47),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            cont.currentBuyerData?.seatCapacity ?? "N/A",
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: 50,
                                color: Colors.white,
                                child: Center(
                                  child: ListTile(
                                    leading: Text(
                                      textAlign: TextAlign.start,
                                      tr("VIN"),
                                      style: TextStyle(
                                        color: const Color(0xff132B47),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    title: Padding(
                                      padding: const EdgeInsets.only(bottom: 8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            cont.currentBuyerData?.vin ?? "N/A",
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            //   child: Container(
                            //     margin: const EdgeInsets.only(bottom: 10),
                            //     padding: const EdgeInsets.symmetric(horizontal: 10),
                            //     height: 50,
                            //     color: Colors.white,
                            //     child: Center(
                            //       child: ListTile(
                            //         leading: Text(
                            //           textAlign: TextAlign.start,
                            //           "Stock #",
                            //           style: TextStyle(
                            //             color: const Color(0xff132B47),
                            //             fontSize: 16.sp,
                            //             fontWeight: FontWeight.w500,
                            //           ),
                            //         ),
                            //         title: Padding(
                            //           padding: const EdgeInsets.only(bottom: 8.0),
                            //           child: Row(
                            //             mainAxisAlignment: MainAxisAlignment.end,
                            //             children: [
                            //               Text(
                            //                 cont.currentBuyerData?.stock ?? "N/A",
                            //                 style: TextStyle(
                            //                   color: const Color(0xff000000),
                            //                   fontSize: 16.sp,
                            //                   fontWeight: FontWeight.w500,
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: GestureDetector(
                              onTap: () {
                                _windowImageDialog(context, cont.currentBuyerData!.windowSticker!);
                              },
                              child: Container(
                                height: 53.h,
                                decoration: const BoxDecoration(color: Color(0xffFFFFFF)),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        cont.currentBuyerData?.windowSticker ?? "N/A",
                                        fit: BoxFit.cover,
                                        height: 40.h,
                                      ),
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      CustomText(
                                        text: tr('VIEW ORIGINAL WINDOW STICKER'),
                                        fontColor: const Color(0xff01AED9),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          height: 43,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Color(0xFF033A4C), Color.fromRGBO(35, 156, 196, 0)])),
                          child: MaterialButton(
                            onPressed: () async {
                              SharedPreferences prefss = await SharedPreferences.getInstance();
                              bool isLogin = (prefss.get(AppConstants().userdata) == null ? false : true);
                              print("isLogin $isLogin");
                              if (isLogin == true) {
                               print(' user id ${auth.userData?.value.userId.toString()}');
                               print(' user id list ${cont.currentBuyerData?.userId.toString()}');
                               if(auth.userData?.value.userId.toString()==cont.currentBuyerData?.userId.toString()){
                                 showToastMessage("Seller can't send message");
                               }else{
                                 ChatRoomLauncher().sendMessage(
                                   context,
                                   cont,
                                   cont.currentBuyerData?.userId,
                                   cont.currentBuyerData?.firstName,
                                   cont.currentBuyerData?.images![0],
                                   cont.currentBuyerData?.phone,
                                   cont.currentBuyerData?.deviceToken,
                                 );
                               }
                              } else {
                                Get.to(SignUp());
                              }
                            },
                            child: Text(
                              tr('Contact to seller'),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        // Visibility(
                        //   visible: widget.isShow ?? true,
                        //   child: Container(
                        //     height: 43,
                        //     width: double.infinity,
                        //     decoration: const BoxDecoration(
                        //         gradient: LinearGradient(
                        //             begin: Alignment.centerLeft,
                        //             end: Alignment.centerRight,
                        //             colors: [
                        //               Color(0xFF033A4C),
                        //               Color.fromRGBO(35, 156, 196, 0)
                        //             ])),
                        //     child: MaterialButton(
                        //       onPressed: () {
                        //         cont.markASold();
                        //       },
                        //       child: Text(
                        //         'Mark a Sold',
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 16.sp,
                        //             fontFamily: 'Inter',
                        //             fontWeight: FontWeight.w600),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 20,
                        // )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }

  void _windowImageDialog(BuildContext context, String url) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.transparent,
            contentPadding: const EdgeInsets.only(bottom: 20),
            scrollable: true,
            content: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Image.network(url ?? "N/A", height: 150.h, width: 500, fit: BoxFit.cover),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                      )),
                ],
              ),
            ));
      },
    );
  }

  void showToastMessage(String message){
    Fluttertoast.showToast(
        msg: message, //message to show toast
        toastLength: Toast.LENGTH_LONG, //duration for message to show
        gravity: ToastGravity.CENTER, //where you want to show, top, bottom
        timeInSecForIosWeb: 1, //for iOS only
        //backgroundColor: Colors.red, //background Color for message
        textColor: Colors.white, //message text color
        fontSize: 16.0 //message font size
    );
  }
}
