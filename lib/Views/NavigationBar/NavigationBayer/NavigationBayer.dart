import 'package:dr_cars/Views/Home/Home.dart';
import 'package:dr_cars/Views/Messange/Messange.dart';
import 'package:dr_cars/Views/Profile/Profile.dart';
import 'package:dr_cars/Views/chatScreen/message_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Controllers/updateLocationControler.dart';
import '../../Home/HomeBuyyer.dart';

class NavigationBarScreenBayer extends StatefulWidget {
  const NavigationBarScreenBayer({Key? key}) : super(key: key);

  @override
  State<NavigationBarScreenBayer> createState() => _NavigationBarScreenBayerState();
}

class _NavigationBarScreenBayerState extends State<NavigationBarScreenBayer> {
  int _selectedIndex = 0;
  final screen = [
    const HomeBuyer(),
    const Profile(),
    const MessageScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screen.elementAt(_selectedIndex),
      ),
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
              icon: Icon(Icons.home),
              label: tr('Home'),
            ),
/*
            BottomNavigationBarItem(
              icon: ImageIcon(
                  size: 22,
                  AssetImage(
                    "assets/Icons/InterestIcon.png",
                  )),
              label: "Manufacturer",
            ),
*/
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: tr('Profile'),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                size: 22,
                AssetImage(
                  "assets/Icons/MessangeIcon.png",
                ),
              ),
              label: tr("Message"),
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.search),
            //   label: 'Search',
            // ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
