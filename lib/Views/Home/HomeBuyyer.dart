import 'package:dr_cars/Controllers/auth_Controller.dart';
import 'package:dr_cars/Controllers/buyer_home_controller.dart';
import 'package:dr_cars/Controllers/home_controller.dart';
import 'package:dr_cars/Models/DataList.dart';
import 'package:dr_cars/Models/GetHomePageModel.dart';
import 'package:dr_cars/Views/Drawer/Drawer.dart';
import 'package:dr_cars/Views/Popular%20Items/popularItem.dart';
import 'package:dr_cars/Views/Posting%20Add/Posting%20add1.dart';
import 'package:dr_cars/Views/Recent%20Upload%20Item/RecentUploadItems.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Models/image_model.dart';
import '../../Models/image_model.dart';
import '../../Widgets/custom_text.dart';
import '../Filter And Sort/Filter And Sort.dart';
import '../FilterAndSort/FilterAndSort.dart';
import '../Manufacture List/Manufacture List.dart';
import '../ManufactureDetails/ManufactureDetails.dart';
import '../ManufactureDetails/Toyota/ManufactureDetialsScreenBuyer.dart';

class HomeBuyer extends StatefulWidget {
  const HomeBuyer({Key? key}) : super(key: key);

  @override
  State<HomeBuyer> createState() => _HomeBuyerState();
}

class _HomeBuyerState extends State<HomeBuyer> {
  final homeBuyerCont = Get.put(BuyerHomeController());
  final homeCont = Get.put(HomeController());
  final auth = Get.put(AuthController());

  bool isSelected = false;
  List<int> selectedItem = [];

  int selectedIndex = 0;

  bool? isFavorite;

  // @override
  // void initState() {
  //   // homeCont.allManufactures();
  //   // TODO: implement initState
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/Homebck.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: GetX<BuyerHomeController>(builder: (cont) {
          if (cont.buyerHomeLoading.value) {
            return const Scaffold(
                body: Center(
                    child: CircularProgressIndicator(
              color: Color(0xff054255),
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
                                SizedBox(width: 5.h),
                                Row(
                                  children: [
                                    CustomText(
                                      text: tr('Hello'),
                                      fontColor: const Color.fromRGBO(255, 255, 255, 0.71),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(width: 5.h),
                                    CustomText(
                                      text:
                                          "${auth.userData?.value.firstName ?? "N/A"} ${auth.userData?.value.lastName ?? "N/A"}",
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
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.h).r,
                        child: Row(children: [
                          Flexible(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Get.to(const FilterAndSort());
                                },
                                child: Container(
                                    height: 41.h,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.search,
                                          color: Color.fromRGBO(142, 138, 138, 0.61),
                                          size: 30,
                                        ),
                                        Text(
                                          "Search",
                                          style: TextStyle(
                                              color: const Color.fromRGBO(142, 138, 138, 0.61),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Inter'),
                                        )
                                      ],
                                    )),
                              )),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(const FilterAndSort());
                            },
                            child: Container(
                              height: 41.h,
                              width: 67.w,
                              padding: const EdgeInsets.symmetric(horizontal: 25),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(25),
                                ),
                              ),
                              child: Image.asset(
                                "assets/Icons/setting.png",
                                height: 21..h,
                                width: 21..w,
                              ),
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  toolbarHeight: 130.h,
                ),
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                    child: SafeArea(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.0.w,
                            ),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              SizedBox(height: 30.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: tr('Browse items by  brand'),
                                    fontColor: const Color(0xffFFFFFF),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.start,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(ManufactureList());
                                    },
                                    child: CustomText(
                                      text: "View All",
                                      fontColor: const Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 100.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: homeCont.allManufacturesModel?.manufactures?.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final browseValue = homeCont.allManufacturesModel?.manufactures?[index];
                                    return Container(
                                      width: 60.w,
                                      margin: EdgeInsets.only(right: 38.w),
                                      child: GestureDetector(
                                        onTap: () {
                                          homeCont.manufactureIdSearch = browseValue?.id.toString();
                                          homeCont.getSearchData();
                                        },
                                        child: CircleAvatar(
                                          radius: 50.r,
                                          backgroundColor: Color(0xffFFFFFF),
                                          child: Image.network(
                                            browseValue?.logo ?? "",
                                            height: 50.h,
                                            width: 50.w,
                                            fit: BoxFit.cover,
                                            //ImageModel.dummyData[index].image,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomText(
                                    text: tr("Recent Upload Items"),
                                    fontColor: const Color(0xffFFFFFF),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp,
                                  ),
                                  cont.getBuyerHomePageModel!.recentListing!.isEmpty
                                      ? SizedBox(
                                          width: 1.w,
                                        )
                                      : Padding(
                                          padding: EdgeInsets.only(right: 25.w),
                                          child: InkWell(
                                            onTap: () {
                                              homeBuyerCont.getAllRecentView();
                                            },
                                            child: CustomText(
                                              text: tr("View All"),
                                              fontColor: const Color(0xff37CFDC),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 160.h,
                                width: double.infinity,
                                child: cont.getBuyerHomePageModel!.recentListing!.isEmpty
                                    ? Center(
                                        child: CustomText(
                                          text: tr("No Data found"),
                                          fontColor: Colors.white,
                                        ),
                                      )
                                    : ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: cont.getBuyerHomePageModel?.recentListing!.length ?? 0,
                                        itemBuilder: (context, index) {
                                          final recentData =
                                              cont.getBuyerHomePageModel!.recentListing![index];

                                          return SizedBox(
                                            width: 330.w,
                                            child: Padding(
                                              padding: EdgeInsets.only(right: 10.w),
                                              child: InkWell(
                                                onTap: () {
                                                  cont.currentBuyerData = recentData;
                                                  Get.to(const ManufactureDetailsBuyer());
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(15.r),
                                                    border:
                                                        Border.all(width: 1, color: const Color(0xffFFFFFF)),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          cont.currentBuyerData = recentData;
                                                          homeCont.userID = recentData.userId;
                                                          Get.to(const ManufactureDetailsBuyer());
                                                        },
                                                        child: Container(
                                                          height: 160.h,
                                                          width: 160.w,
                                                          padding: const EdgeInsets.all(0.5),
                                                          margin: const EdgeInsets.all(7.0),
                                                          decoration: BoxDecoration(
                                                              color: Colors.white,
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
                                                              recentData.featuredImage!,
                                                              loadingBuilder: (context, child,
                                                                      loadingProgress) =>
                                                                  (loadingProgress == null)
                                                                      ? child
                                                                      : Transform.scale(
                                                                          scale: 0.5,
                                                                          child:
                                                                              const CircularProgressIndicator()),
                                                              errorBuilder: (context, error, stackTrace) =>
                                                                  Icon(Icons.car_crash, size: 60.r),
                                                              //'assets/Images/bmwZ5.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 6.h),
                                                        child: Container(
                                                          width: 1.w,
                                                          height: 145.h,
                                                          decoration: BoxDecoration(
                                                            border: Border(
                                                              right: BorderSide(
                                                                  width: 1.w, color: const Color(0xff000000)),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 5.w),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(height: 7.h),
                                                          SizedBox(
                                                            width: 130..w,
                                                            child: CustomText(
                                                              text: recentData.title,
                                                              fontColor: const Color(0xff000000),
                                                              textOverflow: TextOverflow.ellipsis,
                                                              fontSize: 16.sp,
                                                              fontWeight: FontWeight.w500,
                                                              // textAlign: TextAlign.end,
                                                            ),
                                                          ),
                                                          SizedBox(height: 6.h),
                                                          CustomText(
                                                            text: "\$ ${recentData.discountPrice}",
                                                            // text: '\$68,000.00',
                                                            fontColor: const Color(0xff37CFDC),
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight.w500,
                                                            textAlign: TextAlign.end,
                                                          ),
                                                          SizedBox(height: 3.h),
                                                          Text(
                                                            "\$ ${recentData.actualPrice}",
                                                            style: TextStyle(
                                                              color: const Color(0xff000000),
                                                              fontSize: 14.sp,
                                                              fontFamily: 'Inter',
                                                              fontWeight: FontWeight.w500,
                                                              decoration: TextDecoration.lineThrough,
                                                            ),
                                                          ),
                                                          SizedBox(height: 3.h),
                                                          Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Icon(
                                                                Icons.location_on_outlined,
                                                                color: const Color(0xff989595),
                                                                size: 13.h,
                                                              ),
                                                              SizedBox(width: 3.w),
                                                              SizedBox(
                                                                width: 110,
                                                                height: 30..h,
                                                                child: CustomText(
                                                                  text: recentData.location,
                                                                  fontColor: const Color(0xff989595),
                                                                  maxLine: 2,
                                                                  fontSize: 13.sp,
                                                                  textOverflow: TextOverflow.ellipsis,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 30.h),
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: () async {
                                                                  print("EVEy thing Good");
                                                                  debugPrint("GVJHBKJNBLK");

                                                                  if (recentData.favorite == "1") {
                                                                    recentData.favorite = "0";
                                                                  } else {
                                                                    recentData.favorite = "1";
                                                                  }
                                                                  setState(() {});
                                                                  // homeController.restaurantIDF = product.id;
                                                                  // homeController.addRemoveFavorite();
                                                                },
                                                                child: SizedBox(
                                                                  height: 20.h,
                                                                  child: recentData.favorite == "0"
                                                                      ? const Icon(
                                                                          Icons.favorite_border,
                                                                          color: Color(0xffEC15FF),
                                                                        )
                                                                      : const Icon(
                                                                          Icons.favorite_border,
                                                                          color: Color(0xffBEB9B9),
                                                                        ),
                                                                ),
                                                              ),
                                                              SizedBox(width: 10.w),
                                                              CustomText(
                                                                text: recentData.typeId == "1"
                                                                    ? tr("Used")
                                                                    : tr("Brand new"),
                                                                //text: 'Brand new',
                                                                fontColor: selectedItem.contains(index)
                                                                    ? const Color(0xff179802)
                                                                    : const Color(0xff980202),
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight.w700,
                                                                textAlign: TextAlign.start,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20.h, right: 25.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: tr("Popular Items"),
                                      fontColor: const Color(0xffFFFFFF),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.sp,
                                    ),
                                    cont.getBuyerHomePageModel!.popularListing!.isEmpty
                                        ? SizedBox(
                                            width: 1.w,
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              Get.to(const PopularUploadItems());
                                            },
                                            child: CustomText(
                                              text: tr("View All"),
                                              fontColor: const Color(0xff37CFDC),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 160.h,
                                width: double.infinity,
                                child: cont.getBuyerHomePageModel!.popularListing!.isEmpty
                                    ? Center(
                                        child: CustomText(
                                          text: tr("No Data found"),
                                          fontColor: Colors.white,
                                        ),
                                      )
                                    : ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: cont.getBuyerHomePageModel?.popularListing!.length ?? 0,
                                        itemBuilder: (context, index) {
                                          final popularData =
                                              cont.getBuyerHomePageModel!.popularListing![index];
                                          return InkWell(
                                            onTap: () {
                                              cont.currentBuyerData = RecentListingB(
                                                  id: popularData.id,
                                                  userId: popularData.userId,
                                                  title: popularData.title,
                                                  actualPrice: popularData.actualPrice,
                                                  discountPrice: popularData.discountPrice,
                                                  engineType: popularData.engineType,
                                                  mpg: popularData.mpg,
                                                  exteriorColorId: popularData.exteriorColorId,
                                                  interiorColorId: popularData.interiorColorId,
                                                  drivetrain: popularData.drivetrain,
                                                  transmission: popularData.transmission,
                                                  door: popularData.door,
                                                  seatCapacity: popularData.seatCapacity,
                                                  typeId: popularData.typeId,
                                                  vin: popularData.vin,
                                                  stock: popularData.stock,
                                                  location: popularData.location,
                                                  status: popularData.status,
                                                  windowSticker: popularData.windowSticker,
                                                  featuredImage: popularData.featuredImage,
                                                  images: popularData.images,
                                                  createdAt: popularData.createdAt,
                                                  updatedAt: popularData.updatedAt,
                                                  discountPercentage: popularData.discountPercentage);
                                              Get.to(ManufactureDetailsBuyer());
                                            },
                                            child: SizedBox(
                                              width: 330.w,
                                              child: Padding(
                                                padding: EdgeInsets.only(right: 10.w),
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(20.r),
                                                      border: Border.all(
                                                          width: 1, color: const Color(0xffFFFFFF)),
                                                    ),
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          height: 160.h,
                                                          width: 160.w,
                                                          padding: const EdgeInsets.all(0.5),
                                                          margin: const EdgeInsets.all(7.0),
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
                                                              popularData.featuredImage!,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(top: 6.h),
                                                          child: Container(
                                                            width: 1.w,
                                                            height: 145.h,
                                                            decoration: BoxDecoration(
                                                              border: Border(
                                                                right: BorderSide(
                                                                    width: 1.w,
                                                                    color: const Color(0xff000000)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 8.w,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            CustomText(
                                                              text: popularData.title,
                                                              textOverflow: TextOverflow.ellipsis,
                                                              fontColor: const Color(0xff000000),
                                                              fontSize: 16.sp,
                                                              fontWeight: FontWeight.w600,
                                                              textAlign: TextAlign.end,
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            CustomText(
                                                              text: popularData.discountPrice,
                                                              //text: '\$68,000.00',
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
                                                                  popularData.actualPrice!,
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
                                                            SizedBox(
                                                              height: 3.h,
                                                            ),
                                                            Row(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Icon(
                                                                  Icons.location_on_outlined,
                                                                  color: const Color(0xff989595),
                                                                  size: 12.h,
                                                                ),
                                                                SizedBox(
                                                                  width: 3.w,
                                                                ),
                                                                SizedBox(
                                                                  height: 30..h,
                                                                  width: 110..w,
                                                                  child: CustomText(
                                                                    text: popularData.location,
                                                                    textOverflow: TextOverflow.ellipsis,
                                                                    maxLine: 2,
                                                                    fontColor: const Color(0xff989595),
                                                                    fontSize: 10.sp,
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(height: 3.h),
                                                            Container(
                                                              width: 90.w,
                                                              height: 1.h,
                                                              decoration: BoxDecoration(
                                                                border: Border(
                                                                  right: BorderSide(
                                                                      width: 1.w,
                                                                      color: const Color(0xff000000)),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(height: 30.h),
                                                            Row(
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    if (selectedItem.contains(index)) {
                                                                      selectedItem.remove(index);
                                                                    } else {
                                                                      selectedItem.add(index);
                                                                    }
                                                                    setState(() {});
                                                                  },
                                                                  child: selectedItem.contains(index)
                                                                      ? const Icon(
                                                                          Icons.favorite_border,
                                                                          color: Color(0xffEC15FF),
                                                                        )
                                                                      : const Icon(
                                                                          Icons.favorite_border,
                                                                          color: Color(0xffBEB9B9),
                                                                        ),
                                                                ),
                                                                SizedBox(width: 10.w),
                                                                CustomText(
                                                                  text: tr('Used'),
                                                                  fontColor: selectedItem.contains(index)
                                                                      ? const Color(0xff179802)
                                                                      : const Color(0xff980202),
                                                                  fontSize: 12.sp,
                                                                  fontWeight: FontWeight.w700,
                                                                  textAlign: TextAlign.start,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              CustomText(
                                text: tr("Nearby Items"),
                                fontColor: const Color(0xffFFFFFF),
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              cont.getBuyerHomePageModel!.nearbyListing!.isEmpty
                                  ? SizedBox(
                                      height: 100.h,
                                      width: double.infinity,
                                      child: Center(
                                        child: CustomText(
                                          text: tr("No Data found"),
                                          fontColor: Colors.white,
                                        ),
                                      ))
                                  : ListView.builder(
                                      physics: const ScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: cont.getBuyerHomePageModel?.nearbyListing!.length ?? 0,
                                      itemBuilder: (context, index) {
                                        final nearbyData = cont.getBuyerHomePageModel!.nearbyListing![index];
                                        return InkWell(
                                          onTap: () {
                                            cont.currentBuyerData = RecentListingB(
                                                id: nearbyData.id,
                                                userId: nearbyData.userId,
                                                title: nearbyData.title,
                                                engineType: nearbyData.engineType,
                                                images: nearbyData.images,
                                                exteriorColorId: nearbyData.exteriorColorId,
                                                actualPrice: nearbyData.actualPrice,
                                                discountPrice: nearbyData.discountPrice,
                                                door: nearbyData.door,
                                                interiorColorId: nearbyData.interiorColorId,
                                                mpg: nearbyData.mpg,
                                                drivetrain: nearbyData.drivetrain,
                                                transmission: nearbyData.transmission,
                                                seatCapacity: nearbyData.seatCapacity,
                                                typeId: nearbyData.typeId,
                                                vin: nearbyData.vin,
                                                stock: nearbyData.stock,
                                                location: nearbyData.location,
                                                status: nearbyData.status,
                                                windowSticker: nearbyData.windowSticker,
                                                featuredImage: nearbyData.featuredImage,
                                                createdAt: nearbyData.createdAt,
                                                updatedAt: nearbyData.updatedAt,
                                                discountPercentage: nearbyData.discountPercentage);

                                            Get.to(ManufactureDetailsBuyer());
                                          },
                                          child: SizedBox(
                                            width: 340.w,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15.h),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(10.r),
                                                    border:
                                                        Border.all(width: 1, color: const Color(0xffFFFFFF)),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        height: 110.h,
                                                        width: 120.w,
                                                        padding: const EdgeInsets.all(1.0),
                                                        margin: const EdgeInsets.all(7.0),
                                                        decoration: BoxDecoration(
                                                            // color: Colors.white,
                                                            borderRadius: BorderRadius.circular(8),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                offset: Offset(1, 1),
                                                                blurRadius: 1,
                                                                spreadRadius: 0.01,
                                                                color: Colors.black.withOpacity(0.3),
                                                              ),
                                                            ]),
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(8),
                                                          child: Image.network(
                                                            nearbyData.featuredImage!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                          top: 6.h,
                                                        ),
                                                        child: Container(
                                                          width: 1.w,
                                                          height: 100.h,
                                                          decoration: BoxDecoration(
                                                            border: Border(
                                                              right: BorderSide(
                                                                  width: 1.w, color: const Color(0xff000000)),
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
                                                            height: 5.h,
                                                          ),
                                                          CustomText(
                                                            text: nearbyData.title,
                                                            textOverflow: TextOverflow.ellipsis,
                                                            fontColor: const Color(0xff000000),
                                                            fontSize: 13.sp,
                                                            fontWeight: FontWeight.w600,
                                                            textAlign: TextAlign.end,
                                                          ),
                                                          SizedBox(height: 3.h),
                                                          CustomText(
                                                            text: nearbyData.actualPrice,
                                                            //text: '\$68,000.00',
                                                            fontColor: const Color(0xff37CFDC),
                                                            fontSize: 13.sp,
                                                            fontWeight: FontWeight.w600,
                                                            textAlign: TextAlign.end,
                                                          ),
                                                          SizedBox(
                                                            height: 3.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                nearbyData.actualPrice!,
                                                                // '\$68,000.00',
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
                                                                text: nearbyData.discountPrice,
                                                                //text: '-20',
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
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Icon(
                                                                Icons.location_on_outlined,
                                                                color: const Color(0xff989595),
                                                                size: 12.h,
                                                              ),
                                                              SizedBox(
                                                                width: 3.w,
                                                              ),
                                                              SizedBox(
                                                                height: 25..h,
                                                                width: 170..w,
                                                                child: CustomText(
                                                                  text: nearbyData.location,
                                                                  maxLine: 2,
                                                                  textOverflow: TextOverflow.ellipsis,
                                                                  // text: 'Mandalay',
                                                                  fontColor: const Color(0xff989595),
                                                                  fontSize: 10.sp,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          // SizedBox(
                                                          //   height: 3.h,
                                                          // ),
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
                                                                    text: nearbyData.status == "1"
                                                                        ? tr("Used")
                                                                        : tr("Brand new"),
                                                                    // text: 'Sell',
                                                                    fontColor: const Color(0xff989595),
                                                                    fontSize: 10.sp,
                                                                    fontWeight: FontWeight.w500,
                                                                  ),
/*
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 70.0.w),
                                                            child:
                                                                const ImageIcon(
                                                              AssetImage(
                                                                  "assets/Icons/share.png"),
                                                              size: 15,
                                                              color: Color(
                                                                  0xffBEB9B9),
                                                            ),
                                                          ),
*/
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            width: 50.w,
                                                            height: 1.h,
                                                            decoration: BoxDecoration(
                                                              border: Border(
                                                                left: BorderSide(
                                                                    width: 156.w,
                                                                    color: const Color(0xff000000)),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(height: 5.h),
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  if (selectedItem.contains(index)) {
                                                                    selectedItem.remove(index);
                                                                  } else {
                                                                    selectedItem.add(index);
                                                                  }
                                                                  setState(() {});
                                                                },
                                                                child: selectedItem.contains(index)
                                                                    ? const Icon(
                                                                        Icons.favorite_border,
                                                                        color: Color(0xffEC15FF),
                                                                      )
                                                                    : const Icon(
                                                                        Icons.favorite_border,
                                                                        color: Color(0xffBEB9B9),
                                                                      ),
                                                              ),
                                                              SizedBox(width: 10.w),
                                                              CustomText(
                                                                text: nearbyData.status == "1"
                                                                    ? tr("Used")
                                                                    : tr("Brand new"),
                                                                //text: 'Used',
                                                                fontColor: nearbyData.status == "1"
                                                                    ? const Color(0xff980202)
                                                                    : const Color(0xff179802),
                                                                fontSize: 12.sp,
                                                                fontWeight: FontWeight.w700,
                                                                textAlign: TextAlign.start,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                            ])))));
          }
        }));
  }
}
/*
                                    ListView.builder(
                                        itemCount: 7,
                                        physics: const ScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          SizedBox(
                                              //height: 170,
                                              width: double.infinity,
                                              child: Card(
                                                color: Color(0xffFFFFFF),
                                                  child: Row(
                                                      children: [
*/
/*
                                                        Image.asset(
                                                          "assets/Images/BMW Z Five.png",
                                                          height: 150.h,
                                                          width: 180.w,
                                                          fit: BoxFit.fill,
                                                        ),
*/ /*

*/
/*
                                                        Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              CustomText(
                                                                text: "BMW Z8 five",
                                                                fontWeight: FontWeight
                                                                    .w600,
                                                                fontSize: 13,
                                                                fontColor:
                                                                Color(
                                                                    0xff000000),
                                                              ),
                                                              SizedBox(
                                                                  height: 5.h),
                                                              CustomText(
                                                                text: "\$68,000.00",
                                                                fontSize: 13,
                                                                fontWeight: FontWeight
                                                                    .w600,
                                                                fontColor:
                                                                Color(
                                                                    0xff009FC1),
                                                              ),
                                                              SizedBox(
                                                                  height: 5.h),
                                                              CustomText(
                                                                text: "\$85,000,00  -20%",
                                                                fontSize: 13,
                                                                fontWeight: FontWeight
                                                                    .w600,
                                                                fontColor:
                                                                Color(
                                                                    0xff009FC1),
                                                              ),
                                                              Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .location_on_outlined,
                                                                      color: Color(
                                                                          0xff989595),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 2
                                                                          .w,
                                                                    ),
                                                                    CustomText(
                                                                      text: "Mandalay",
                                                                      fontSize: 13,
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                      fontColor:
                                                                      Color(
                                                                          0xff009FC1),
                                                                    ),
                                                                  ])
*/ /*

*/ /*
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(80, 80, 80, 0.76),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: ListView.builder(
                      // margin: EdgeInsets.only(right: 30.w),
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () => Get.to(const ManufactureDetails()),
                          child: Container(
                              margin: EdgeInsets.only(bottom: 20.w),
                              width: double.infinity,
                              height: 152.h,
                              padding: const EdgeInsets.all(8.0).r,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(
                                    width: 1, color: const Color(0xffFFFFFF)),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      selectedIndex == 0
                                          ? GestureDetector(
                                              child: Image.asset(
                                                'assets/Images/BMW1.png',
                                                height: 100.h,
                                                width: 124.w,
                                              ),
                                            )
                                          : selectedIndex == 1
                                              ? Image.asset(
                                                  'assets/Images/BMW1.png',
                                                  height: 100.h,
                                                  width: 124.w,
                                                )
                                              : Image.asset(
                                                  'assets/Images/BMW1.png',
                                                  height: 100.h,
                                                  width: 124.w,
                                                ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 18.0.w),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (selectedItem
                                                    .contains(index)) {
                                                  selectedItem.remove(index);
                                                } else {
                                                  selectedItem.add(index);
                                                }
                                                setState(() {});
                                              },
                                              child: selectedItem
                                                      .contains(index)
                                                  ? const Icon(
                                                      Icons.favorite_border,
                                                      color: Color(0xffEC15FF),
                                                    )
                                                  : const Icon(
                                                      Icons.favorite_border,
                                                      color: Color(0xffBEB9B9),
                                                    ),
                                            ),
                                            const SizedBox(width: 5),
                                            CustomText(
                                              text: 'Brand new',
                                              fontColor:
                                                  selectedItem.contains(index)
                                                      ? const Color(0xff179802)
                                                      : const Color(0xff980202),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w700,
                                              textAlign: TextAlign.start,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 1,
                                    height: double.infinity,
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            width: 1, color: Color(0xff000000)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: 'Recent Upload Items',
                                          fontColor: const Color(0xff000000),
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700,
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 82.0.w),
                                              child: InkWell(
                                                onTap: () => Get.to(
                                                    const RecentUploadScreen()),
                                                child: CustomText(
                                                  text: 'View All',
                                                  fontColor:
                                                      const Color(0xff37CFDC),
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.w400,
                                                  textAlign: TextAlign.end,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        selectedIndex == 0
                                            ? CustomText(
                                                text: 'KIA',
                                                fontColor:
                                                    const Color(0xff000000),
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600,
                                                textAlign: TextAlign.end,
                                              )
                                            : selectedIndex == 1
                                                ? CustomText(
                                                    text: 'BMW Z8 five',
                                                    fontColor:
                                                        const Color(0xff000000),
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w600,
                                                    textAlign: TextAlign.end,
                                                  )
                                                : selectedIndex == 2
                                                    ? CustomText(
                                                        text: 'Toyota',
                                                        fontColor: const Color(
                                                            0xff000000),
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        textAlign:
                                                            TextAlign.end,
                                                      )
                                                    : CustomText(
                                                        text: 'Nissan',
                                                        fontColor: const Color(
                                                            0xff000000),
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        textAlign:
                                                            TextAlign.end,
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
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 4.w,
                                            ),
                                            CustomText(
                                              text: '-20',
                                              fontColor:
                                                  const Color(0xff000000),
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
                                              fontColor:
                                                  const Color(0xff989595),
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
                                              padding: const EdgeInsets.only(
                                                  left: 3.0),
                                              child: Container(
                                                height: 7,
                                                width: 7,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xff989595),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.r),
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
                                                  fontColor:
                                                      const Color(0xff989595),
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 70.0.w),
                                                  child: const ImageIcon(
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
                                ],
                              )),
                        );
                      },
                    ),
                  ),
*/ /*
*/
/*


                                                      ])
*/ /*

                                                  ])));
                                        })
*/
