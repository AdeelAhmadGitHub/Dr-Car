import 'package:dr_cars/Views/Drawer/Drawer.dart';
import 'package:dr_cars/Views/Manufacture%20List/ManufactureModel.dart';
import 'package:dr_cars/Widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Manufacturers extends StatefulWidget {
  const Manufacturers({Key? key}) : super(key: key);

  @override
  State<Manufacturers> createState() => _ManufacturersState();
}

class _ManufacturersState extends State<Manufacturers> {
  final List<ManufactureModel> list = ManufactureModel.dummyData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Images/Homebck.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
          drawer: const DrawerNavigation(),
          appBar: AppBar(
            titleSpacing: 20,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: EdgeInsets.only(left: 10.0.w, top: 25.h),
              child: Builder(
                builder: (BuildContext context) => InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset(
                    'assets/Icons/drawer.png',
                  ),
                ),
              ),
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: tr('Manufacturers'),
                    fontColor: const Color(0xffFFFFFF),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                  ),
                  const Icon(Icons.notifications_none_outlined, size: 25, color: Color(0xffFFFFFF)),
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
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      child: GridView.builder(
                        //  padding: EdgeInsets.all(16),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 9.0,
                          mainAxisSpacing: 9.0,
                        ),
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            child: Container(
                              height: 170.h,
                              width: 170.w,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(0, 0, 0, 0.3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage('assets/Images/BMW3.png'),
                                    fit: BoxFit.fill,
                                  )),
                              child: Column(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 76.0.h),
                                      child: CustomText(
                                        text: ManufactureModel.dummyData[index].title,
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
                                        Image.asset(
                                          ManufactureModel.dummyData[index].logo,
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
