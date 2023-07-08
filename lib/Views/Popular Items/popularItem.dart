import 'package:dr_cars/Controllers/buyer_home_controller.dart';
import 'package:dr_cars/Views/ManufactureDetails/Toyota/ManufactureDetialsScreenBuyer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Models/GetHomePageModel.dart';
import '../../Widgets/custom_text.dart';

class PopularUploadItems extends StatefulWidget {
  const PopularUploadItems({Key? key}) : super(key: key);

  @override
  State<PopularUploadItems> createState() => _PopularUploadItems();
}

class _PopularUploadItems extends State<PopularUploadItems> {
  final homeBuyerCont = Get.put(BuyerHomeController());
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/Homebck.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: GetBuilder<BuyerHomeController>(
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
                          text: tr('Recent Upload Items'),
                          fontColor: const Color(0xffFFFFFF),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                        ),
                        const ImageIcon(
                            size: 22,
                            color: Colors.white,
                            AssetImage(
                              "assets/Icons/search.png",
                            )),
                      ],
                    ),
                  ),
                ),
                backgroundColor: Colors.transparent,
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio:
                          MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.45),
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                    ),
                    itemCount: cont.getAllRecentViewModel?.recentListing?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      final value = cont.getAllRecentViewModel!.recentListing![index];
                      return GestureDetector(
                        onTap: () {
                          cont.currentBuyerData = RecentListingB(
                              id: value.id ?? 1,
                              userId: value.userId ?? "",
                              title: value.title ?? "",
                              engineType: value.engineType ?? "",
                              images: value.images!,
                              exteriorColorId: value.exteriorColorId ?? "",
                              actualPrice: value.actualPrice ?? "",
                              discountPrice: value.discountPrice ?? "",
                              door: value.door ?? "",
                              interiorColorId: value.interiorColorId ?? "",
                              mpg: value.mpg ?? "",
                              drivetrain: value.drivetrain ?? "",
                              transmission: value.transmission ?? "",
                              seatCapacity: value.seatCapacity ?? "",
                              typeId: value.typeId ?? "",
                              vin: value.vin ?? "",
                              // stock: value.stock! ?? "",
                              location: value.location ?? "",
                              status: value.status ?? "",
                              windowSticker: value.windowSticker ?? "",
                              featuredImage: value.featuredImage ?? "",
                              createdAt: value.createdAt ?? "",
                              updatedAt: value.updatedAt ?? "",
                              discountPercentage: value.discountPercentage ?? "");
                          Get.to(ManufactureDetailsBuyer());
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          color: const Color(0xffF4F8FB).withOpacity(.9),
                          elevation: 5,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.0..h, right: 10..w, left: 10..w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // ClipRRect(
                                    //   borderRadius: BorderRadius.circular(7),
                                    //   child: Image.network(
                                    //     value.featuredImage!,
                                    //     height: 37.h,
                                    //     width: 37.w,
                                    //     fit: BoxFit.fill,
                                    //   ),
                                    // ),
                                    SizedBox(width: 5.w),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: value.title ?? "N/A",
                                          fontColor: const Color(0xff000000),
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.center,
                                        ),
                                        CustomText(
                                          text: value.drivetrain ?? "N/A",
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
                                Container(
                                  decoration: BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(1, 2),
                                          blurRadius: 6,
                                          // spreadRadius: 0.01,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ]),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      value.images!.first,
                                      height: 100.h,
                                      width: 144.w,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7.h),
                                CustomText(
                                  text: value.discountPrice ?? "N/A",
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
                                      value.actualPrice ?? "N/A",
                                      //'\$68,000.00',
                                      style: TextStyle(
                                        color: const Color(0xff000000),
                                        fontSize: 12.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3.h),
                                CustomText(
                                  text: value.vin ?? "N/A",
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
                                    Flexible(
                                      // width: 120,
                                      child: CustomText(
                                        text: value.location ?? "N/A", softWrap: true,
                                        textOverflow: TextOverflow.ellipsis,
                                        // maxLine: 2,
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
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Row(
                                      children: [
                                        CustomText(
                                          text: value.status == "1" ? tr("Brand new") : tr("Used"),
                                          // text: 'Sold',
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

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../Widgets/custom_text.dart';
//
// class PopularUploadItems extends StatefulWidget {
//   const PopularUploadItems({Key? key}) : super(key: key);
//
//   @override
//   State<PopularUploadItems> createState() => _PopularUploadItemsState();
// }
//
// class _PopularUploadItemsState extends State<PopularUploadItems> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/Images/Homebck.png'),
//           fit: BoxFit.fill,
//         ),
//       ),
//       child: Scaffold(
//           appBar: AppBar(
//             titleSpacing: 20,
//             automaticallyImplyLeading: false,
//             elevation: 0,
//             backgroundColor: Colors.transparent,
//             leading: Padding(
//               padding: EdgeInsets.only(left: 10.0.w, top: 25.h),
//               child: GestureDetector(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: const ImageIcon(
//                     size: 22,
//                     color: Colors.white,
//                     AssetImage(
//                       "assets/Icons/back arrow.png",
//                     )),
//               ),
//             ),
//             title: Padding(
//               padding: EdgeInsets.only(top: 25.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomText(
//                     text: 'Popular Upload Items',
//                     fontColor: const Color(0xffFFFFFF),
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.w600,
//                     textAlign: TextAlign.start,
//                   ),
//                   const ImageIcon(
//                       size: 22,
//                       color: Colors.white,
//                       AssetImage(
//                         "assets/Icons/search.png",
//                       )),
//                 ],
//               ),
//             ),
//           ),
//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//             child: SafeArea(
//                 child: Padding(
//                   padding:
//                   EdgeInsets.only(left: 20.0.w, top: 30.0.h, right: 20.0.w),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 13.h,
//                       ),
//                       SingleChildScrollView(
//                         child: SizedBox(
//                           height: MediaQuery.of(context).size.height,
//                           child: GridView.builder(
//                             //  padding: EdgeInsets.all(16),
//                             gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 2,
//                               childAspectRatio: 1.0,
//                               crossAxisSpacing: 9.0,
//                               mainAxisSpacing: 9.0,
//                             ),
//                             itemCount: 4,
//                             itemBuilder: (BuildContext context, int index) {
//                               return Container(
//                                 color: Colors.red,
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius: BorderRadius.circular(120),
//                                           child: Image.asset(
//                                             "assets/Images/pic.png",
//                                             height: 37.h,
//                                             width: 37.w,
//                                             fit: BoxFit.fill,
//                                           ),
//                                         ),
//                                         Column(
//                                           children: [
//                                             CustomText(
//                                               text: 'PS Admin',
//                                               fontColor: const Color(0xff000000),
//                                               fontSize: 14.sp,
//                                               fontWeight: FontWeight.w400,
//                                               textAlign: TextAlign.center,
//                                             ),
//                                             CustomText(
//                                               text: '3 years ago',
//                                               fontColor: const Color(0xff000000),
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.w400,
//                                               textAlign: TextAlign.center,
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     Image.asset(
//                                       "assets/Images/Rectangle 34.png",
//                                       height: 122.h,
//                                       width: 144.w,
//                                       fit: BoxFit.fill,
//                                     ),
//                                     SizedBox(
//                                       height: 5.h,
//                                     ),
//                                     CustomText(
//                                       text: 'BMW Z8 five',
//                                       fontColor: const Color(0xff000000),
//                                       fontSize: 13.sp,
//                                       fontWeight: FontWeight.w600,
//                                       textAlign: TextAlign.end,
//                                     ),
//                                     SizedBox(
//                                       height: 5.h,
//                                     ),
//                                     CustomText(
//                                       text: '\$68,000.00',
//                                       fontColor: const Color(0xff37CFDC),
//                                       fontSize: 13.sp,
//                                       fontWeight: FontWeight.w600,
//                                       textAlign: TextAlign.end,
//                                     ),
//                                     SizedBox(
//                                       height: 4.h,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Text(
//                                           '\$68,000.00',
//                                           style: TextStyle(
//                                             color: const Color(0xff000000),
//                                             fontSize: 12.sp,
//                                             fontFamily: 'Inter',
//                                             fontWeight: FontWeight.w500,
//                                             decoration: TextDecoration.lineThrough,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 4.w,
//                                         ),
//                                         CustomText(
//                                           text: '-20',
//                                           fontColor: const Color(0xff000000),
//                                           fontSize: 12.sp,
//                                           fontWeight: FontWeight.w500,
//                                           textAlign: TextAlign.end,
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 3.h,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Icon(
//                                           Icons.location_on_outlined,
//                                           color: const Color(0xff989595),
//                                           size: 12.h,
//                                         ),
//                                         SizedBox(
//                                           width: 3.w,
//                                         ),
//                                         CustomText(
//                                           text: 'Mandalay',
//                                           fontColor: const Color(0xff989595),
//                                           fontSize: 10.sp,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 3.h,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(left: 3.0),
//                                           child: Container(
//                                             height: 7,
//                                             width: 7,
//                                             decoration: BoxDecoration(
//                                               color: const Color(0xff989595),
//                                               borderRadius:
//                                               BorderRadius.circular(50.r),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 8.w,
//                                         ),
//                                         Row(
//                                           children: [
//                                             CustomText(
//                                               text: 'Sell',
//                                               fontColor: const Color(0xff989595),
//                                               fontSize: 10.sp,
//                                               fontWeight: FontWeight.w500,
//                                             ),
//                                             Padding(
//                                               padding:
//                                               EdgeInsets.only(left: 70.0.w),
//                                               child: ImageIcon(
//                                                 AssetImage(
//                                                     "assets/Icons/share.png"),
//                                                 size: 15,
//                                                 color: Color(0xffBEB9B9),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )),
//           )),
//     );
//   }
// }
