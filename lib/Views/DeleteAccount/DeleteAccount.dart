// import 'package:dr_cars/Controllers/auth_Controller.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../Widgets/custom_text.dart';
// import '../Drawer/Drawer.dart';
//
// class DeleteAccount extends StatefulWidget {
//   const DeleteAccount({Key? key}) : super(key: key);
//
//   @override
//   State<DeleteAccount> createState() => _DeleteAccountState();
// }
//
// class _DeleteAccountState extends State<DeleteAccount> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/Images/Homebck.png'),
//           fit: BoxFit.fill,
//         ),
//       ),
//       child: Scaffold(
//           drawer: const DrawerNavigation(),
//           appBar: AppBar(
//             titleSpacing: 20,
//             automaticallyImplyLeading: false,
//             elevation: 0,
//             backgroundColor: Colors.transparent,
// /*
//             leading: Padding(
//               padding: EdgeInsets.only(left: 10.0.w, top: 25.h),
//               child: Builder(
//                 builder: (BuildContext context) => InkWell(
//                   onTap: () {
//                     Scaffold.of(context).openDrawer();
//                   },
//                   child: Image.asset(
//                     'assets/Icons/drawer.png',
//                   ),
//                 ),
//               ),
//             ),
// */
//             title: Padding(
//               padding: EdgeInsets.only(top: 25.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomText(
//                     text: tr('Delete Account'),
//                     fontColor: const Color(0xffFFFFFF),
//                     fontSize: 32.sp,
//                     fontWeight: FontWeight.w600,
//                     textAlign: TextAlign.start,
//                   ),
// /*
//                   const Icon(Icons.notifications_none_outlined,
//                       size: 25, color: Color(0xffFFFFFF)),
// */
//                 ],
//               ),
//             ),
//           ),
//           backgroundColor: Colors.transparent,
//           body: Container(
//             child: Center(
//               child: Container(
//                 height: 196.h,
//                 width: 293.w,
//                 decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 50.h,
//                       decoration: const BoxDecoration(
//                           color: Color(0xff054559),
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             topRight: Radius.circular(10),
//                           )),
//                       child: Center(
//                         child: Row(
//                           children: [
//                             SizedBox(width: 20.w),
//                             Image.asset("assets/Images/question.png"),
//                             SizedBox(width: 5.w),
//                             CustomText(
//                               text: "CONFIRM",
//                               fontSize: 15.sp,
//                               fontWeight: FontWeight.w500,
//                               fontColor: Colors.white,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 35.h),
//                     CustomText(
//                       text: tr("Are you sure you want to delete your account?"),
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.w500,
//                       fontColor: Colors.white,
//                     ),
//                     SizedBox(height: 35.h),
//                     Container(
//                       height: 1.h,
//                       width: double.maxFinite,
//                       color: const Color(0xffF1F1FA),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: CustomText(
//                             text: tr("Yes"),
//                             fontSize: 15.sp,
//                             fontWeight: FontWeight.w500,
//                             fontColor: Colors.white,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 20),
//                           child: Container(
//                             height: 54.h,
//                             width: 1,
//                             color: const Color(0xffF1F1FA),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () async {
//                             await Get.find<AuthController>().logout();
//                           },
//                           child: CustomText(
//                             text: tr("No"),
//                             fontSize: 15.sp,
//                             fontWeight: FontWeight.w500,
//                             fontColor: Colors.white,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
// }
