import 'package:dr_cars/Views/Drawer/Drawer.dart';
import 'package:dr_cars/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Message extends StatefulWidget {
  const Message({Key? key}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
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
                    text: 'Message',
                    fontColor: const Color(0xffFFFFFF),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                  ),
                  const Icon(Icons.notifications_none_outlined,
                      size: 25, color: Color(0xffFFFFFF)),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(top: 20).r,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.0.w, right: 20.0.w, top: 26.0.h),
                      child: Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                              controller: tabController,
                              isScrollable: false,
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ).r,
                              indicatorColor: Colors.transparent,
                              labelColor: const Color(0xffF0F2FF),
                              labelStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              unselectedLabelColor: const Color(0xffA2A2A2),
                              unselectedLabelStyle: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              tabs: const [
                                Tab(
                                  text: "FROM SELLERS",
                                ),
                                Tab(
                                  text: "FROM SELLERS",
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
                              child: Container(),
                            ),
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(left: 20, right: 20).r,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
