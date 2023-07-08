/*
import 'package:dr_cars/Views/CreateAccount/CreateAccount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Widgets/CustomButton.dart';
import '../../Widgets/custom_text.dart';
import '../NavigationBar/NavigationBar.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _emailValid = false;
  bool _passwordVisible = false;
  bool _isEmailValid(String email) {
    final RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.only(left: 38.0.w, top: 30.0.h),
                child: const Center(
                    child: Icon(Icons.arrow_back_ios_new,
                        size: 25, color: Color(0xffFFFFFF))),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
                child: Padding(
              padding:
                  EdgeInsets.only(left: 38.0.w, top: 30.0.h, right: 38.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'singIn'.tr,
                    fontColor: const Color(0xffFFFFFF),
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.start,
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
                    height: 58.h,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      suffixIcon: _emailValid
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : null,
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff606060), width: 3.0),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff606060), width: 3.0),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    onChanged: (email) {
                      setState(() {
                        _emailValid = _isEmailValid(email);
                      });
                    },
                  ),

                  SizedBox(
                    height: 30.h,
                  ),
                  TextField(
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff606060), width: 3.0),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff606060), width: 3.0),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                        text: 'Forgot password?',
                        fontColor: const Color(0xffF0F2FF),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 39.0.w, right: 39.w),
                    child: CustomButton(
                        height: 40.h,
                        width: 100.w,
                        text: "Sign in",
                        onPressed: () {
                          Get.to(const NavigationBarScreen());
                        }),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xff606060),
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: 'Don’t have an account?',
                            fontColor: const Color.fromRGBO(255, 255, 255, 0.9),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(CreateAccount());
                            },
                            child: CustomText(
                              text: 'Sign up',
                              fontColor: const Color(0xffF0F2FF),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  // Row(
                  //   children: [
                  //     Image.asset(
                  //       'assets/Icons/google.png',
                  //       height: 180.h,
                  //       width: 197.w,
                  //       fit: BoxFit.cover,
                  //     ),
                  //     Image.asset(
                  //       'assets/Icons/apple.png',
                  //       height: 180.h,
                  //       width: 197.w,
                  //       fit: BoxFit.cover,
                  //     ),
                  //     Image.asset(
                  //       'assets/Icons/facebook.png',
                  //       height: 180.h,
                  //       width: 197.w,
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ],
                  // )
                ],
              ),
            )),
          )),
    );
  }
}
*/
