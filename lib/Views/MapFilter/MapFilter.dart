import 'package:dr_cars/Controllers/home_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Controllers/buyer_home_controller.dart';
import '../../Widgets/custom_text.dart';
import '../Drawer/Drawer.dart';

class MapFilter extends StatefulWidget {
  const MapFilter({Key? key}) : super(key: key);

  @override
  State<MapFilter> createState() => _MapFilterState();
}

class _MapFilterState extends State<MapFilter> {
  double _sliderValue = 100.0;
  final homeCont = Get.put(HomeController());
  void _onSliderChanged(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    homeCont.radius = '';
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
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
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
          title: CustomText(
            text: tr('Map Filter'),
            fontColor: const Color(0xffFFFFFF),
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
          ),
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    _sliderValue = 100.0;
                    setState(() {});
                  },
                  child: CustomText(
                    text: tr("RESET"),
                    fontColor: Color(0xffF4F8F8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    homeCont.radius = _sliderValue.toString();
                    homeCont.getSearchData();
                  },
                  child: CustomText(
                    text: tr("RESET"),
                    fontColor: Color(0xffF4F8F8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: 615.h,
              width: double.infinity,
              color: Color(0xffABD3DF),
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Color(0xff4AA9ED),
                radius: _sliderValue,
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          color: Colors.black.withOpacity(.8),
          height: 90.0.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomText(
                    text: tr("Browsing Around"),
                    fontColor: Color(0xffFFFFFF),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
                child: Slider(
                  activeColor: Color(0xff37DC44),
                  inactiveColor: Color(0xffB1FFB8),
                  value: _sliderValue,
                  max: 100,
                  min: 0,
                  onChanged: _onSliderChanged,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  CustomText(
                    text: "${_sliderValue.toPrecision(3)} km",
                    fontColor: Color(0xffFFFFFF),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
