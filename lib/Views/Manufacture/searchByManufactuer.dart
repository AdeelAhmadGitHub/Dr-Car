import 'package:dr_cars/Controllers/buyer_home_controller.dart';
import 'package:dr_cars/search_places_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Controllers/home_controller.dart';
import '../../Widgets/custom_text.dart';
import '../FilterAndSort/FilterAndSort.dart';
import '../MapFilter/MapFilter.dart';
import '../filter_detail/filter_detail_screen.dart';

class SearchByManufacture extends StatefulWidget {
  const SearchByManufacture({Key? key}) : super(key: key);

  @override
  State<SearchByManufacture> createState() => _SearchByManufactureState();
}

class _SearchByManufactureState extends State<SearchByManufacture> {
  final homeCont = Get.put(HomeController());
  @override
  void initState() {
    // TODO: implement initState
    homeCont.manufactureIdSearch = '';
    super.initState();
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
        child: GetBuilder<HomeController>(
          builder: (cont) {
            return Scaffold(
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
                          text: tr('Filter Search'),
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
                bottomNavigationBar: Container(
                  height: 70.h,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff034B65),
                        Color.fromRGBO(2, 25, 33, 1),
                      ],
                    ),
                  ),
                  child: BottomNavigationBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    unselectedItemColor: Colors.white,
                    selectedItemColor: const Color(0xffFFDA15),
                    items: <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.filter_list_outlined),
                        label: tr('Filter And Sort'),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.sort),
                        label: tr('Filter with Map'),
                      ),
                    ],
                    type: BottomNavigationBarType.fixed,
                    onTap: (value) {
                      if (value == 0) {
                        Get.to(FilterAndSort());
                      } else {
                        Get.to(SearchPlacesScreen());
                      }
                    },
                  ),
                ),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: cont.getSearchFilterModel!.data!.isEmpty
                      ? Center(
                          child: CustomText(
                          text: tr("No Data Found"),
                          fontSize: 20,
                          fontColor: Color(0xffFFFFFF),
                        ))
                      : GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: MediaQuery.of(context).size.width /
                                (MediaQuery.of(context).size.height / 1.44),
                            mainAxisSpacing: 1.0,
                            crossAxisSpacing: 1.0,
                          ),
                          itemCount: cont.getSearchFilterModel?.data?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) {
                            final value = cont.getSearchFilterModel?.data![index];
                            return InkWell(
                              onTap: () {
                                Get.to(() => FilerDetailsBuyer(
                                      title: value!.title ?? "",
                                      images: value.images ?? [],
                                      actualPrice: value.actualPrice ?? "",
                                      discountPrice: value.discountPrice ?? "",
                                      engineType: value.engineType ?? "",
                                      mpg: value.mpg ?? "",
                                      exteriorColor: value.exteriorColorId ?? "",
                                      interiorColor: value.interiorColorId ?? "",
                                      drivetrain: value.drivetrain ?? "",
                                      transmission: value.transmission ?? "",
                                      doors: value.door ?? "",
                                      seating: value.seatCapacity ?? "",
                                      vin: value.vin ?? "",
                                      stock: value.stock ?? "",
                                      windowSticker: value.windowSticker ?? "",
                                    ));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                color: const Color(0xffF4F8FB).withOpacity(.9),
                                elevation: 5,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 7.0..w, left: 7..w, top: 10..h),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(7),
                                            child: Image.network(
                                              value?.windowSticker ?? "",
                                              height: 37.h,
                                              width: 40.w,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                text: value?.title ?? "N/A",
                                                fontColor: const Color(0xff000000),
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.w700,
                                                textAlign: TextAlign.center,
                                              ),
                                              CustomText(
                                                text: value?.drivetrain ?? "N/A",
                                                //text: '3 years ago',
                                                fontColor: const Color(0xff000000),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 3.h),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          value?.featuredImage ?? "",
                                          height: 100.h,
                                          width: 144.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 3.h),
                                      CustomText(
                                        text: value?.actualPrice ?? "N/A",
                                        // text: '\$68,000.00',
                                        fontColor: const Color(0xff37CFDC),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.end,
                                      ),
                                      SizedBox(height: 3.h),
                                      Row(
                                        children: [
                                          Text(
                                            value?.actualPrice ?? "N/A",
                                            //'\$68,000.00',
                                            style: TextStyle(
                                              color: const Color(0xff000000),
                                              fontSize: 12.sp,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              decoration: TextDecoration.lineThrough,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4.w,
                                          ),
                                          CustomText(
                                            text: value?.discountPrice ?? "N/A",
                                            //text: '-20',
                                            fontColor: const Color(0xff000000),
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            textAlign: TextAlign.end,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 3.h),
                                      CustomText(
                                        text: value?.vin ?? "N/A",
                                        //text: 'BMW Z8 five',
                                        fontColor: const Color(0xff000000),
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.end,
                                      ),
                                      SizedBox(height: 3.h),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: const Color(0xff989595),
                                            size: 12.h,
                                          ),
                                          SizedBox(width: 3.w),
                                          SizedBox(
                                            // height: 30..h,
                                            width: 130..w,
                                            child: CustomText(
                                              text: value?.location ?? "N/A",
                                              // maxLine: 2,
                                              textOverflow: TextOverflow.ellipsis,
                                              //text: 'Mandalay',
                                              fontColor: const Color(0xff989595),
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 3.h),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 3.0),
                                            child: Container(
                                              height: 7,
                                              width: 7,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff989595),
                                                borderRadius: BorderRadius.circular(50.r),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 8.w),
                                          Row(
                                            children: [
                                              CustomText(
                                                text: value?.status ?? "N/A",
                                                //text: 'Sold',
                                                fontColor: const Color(0xff989595),
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );

                            /*SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                    color: Color(0xffF4F8FB).withOpacity(.9),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Image.asset(
                                "assets/Images/BMW Z Four.png",
                                height: 37.h,
                                width: 37.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Column(
                              children: [
                                CustomText(
                                  text: 'PS Admin',
                                  fontColor: const Color(0xff000000),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center,
                                ),
                                CustomText(
                                  text: '3 years ago',
                                  fontColor: const Color(0xff000000),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Image.asset(
                          "assets/Images/Rectangle 34.png",
                          height: 122.h,
                          width: 144.w,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(
                          text: 'BMW Z8 five',
                          fontColor: const Color(0xff000000),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomText(
                          text: '\$68,000.00',
                          fontColor: const Color(0xff37CFDC),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.end,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$68,000.00',
                              style: TextStyle(
                                color: const Color(0xff000000),
                                fontSize: 12.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            CustomText(
                              text: '-20',
                              fontColor: const Color(0xff000000),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: const Color(0xff989595),
                              size: 12.h,
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                            CustomText(
                              text: 'Mandalay',
                              fontColor: const Color(0xff989595),
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Container(
                                height: 7,
                                width: 7,
                                decoration: BoxDecoration(
                                  color: const Color(0xff989595),
                                  borderRadius:
                                      BorderRadius.circular(50.r),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Row(
                              children: [
                                CustomText(
                                  text: 'Sell',
                                  fontColor: const Color(0xff989595),
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 70.0.w),
                                  child: ImageIcon(
                                    AssetImage(
                                        "assets/Icons/share.png"),
                                    size: 15,
                                    color: Color(0xffBEB9B9),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );*/
                          },
                        ),
                ));
          },
        ));
  }
}
