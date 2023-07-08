import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Widgets/custom_text.dart';
import '../ManufactureDetailsModel.dart';

class Nissan extends StatefulWidget {
  const Nissan({Key? key}) : super(key: key);

  @override
  State<Nissan> createState() => _NissanState();
}

class _NissanState extends State<Nissan> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: '2015 BMW',
                    fontColor: const Color(0xffFFFFFF),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
/*
              Padding(
                padding: EdgeInsets.only(top: 25.h, right: 10.w),
                child: const ImageIcon(
                    size: 22,
                    color: Colors.white,
                    AssetImage(
                      "assets/Icons/upload.png",
                    )),
              ),
*/
              Padding(
                padding: EdgeInsets.only(top: 25.h, right: 20.w),
                child: const ImageIcon(
                    size: 22,
                    color: Colors.white,
                    AssetImage(
                      "assets/Icons/favorite.png",
                    )),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
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
                    Container(
                      height: 200,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/Images/1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, top: 26.0.h),
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
                              tabs: [
                                Tab(
                                  text: tr("BASICS"),
                                ),
                                Tab(
                                  text: tr("WARRANTY"),
                                ),
                              ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 500.h,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          SingleChildScrollView(
                            child: SizedBox(
                              height: 500.h,
                              child: ListView.builder(
                                physics: ScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                itemCount: list.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 10),
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      height: 50,
                                      color: Colors.white,
                                      child: Center(
                                        child: ListTile(
                                          leading: Text(
                                            textAlign: TextAlign.start,
                                            ManufactureDetailsModel.dummyData[index].leading,
                                            style: TextStyle(
                                              color: const Color(0xff132B47),
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          title: Padding(
                                            padding: const EdgeInsets.only(bottom: 8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ManufactureDetailsModel.dummyData[index].title,
                                                  style: TextStyle(
                                                      color: const Color(0xff132B47),
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w400,
                                                      decoration: index == 0
                                                          ? TextDecoration.lineThrough
                                                          : TextDecoration.none),
                                                ),
                                                index == 0
                                                    ? Text(
                                                        "-20",
                                                        style: TextStyle(
                                                          color: const Color(0xff132B47),
                                                          fontSize: 12.sp,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                      )
                                                    : SizedBox(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15, right: 15).r,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        height: 50.h,
                        width: double.infinity,
                        color: const Color(0xffF4F8FB),
                        child: ListTile(
                          leading: Image.asset('assets/Images/Sticker.png'),
                          title: CustomText(
                            text: 'VIEW ORIGINALWINDOW STICKER',
                            fontColor: const Color(0xff01AED9),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      height: 43,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFF033A4C), Color.fromRGBO(35, 156, 196, 0)])),
                      child: MaterialButton(
                        onPressed: () {},
                        child: Text(
                          tr('Mark a Sold'),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
