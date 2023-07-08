import 'package:dr_cars/Controllers/auth_Controller.dart';
import 'package:dr_cars/Views/NavigationBar/NavigationBar.dart';
import 'package:dr_cars/Widgets/CustomButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Widgets/custom_text.dart';
import '../Home/Home.dart';
import '../Posting Add/Posting add.dart';
import '../Posting Add/Posting add1.dart';
import '../Profile/Profile.dart';
import '../Sign in/Sign in.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key, this.number}) : super(key: key);
  final String? number;

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String selectedDate = "Select Date";
  final _key = GlobalKey<FormState>();
  bool _emailValidd = false;
  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
            // appBar: AppBar(
            //   backgroundColor: Colors.transparent,
            //   elevation: 0,
            //   leading: InkWell(
            //     onTap: () {
            //       Get.back();
            //     },
            //     // child: Padding(
            //     //   padding: EdgeInsets.only(left: 20.0.w, top: 30.0.h),
            //     //   child: const Center(
            //     //       child: Icon(Icons.arrow_back_ios_new,
            //     //           size: 25, color: Color(0xffFFFFFF))),
            //     // ),
            //   ),
            // ),
            backgroundColor: Colors.transparent,
            body: Form(
              key: _key,
              child: GetBuilder(
                  init: AuthController(),
                  builder: (AuthController cont) {
                    return SingleChildScrollView(
                      child: SafeArea(
                          child: Padding(
                        padding: EdgeInsets.only(left: 20.0.w, top: 60.0.h, right: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: tr('Create Account'),
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'assets/Icons/icon.png',
                                  height: 180.h,
                                  width: 197.w,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            TextField(
                              controller: cont.firstNameCont,
                              decoration: InputDecoration(
                                hintText: tr("First Name"),
                                hintStyle: TextStyle(color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff606060), width: 3.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff606060), width: 3.0),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            TextField(
                              controller: cont.lastNameCont,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: tr("Last Name"),
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff606060), width: 3.0),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff606060), width: 3.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            TextField(
                              controller: cont.emailCont,
                              decoration: InputDecoration(
                                hintText: tr("Email"),
                                hintStyle: const TextStyle(color: Colors.white),
                                prefixIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                ),
                                suffixIcon:
                                    _emailValidd ? const Icon(Icons.check, color: Colors.white) : null,
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff606060), width: 3.0),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xff606060), width: 3.0),
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                              onChanged: (value) {
                                setState(() {
                                  _emailValidd = value.endsWith("@gmail.com");
                                });
                              },
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: Icon(
                                    Icons.calendar_month_outlined,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: CustomText(
                                    text: selectedDate,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    fontColor: Color(0xffFFFFFF),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Divider(
                              thickness: 3,
                              height: 1,
                              color: Color(0xff606060),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            SizedBox(
                              width: 237.w,
                              child: CustomButton(
                                  height: 40.h,
                                  // width: 100.w,
                                  text: tr("Submit"),
                                  textColor: Colors.black,
                                  textSize: 18.sp,
                                  textFontWeight: FontWeight.w600,
                                  onPressed: () {
                                    if (_key.currentState!.validate()) {
                                      if (selectedDate == "Select Date") {
                                        Get.defaultDialog(
                                          middleText: "Enter Date of Birth",
                                          title: "",
                                        );
                                      } else {
                                        cont.signUp(widget.number!, selectedDate);
                                        print("Good");
                                      }
                                    }

                                    Get.to(const Home());
                                  }),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                          ],
                        ),
                      )),
                    );
                  }),
            )));
  }

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(1947),
        lastDate: DateTime.now());
    if (picked != null) {
      setState(() {
        selectedDate = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
}
