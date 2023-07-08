import 'package:dr_cars/Controllers/buyer_home_controller.dart';
import 'package:dr_cars/Controllers/home_controller.dart';
import 'package:dr_cars/Views/Manufacture%20List/ManufactureModel.dart';
import 'package:dr_cars/Views/Manufacture/searchByManufactuer.dart';
import 'package:dr_cars/Widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../ManufactureDetails/ManufactureDetails.dart';

class ManufactureList extends StatefulWidget {
  const ManufactureList({Key? key}) : super(key: key);

  @override
  State<ManufactureList> createState() => _ManufactureListState();
}

class _ManufactureListState extends State<ManufactureList> {
  final homeBrowseCont = Get.put(HomeController());
  final List<ManufactureModel> list = ManufactureModel.dummyData;
  @override
  void dispose() {
    // TODO: implement dispose
    homeBrowseCont.manufactureIdSearch = "";
    super.dispose();
  }

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: tr('Manufacture List'),
                    fontColor: const Color(0xffFFFFFF),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                  ),
                  // const ImageIcon(
                  //     size: 22,
                  //     color: Colors.white,
                  //     AssetImage(
                  //       "assets/Icons/search.png",
                  //     )),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
              padding: EdgeInsets.only(left: 20.0.w, top: 30.0.h, right: 20.0.w),
              child: Column(
                children: [
/*                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Container(
                              width: 2.w,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff37CFDC),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CustomText(
                            text: 'AZ',
                            fontColor: Colors.white,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Center(
                            child: Container(
                              width: 2.w,
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff37CFDC),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      CustomText(
                        text: 'Sort',
                        fontColor: const Color(0xff37DC44),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )*/
                  SizedBox(
                    height: 13.h,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        //  padding: EdgeInsets.all(16),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 9.0,
                          mainAxisSpacing: 9.0,
                        ),
                        itemCount: homeBrowseCont.allManufacturesModel?.manufactures?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final homeBrowseValue = homeBrowseCont.allManufacturesModel?.manufactures?[index];
                          return GestureDetector(
                            onTap: () {
                              homeBrowseCont.manufactureIdSearch = homeBrowseValue?.id.toString();
                              homeBrowseCont.getSearchData();
                            },
                            child: Container(
                              height: 170.h,
                              width: 170.w,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 0.3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(homeBrowseValue?.bannerImage ?? "N/A"),
                                    fit: BoxFit.fill,
                                  )),
                              child: Column(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 76.0.h),
                                      child: CustomText(
                                        text: homeBrowseValue?.name,
                                        fontColor: Colors.white,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.0.w, top: 27.h),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Image.network(
                                          homeBrowseValue?.logo ?? "N/A",
                                          height: 35.h,
                                          width: 35.w,
                                          fit: BoxFit.fill,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            )),
          )),
    );
  }
}
