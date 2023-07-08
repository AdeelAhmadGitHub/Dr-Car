import 'dart:html';

import 'package:dr_cars/Controllers/home_controller.dart';
import 'package:dr_cars/Views/FilterAndSort/FilterAndSort.dart';
import 'package:dr_cars/Views/MapFilter/MapFilter.dart';
import 'package:dr_cars/Views/Messange/Messange.dart';
import 'package:dr_cars/Views/Posting%20Add/Posting%20add.dart';
import 'package:dr_cars/Views/Profile/Profile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Home/Home.dart';

class NavigationFilterMapScreen extends StatefulWidget {
  const NavigationFilterMapScreen({Key? key}) : super(key: key);

  @override
  State<NavigationFilterMapScreen> createState() => _NavigationFilterMapScreenState();
}

class _NavigationFilterMapScreenState extends State<NavigationFilterMapScreen> {
  int _selectedIndex = 0;
  final homeCont = Get.put(HomeController());
  final screen = [
    const FilterAndSort(),
    const MapFilter(),
    //const Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (cont) {
      return Scaffold(
        body: Center(
          child: screen.elementAt(_selectedIndex),
        ),
        /*floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          onTap: () {
            Get.to(PostingAdd());
          },
          child: Container(
              width: 56.w,
              height: 56.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: Border.all(
                  color: Colors.yellow,
                  width: 2,
                ),
                color: Colors.white,
              ),
              child: const ImageIcon(
                AssetImage(
                  "assets/Icons/add.png",
                ),
                size: 28,
                color: Color(0xff092A35),
              )),
        ),*/
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
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      );
    });
  }
}
