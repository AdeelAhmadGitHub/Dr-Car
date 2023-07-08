import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Controllers/auth_Controller.dart';
import '../../Widgets/custom_text.dart';

class DeleteAccountScreen extends StatefulWidget {
  static const String id = "DeleteAccountScreen";
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  String dropdownValue = 'Something was broken';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 20.w),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        CustomText(
                          text: "Delete Account",
                          fontSize: 25.sp,
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          height: 45.h,
                          width: 335.w,
                          child: Center(
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              iconSize: 24.sp,
                              elevation: 16,
                              style: TextStyle(color: Colors.black, fontSize: 18.sp),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Something was broken',
                                "I'm not getting any invites",
                                'I have a privacy  concern',
                                'Other',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          height: 250.h,
                          width: 335.w,
                          child: TextFormField(
                            // cursorColor: kGreen,
                            maxLines: null,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(left: 15.w, bottom: 11.h, top: 11.h, right: 15.w),
                                hintText: "Write something"),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Center(
                            child: Container(
                                height: 35.h,
                                width: 335.w,
                                decoration: BoxDecoration(
                                    // color: kGreen,
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        // backgroundColor:kGreen
                                        ),
                                    onPressed: () => showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                              insetPadding:
                                                  EdgeInsets.symmetric(horizontal: 30.w, vertical: 150.h),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(vertical: 50.h),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(25.r)),
                                                  child: Column(
                                                    children: [
                                                      CustomText(
                                                        text: "Your account deleted successfully",
                                                        fontSize: 26.sp,
                                                        textAlign: TextAlign.center,
                                                      ),
                                                      SizedBox(height: 60.h),
                                                      Container(
                                                        height: 35.h,
                                                        width: 135.w,
                                                        decoration: BoxDecoration(
                                                            // color: kGreen,
                                                            borderRadius: BorderRadius.circular(10.r)),
                                                        child: ElevatedButton(
                                                            style: ElevatedButton.styleFrom(
                                                                // backgroundColor:kGreen
                                                                ),
                                                            onPressed: () async {
                                                              await Get.find<AuthController>().logout();
                                                            },
                                                            child: CustomText(
                                                              text: "Go back",
                                                              fontSize: 18.sp,
                                                            )),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )),
                                    child: CustomText(
                                      text: "Submit",
                                      fontSize: 18.sp,
                                    ))))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // logOutMe() async {
  //   // var result = await ApiCalls.logOut();
  //   // if (result!)
  //   await UserPreferences.setLanguageCheck(false);
  //   await UserPreferences.clearAllData();
  //   goToSignInScreen();
  // }
  // goToSignInScreen() {
  //   Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const SignInScreen(),
  //     ),
  //         (route) => false,
  //   );
  // }
}
