import 'package:carousel_slider/carousel_slider.dart';
import 'package:dr_cars/Controllers/auth_Controller.dart';
import 'package:dr_cars/Controllers/home_controller.dart';
import 'package:dr_cars/Views/ManufactureDetails/ManufactureDetailsModel.dart';
import 'package:dr_cars/Views/Posting%20Add/Posting%20add1.dart';
import 'package:dr_cars/Widgets/CustomButton.dart';
import 'package:dr_cars/Widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import '../../Controllers/buyer_home_controller.dart';

class ManufactureDetails extends StatefulWidget {
  final bool? isShow;

  const ManufactureDetails({Key? key, this.isShow}) : super(key: key);

  @override
  State<ManufactureDetails> createState() => _ManufactureDetailsState();
}

class _ManufactureDetailsState extends State<ManufactureDetails> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final homeCont = Get.put(HomeController());
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: homeCont.dataList?.title,
                      // text: '2015 Kia Forte',
                      fontColor: const Color(0xffFFFFFF),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 200.h,
                              child: Card(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 30.h, left: 20.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        Get.back();
                                        Get.to(PostingAdd1(
                                          isEdited: true,
                                        ));
                                      },
                                      child: Text(
                                        tr("Edit"),
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff00ABD3)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    left: 35.w, right: 35.w, top: 307.h, bottom: 300.h),
                                                child: Center(
                                                  child: Card(
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: 15.w, vertical: 15.h),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            tr("Are you sure you want to Delete your add?"),
                                                            style: TextStyle(
                                                                fontSize: 18.sp,
                                                                fontWeight: FontWeight.w400,
                                                                color: const Color(0xffFF0000)),
                                                          ),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 150.w,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () async {
                                                                  await Get.find<HomeController>()
                                                                      .deleteAddPost();
                                                                },
                                                                child: Text(
                                                                  tr("Yes"),
                                                                  style: TextStyle(
                                                                      fontSize: 20.sp,
                                                                      fontWeight: FontWeight.w400,
                                                                      color: const Color(0xff00ABD3)),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 40.w,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Get.back();
                                                                },
                                                                child: Text(
                                                                  tr("No"),
                                                                  style: TextStyle(
                                                                      fontSize: 20.sp,
                                                                      fontWeight: FontWeight.w400,
                                                                      color: const Color(0xff00ABD3)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Text(
                                        tr("Delete"),
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xffFF0000)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        tr("Cancel"),
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff000000)),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                            );
                          });
                    },
                    icon: const Icon(
                      Icons.more_vert_outlined,
                    ),
                  ),
                )
              ]
              /* <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25.h, right: 10.w),
                child: const ImageIcon(
                    size: 22,
                    color: Colors.white,
                    AssetImage(
                      "assets/Icons/upload.png",
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25.h, right: 20.w),
                child: const ImageIcon(
                    size: 22,
                    color: Colors.white,
                    AssetImage(
                      "assets/Icons/favorite.png",
                    )),
              ),
            ],*/
              ),
          backgroundColor: Colors.transparent,
          body: GetX<HomeController>(
            builder: (cont) {
              return cont.loadingMarkSold.value
                  ? const Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SingleChildScrollView(
                      child: SafeArea(
                        child: Container(
                          padding: const EdgeInsets.only(top: 20).r,
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
                                items: cont.dataList?.images?.map((i) {
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
                                height: 3.h,
                              ),
                              Container(
                                color: const Color(0xff00ABD3),
                                height: 3.h,
                                width: 330.w,
                              ),
/*
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.0.w, right: 20.0.w, top: 26.0.h),
                      child: Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                              controller: tabController,
                              indicatorSize: TabBarIndicatorSize.tab,
                              isScrollable: false,
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ).r,
                              indicatorWeight: 3.0,
                              indicatorColor: const Color(0xff00ABD3),
                              labelColor: const Color(0xff00ABD3),
                              labelStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              unselectedLabelColor: const Color(0xffFFFFFF),
                              unselectedLabelStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              tabs: const [
                                Tab(
                                  text: "BASICS",
                                ),
                                Tab(
                                  text: "WARRANTY",
                                ),
                              ]),
                        ),
                      ),
                    ),
*/
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
                                                  "\$ ${cont.dataList?.actualPrice ?? "N/A"}",
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
                                                  "\$${cont.dataList?.actualPrice ?? "N/A"}",
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
                                                  "\$${cont.dataList?.discountPrice ?? "N/A"}",
                                                  //"- 20",
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
                                                  cont.dataList?.engineType ?? "N/A",
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
                                                  cont.dataList?.mpg ?? "N/A",
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
                                                  cont.dataList?.exteriorColorId ?? "N/A",
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
                                                  cont.dataList?.interiorColorId ?? "N/A",
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
                                                  cont.dataList?.drivetrain ?? "N/A",
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
                                                  cont.dataList?.transmission ?? "N/A",
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
                                                  cont.dataList?.door ?? "N/A",
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
                                                  cont.dataList?.seatCapacity ?? "N/A",
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
                                                  cont.dataList?.vin ?? "N/A",
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
                                            tr("Stock #"),
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
                                                  cont.dataList?.stock ?? "N/A",
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
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      _windowImageDialog(context, cont.dataList!.windowSticker!);
                                    },
                                    child: Container(
                                      height: 53.h,
                                      decoration: const BoxDecoration(color: Color(0xffFFFFFF)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                                        child: Row(
                                          children: [
                                            Image.network(
                                              cont.dataList?.windowSticker ?? "N/A",
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
                                height: 15.h,
                              ),
                              Visibility(
                                visible: widget.isShow ?? true,
                                child: Container(
                                  height: 43,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [Color(0xFF033A4C), Color.fromRGBO(35, 156, 196, 0)])),
                                  child: MaterialButton(
                                    onPressed: () {
                                      cont.markASold();
                                    },
                                    child: Text(
                                      tr('Mark a Sold'),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
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
            //contentPadding: const EdgeInsets.only(bottom: 20),
            scrollable: true,
            content: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Stack(
                children: [
                  Image.network(url ?? "N/A", height: 400.h, width: double.infinity, fit: BoxFit.fill),
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
}
