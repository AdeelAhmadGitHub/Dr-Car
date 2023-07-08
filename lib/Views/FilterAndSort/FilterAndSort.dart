import 'package:dr_cars/Controllers/home_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Widgets/custom_text.dart';
import '../../search_places_screen.dart';
import '../Drawer/Drawer.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

class FilterAndSort extends StatefulWidget {
  const FilterAndSort({Key? key}) : super(key: key);

  @override
  State<FilterAndSort> createState() => _FilterAndSortState();
}

class _FilterAndSortState extends State<FilterAndSort> {
  final homeCont = Get.put(HomeController());
  List<String> location = [
    tr("Not Set"),
  ];
  List<String> type = [tr("Brand New"), tr("Used")];
  List<String> transmission = [
    tr("Auto"),
    tr("Manual"),
  ];
  String? currentLocationName;
  String? currentType;
  String? address;
  String? currentTransmission;
  final Mode _mode = Mode.fullscreen;

  @override
  void dispose() {
    // TODO: implement dispose
    homeCont.maximumCont.clear();
    homeCont.minimumCont.clear();
    currentType = '';
    homeCont.currentType = '';
    currentTransmission = '';
    address = '';
    homeCont.lat = '';
    homeCont.long = '';
    homeCont.currentTransmission = '';
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
          backgroundColor: Colors.transparent,
          drawer: const DrawerNavigation(),
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
                    child: Icon(Icons.keyboard_backspace_outlined))),
            title: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: tr('Search Filter'),
                    fontColor: const Color(0xffFFFFFF),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
          body: GetBuilder<HomeController>(
            builder: (controller) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomText(
                        text: tr("Price Range"),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontColor: Color(0xffFFFFFF),
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
                                    keyboardType: TextInputType.number,
                                    controller: controller.minimumCont,
                                    decoration: const InputDecoration(
                                      hintText: "\$0",
                                      hintStyle: TextStyle(color: Color(0xffC0C0C0)),
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
                                    keyboardType: TextInputType.number,
                                    controller: controller.maximumCont,
                                    decoration: const InputDecoration(
                                      hintText: "\$1000000000",
                                      hintStyle: TextStyle(color: Color(0xffC0C0C0)),
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
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 17.h),
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 330.w,
                                    child: CustomText(
                                      text: address ?? tr("Select Location"),
                                      fontColor: const Color(0xffC0C0C0),
                                    ),
                                  ),
                                ],
                              ),
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
                                text: tr("Select Type"),
                                fontColor: Color(0xffC0C0C0),
                              ),
                              icon: Align(
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Color(0xff000000),
                                ),
                              ),
                              value: currentType,
                              items: type
                                  .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: CustomText(
                                        text: e,
                                        fontColor: Color(0xff000000),
                                      )))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  currentType = value.toString();
                                  homeCont.currentType = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                      //   child: CustomText(
                      //     text: "Item Condition",
                      //     fontSize: 14.sp,
                      //     fontWeight: FontWeight.w500,
                      //     fontColor: Color(0xffFFFFFF),
                      //   ),
                      // ),
                      // DropdownButtonHideUnderline(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(3),
                      //       color: Color(0xffF4F8FB),
                      //     ),
                      //     width: double.infinity,
                      //     child: Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      //       child: DropdownButton(
                      //         hint: const CustomText(
                      //           text: "Not set",
                      //           fontColor: Color(0xff000000),
                      //         ),
                      //         icon: Align(
                      //           alignment: Alignment.centerRight,
                      //           child: const Icon(
                      //             Icons.keyboard_arrow_down_outlined,
                      //             color: Color(0xff000000),
                      //           ),
                      //         ),
                      //         value: currentLocationName,
                      //         items: location
                      //             .map((e) => DropdownMenuItem(
                      //                 value: e,
                      //                 child: CustomText(
                      //                   text: e,
                      //                   fontColor: Color(0xff000000),
                      //                 )))
                      //             .toList(),
                      //         onChanged: (value) {
                      //           setState(() {
                      //             currentLocationName = value.toString();
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                      //   child: CustomText(
                      //     text: "Price Type",
                      //     fontSize: 14.sp,
                      //     fontWeight: FontWeight.w500,
                      //     fontColor: Color(0xffFFFFFF),
                      //   ),
                      // ),
                      // DropdownButtonHideUnderline(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(3),
                      //       color: Color(0xffF4F8FB),
                      //     ),
                      //     width: double.infinity,
                      //     child: Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      //       child: DropdownButton(
                      //         hint: const CustomText(
                      //           text: "Not set",
                      //           fontColor: Color(0xff000000),
                      //         ),
                      //         icon: Align(
                      //           alignment: Alignment.centerRight,
                      //           child: const Icon(
                      //             Icons.keyboard_arrow_down_outlined,
                      //             color: Color(0xff000000),
                      //           ),
                      //         ),
                      //         value: currentLocationName,
                      //         items: location
                      //             .map((e) => DropdownMenuItem(
                      //                 value: e,
                      //                 child: CustomText(
                      //                   text: e,
                      //                   fontColor: Color(0xff000000),
                      //                 )))
                      //             .toList(),
                      //         onChanged: (value) {
                      //           setState(() {
                      //             currentLocationName = value.toString();
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
                                text: tr("Enter Auto/Manual Transmission"),
                                fontColor: Color(0xffC0C0C0),
                              ),
                              icon: Align(
                                alignment: Alignment.centerRight,
                                child: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Color(0xff000000),
                                ),
                              ),
                              value: currentTransmission,
                              items: transmission
                                  .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: CustomText(
                                        text: e,
                                        fontColor: Color(0xff000000),
                                      )))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  currentTransmission = value.toString();
                                  controller.currentTransmission = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      /*Padding(
                  padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                  child: CustomText(
                    text: "Color",
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
                        hint: const CustomText(
                          text: "Not set",
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
                ),*/
                      // Padding(
                      //   padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                      //   child: CustomText(
                      //     text: "Sold Out",
                      //     fontSize: 14.sp,
                      //     fontWeight: FontWeight.w500,
                      //     fontColor: Color(0xffFFFFFF),
                      //   ),
                      // ),
                      // DropdownButtonHideUnderline(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(3),
                      //       color: Color(0xffF4F8FB),
                      //     ),
                      //     width: double.infinity,
                      //     child: Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      //       child: DropdownButton(
                      //         hint: const CustomText(
                      //           text: "Not set",
                      //           fontColor: Color(0xff000000),
                      //         ),
                      //         icon: Align(
                      //           alignment: Alignment.centerRight,
                      //           child: const Icon(
                      //             Icons.keyboard_arrow_down_outlined,
                      //             color: Color(0xff000000),
                      //           ),
                      //         ),
                      //         value: currentLocationName,
                      //         items: location
                      //             .map((e) => DropdownMenuItem(
                      //                 value: e,
                      //                 child: CustomText(
                      //                   text: e,
                      //                   fontColor: Color(0xff000000),
                      //                 )))
                      //             .toList(),
                      //         onChanged: (value) {
                      //           setState(() {
                      //             currentLocationName = value.toString();
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                      //   child: CustomText(
                      //     text: "Fuel Type",
                      //     fontSize: 14.sp,
                      //     fontWeight: FontWeight.w500,
                      //     fontColor: Color(0xffFFFFFF),
                      //   ),
                      // ),
                      // DropdownButtonHideUnderline(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(3),
                      //       color: Color(0xffF4F8FB),
                      //     ),
                      //     width: double.infinity,
                      //     child: Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      //       child: DropdownButton(
                      //         hint: const CustomText(
                      //           text: "Not set",
                      //           fontColor: Color(0xff000000),
                      //         ),
                      //         icon: Align(
                      //           alignment: Alignment.centerRight,
                      //           child: const Icon(
                      //             Icons.keyboard_arrow_down_outlined,
                      //             color: Color(0xff000000),
                      //           ),
                      //         ),
                      //         value: currentLocationName,
                      //         items: location
                      //             .map((e) => DropdownMenuItem(
                      //                 value: e,
                      //                 child: CustomText(
                      //                   text: e,
                      //                   fontColor: Color(0xff000000),
                      //                 )))
                      //             .toList(),
                      //         onChanged: (value) {
                      //           setState(() {
                      //             currentLocationName = value.toString();
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                      //   child: CustomText(
                      //     text: "Build Type",
                      //     fontSize: 14.sp,
                      //     fontWeight: FontWeight.w500,
                      //     fontColor: Color(0xffFFFFFF),
                      //   ),
                      // ),
                      // DropdownButtonHideUnderline(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(3),
                      //       color: Color(0xffF4F8FB),
                      //     ),
                      //     width: double.infinity,
                      //     child: Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      //       child: DropdownButton(
                      //         hint: const CustomText(
                      //           text: "Not set",
                      //           fontColor: Color(0xff000000),
                      //         ),
                      //         icon: Align(
                      //           alignment: Alignment.centerRight,
                      //           child: const Icon(
                      //             Icons.keyboard_arrow_down_outlined,
                      //             color: Color(0xff000000),
                      //           ),
                      //         ),
                      //         value: currentLocationName,
                      //         items: location
                      //             .map((e) => DropdownMenuItem(
                      //                 value: e,
                      //                 child: CustomText(
                      //                   text: e,
                      //                   fontColor: Color(0xff000000),
                      //                 )))
                      //             .toList(),
                      //         onChanged: (value) {
                      //           setState(() {
                      //             currentLocationName = value.toString();
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 14.0.h, bottom: 14.h),
                      //   child: CustomText(
                      //     text: "Seller Type",
                      //     fontSize: 14.sp,
                      //     fontWeight: FontWeight.w500,
                      //     fontColor: Color(0xffFFFFFF),
                      //   ),
                      // ),
                      // DropdownButtonHideUnderline(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(3),
                      //       color: Color(0xffF4F8FB),
                      //     ),
                      //     width: double.infinity,
                      //     child: Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      //       child: DropdownButton(
                      //         hint: const CustomText(
                      //           text: "Not set",
                      //           fontColor: Color(0xff000000),
                      //         ),
                      //         icon: Align(
                      //           alignment: Alignment.centerRight,
                      //           child: const Icon(
                      //             Icons.keyboard_arrow_down_outlined,
                      //             color: Color(0xff000000),
                      //           ),
                      //         ),
                      //         value: currentLocationName,
                      //         items: location
                      //             .map((e) => DropdownMenuItem(
                      //                 value: e,
                      //                 child: CustomText(
                      //                   text: e,
                      //                   fontColor: Color(0xff000000),
                      //                 )))
                      //             .toList(),
                      //         onChanged: (value) {
                      //           setState(() {
                      //             currentLocationName = value.toString();
                      //           });
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(top: 36.0.h, bottom: 40.h),
                      //   child: MaterialButton(
                      //     onPressed: () {},
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.all(Radius.circular(12.0))),
                      //     elevation: 5.0,
                      //     minWidth: double.infinity,
                      //     height: 45,
                      //     color: Color(0xFF054255),
                      //     child: Text('Filter',
                      //         style: TextStyle(fontSize: 16.0, color: Colors.white)),
                      //   ),
                      // )
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 45.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.getSearchData();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF054255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.fromLTRB(16.0, 10.0, 12.0, 10.0),
                          ),
                          child: CustomText(
                            text: tr('Apply'),
                            fontColor: const Color(0xffFFFFFF),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
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
        hintText: tr('Search'),
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
    homeCont.lat = detail.result.geometry!.location.lat.toString();
    homeCont.long = detail.result.geometry!.location.lng.toString();
    address = detail.result.formattedAddress;
    print("///////////////////////////////////");
    print(homeCont.lat);
    print(homeCont.long);
    print(detail.result.formattedAddress);
    setState(() {});
  }
}
