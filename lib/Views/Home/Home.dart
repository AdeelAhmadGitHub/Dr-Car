import 'package:dr_cars/Controllers/auth_Controller.dart';
import 'package:dr_cars/Models/getAcitveListModel.dart';
import 'package:dr_cars/Views/Drawer/Drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controllers/home_controller.dart';
import '../../Models/DataList.dart';
import '../../Models/image_model.dart';
import '../../Models/image_model.dart';
import '../../Utils/app_constants.dart';
import '../../Widgets/custom_text.dart';
import '../Manufacture List/Manufacture List.dart';
import '../ManufactureDetails/ManufactureDetails.dart';
import '../SignUp/SignUp.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSelected = false;
  List<int> selectedItem = [];
  // List<ImageModel> list = ImageModel().dummyData;
  int selectedIndex = 0;
  HomeController? homeCont;
  AuthController auth = Get.put(AuthController());
  gotcallf() async {
    SharedPreferences prefss = await SharedPreferences.getInstance();
    bool isLogin = (prefss.get(AppConstants().userdata) == null ? false : true);
    print("isLogin $isLogin");
    if (isLogin == true) {
      homeCont = Get.put(HomeController());
    } else {
      Get.to(SignUp());
    }
  }

  @override
  initState() {
    gotcallf();

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
      child: GetX<HomeController>(
        builder: (cont) {
          if (cont.loading.value) {
            return Scaffold(
                body: Center(
                    child: CircularProgressIndicator(
              color: Color(0xff044B62),
            )));
          } else {
            return Scaffold(
                drawer: const DrawerNavigation(),
                appBar: AppBar(
                  titleSpacing: 0,
                  elevation: 0,
                  title: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 20, right: 20).r,
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
                                  width: 5.h,
                                ),
                                Row(
                                  children: [
                                    CustomText(
                                      text: tr("Hello"),
                                      //text: 'Hello!',
                                      fontColor: const Color.fromRGBO(255, 255, 255, 0.71),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(width: 5.h),
                                    CustomText(
                                      text:
                                          "${auth!.userData!.value.firstName ?? "N/A"} ${auth!.userData!.value.lastName ?? "N/A"}",
                                      //text: 'Ronald',
                                      fontColor: const Color(0xffFFFFFF),
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w700,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.notifications_none_outlined,
                                    size: 25, color: Color(0xffFFFFFF)),
                                SizedBox(
                                  width: 5.h,
                                ),
                                Image.asset(
                                  'assets/Icons/icon.png',
                                  height: 50.h,
                                  width: 34.w,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 50.h,
                ),
                backgroundColor: Colors.transparent,
                body: SafeArea(
                    child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: listing.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 42.w),
                                decoration: BoxDecoration(
                                    color: selectedIndex == index ? Color(0xff063747) : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: const Color(0xff37CFDC))),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    child: CustomText(
                                      text: listing[index].text,
                                      fontColor: selectedIndex == index ? Colors.white : Color(0xff000000),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(child: selectedIndex == 0 ? activeListing() : previousListing())
                  ],
                )));
          }
        },
      ),
    );
  }

  Widget activeListing() {
    return GetBuilder<HomeController>(builder: (cont) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: RefreshIndicator(
          backgroundColor: Color(0xff044B62),
          displacement: 20,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: () async {
            await cont.getRefresh();
          },
          child: ListView.builder(
            // shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: cont.getActiveListingModel?.data?.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final data = cont.getActiveListingModel!.data!.data![index];
              return InkWell(
                onTap: () {
                  cont.dataList = data;
                  cont.dataList!.activeStatus != "1"
                      ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Waiting for admin approval"),
                          duration: Duration(seconds: 2),
                        ))
                      : Get.to(const ManufactureDetails(
                          isShow: true,
                        ));
                },
                child: Container(
                    margin: EdgeInsets.only(bottom: 25.w),
                    width: double.infinity,
                    height: 121.h,
                    // padding: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 4.0,
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  data.featuredImage!,
                                  height: 100.h,
                                  width: 110.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            width: 1,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(width: 1, color: Color(0xff000000)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            selectedIndex == 0
                                ? CustomText(
                                    text: "${data.title}",
                                    //text: 'KIA',
                                    fontColor: const Color(0xff000000),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.end,
                                  )
                                : selectedIndex == 1
                                    ? CustomText(
                                        text: "${data.mpg}",
                                        //text: 'BMW Z8 five',
                                        fontColor: const Color(0xff000000),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.end,
                                      )
                                    : selectedIndex == 2
                                        ? CustomText(
                                            text: "${data.status}",
                                            //text: 'Toyota',
                                            fontColor: const Color(0xff000000),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            textAlign: TextAlign.end,
                                          )
                                        : CustomText(
                                            text: "${data.drivetrain}",
                                            // text: 'Nissan',
                                            fontColor: const Color(0xff000000),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            textAlign: TextAlign.end,
                                          ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: "\$ ${data.actualPrice}",
                              //text: '\$68,000.00',
                              fontColor: const Color(0xff37CFDC),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.end,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$ ${data.actualPrice}",
                                  // '\$68,000.00',
                                  style: TextStyle(
                                    color: const Color(0xff000000),
                                    fontSize: 14.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                CustomText(
                                  text: "${data.discountPrice}",
                                  //text: '-20',
                                  fontColor: const Color(0xff000000),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: const Color(0xff989595),
                                  size: 13.h,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                SizedBox(
                                  width: 150.w,
                                  child: CustomText(
                                    text: "${data.location}",
                                    textOverflow: TextOverflow.ellipsis,
                                    //text: 'Mandalay',
                                    fontColor: const Color(0xff989595),
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                        const Spacer(),
                        selectedIndex == 1
                            ? Container(
                                height: double.maxFinite,
                                width: 37.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xff37CFDC),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.r),
                                      bottomRight: Radius.circular(20.r),
                                    )),
                                child: Center(
                                  child: RotatedBox(
                                    quarterTurns: 1,
                                    child: CustomText(
                                      text: "${data.actualPrice}",
                                      //text: "Sold",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontColor: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    )),
              );
            },
          ),
        ),
      );
    });
  }

  Widget previousListing() {
    return GetBuilder<HomeController>(builder: (cont) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: RefreshIndicator(
          backgroundColor: Color(0xff044B62),
          displacement: 40,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: () async {
            await cont.getRefresh();
          },
          child: ListView.builder(
            // physics: BouncingScrollPhysics(),
            // shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: cont.getPreviousListingModel?.data?.data?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              final data = cont.getPreviousListingModel!.data!.data![index];
              return InkWell(
                onTap: () {
                  cont.dataList = data;
                  Get.to(const ManufactureDetails(
                    isShow: false,
                  ));
                },
                child: Container(
                    margin: EdgeInsets.only(bottom: 20.w),
                    width: double.infinity,
                    height: 112.h,
                    // padding: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 4.0,
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  data.featuredImage!,
                                  height: 100.h,
                                  width: 110.w,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                            // Padding(
                            //   padding: EdgeInsets.only(left: 18.0.w),
                            //   child: Row(
                            //     children: [
                            //       InkWell(
                            //         onTap: () {
                            //           if (selectedItem
                            //               .contains(index)) {
                            //             selectedItem.remove(index);
                            //           } else {
                            //             selectedItem.add(index);
                            //           }
                            //           setState(() {});
                            //         },
                            //         child: selectedItem
                            //                 .contains(index)
                            //             ? const Icon(
                            //                 Icons.favorite_border,
                            //                 color: Color(0xffEC15FF),
                            //               )
                            //             : const Icon(
                            //                 Icons.favorite_border,
                            //                 color: Color(0xffBEB9B9),
                            //               ),
                            //       ),
                            //       const SizedBox(width: 5),
                            //       CustomText(
                            //         text: 'Brand new',
                            //         fontColor:
                            //             selectedItem.contains(index)
                            //                 ? const Color(0xff179802)
                            //                 : const Color(0xff980202),
                            //         fontSize: 12.sp,
                            //         fontWeight: FontWeight.w700,
                            //         textAlign: TextAlign.start,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            width: 1,
                            height: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(width: 1, color: Color(0xff000000)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            selectedIndex == 0
                                ? CustomText(
                                    text: "${data.title}",
                                    //text: 'KIA',
                                    fontColor: const Color(0xff000000),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.end,
                                  )
                                : selectedIndex == 1
                                    ? CustomText(
                                        text: "${data.mpg}",
                                        //text: 'BMW Z8 five',
                                        fontColor: const Color(0xff000000),
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.end,
                                      )
                                    : selectedIndex == 2
                                        ? CustomText(
                                            text: "${data.status}",
                                            //text: 'Toyota',
                                            fontColor: const Color(0xff000000),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                            textAlign: TextAlign.end,
                                          )
                                        : CustomText(
                                            text: "${data.drivetrain}",
                                            // text: 'Nissan',
                                            fontColor: const Color(0xff000000),
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                            textAlign: TextAlign.end,
                                          ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomText(
                              text: ""
                                  "\$ ${data.discountPrice}",
                              //text: '\$68,000.00',
                              fontColor: const Color(0xff37CFDC),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              textAlign: TextAlign.end,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$ ${data.actualPrice}",
                                  // '\$68,000.00',
                                  style: TextStyle(
                                    color: const Color(0xff000000),
                                    fontSize: 14.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                CustomText(
                                  text: "${data.discountPrice}",
                                  //text: '-20',
                                  fontColor: const Color(0xff000000),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: const Color(0xff989595),
                                  size: 13.h,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                CustomText(
                                  text: "${data.location}",
                                  //text: 'Mandalay',
                                  fontColor: const Color(0xff989595),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                        const Spacer(),
                        selectedIndex == 1
                            ? Container(
                                height: double.maxFinite,
                                width: 37.w,
                                decoration: BoxDecoration(
                                    color: const Color(0xff37CFDC),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20.r),
                                      bottomRight: Radius.circular(20.r),
                                    )),
                                child: Center(
                                  child: RotatedBox(
                                    quarterTurns: 1,
                                    child: CustomText(
                                      // text: "${data.status}",
                                      text: "Sold",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      fontColor: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox()
                      ],
                    )),
              );
            },
          ),
        ),
      );
    });
  }
}
