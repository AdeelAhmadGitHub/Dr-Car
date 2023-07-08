import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_cars/Constants/Colors/constant_colors.dart';
import 'package:dr_cars/Controllers/auth_Controller.dart';
import 'package:dr_cars/Views/Home/Home.dart';
import 'package:dr_cars/Widgets/CustomButton.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../Widgets/custom_text.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _key = GlobalKey<FormState>();
  final auth = Get.put(AuthController());
  bool _emailValidd = false;
  @override
  void initState() {
    auth.firstName.text = auth.userData?.value.firstName ?? "";
    auth.lastName.text = auth.userData?.value.lastName ?? "";
    auth.email.text = auth.userData?.value.email ?? "";
    auth.dateOfBirth = auth.userData?.value.dateOfBirth ?? "Select Date";
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    auth.editProfileLoading.value = false;
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
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 25,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: EdgeInsets.only(left: 10.0.w, top: 25.h),
              child: GestureDetector(
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
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: CustomText(
                text: tr('Edit Profile'),
                fontColor: const Color(0xffFFFFFF),
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Form(
              key: _key,
              child: GetX<AuthController>(builder: (cont) {
                return cont.editProfileLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Color(0xff054255),
                      ))
                    : SingleChildScrollView(
                        child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 112.h,
                                      width: 133.w,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        await _showChoiceDialog(context);
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5..r),
                                        child: Center(
                                          child: auth.imageFile == null
                                              ? ClipRRect(
                                                  borderRadius: BorderRadius.circular(5..r),
                                                  child: auth.userData!.value.profilePic != null
                                                      ? CachedNetworkImage(
                                                          imageUrl:
                                                              "${auth.userData?.value.profilePic}" ?? "N/A",
                                                          errorWidget: (context, url, error) => Image.asset(
                                                            "assets/Images/profile.png",
                                                            height: 100.h,
                                                            width: 900.w,
                                                            fit: BoxFit.cover,
                                                          ),
                                                          height: 100.h,
                                                          width: 90.w,
                                                          fit: BoxFit.cover,
                                                        )
                                                      : Icon(Icons.person, size: 35..r),
                                                )
                                              : ClipRRect(
                                                  borderRadius: BorderRadius.circular(5..r),
                                                  child: Image.file(
                                                    auth.imageFile!,
                                                    height: 97.h,
                                                    width: 87.w,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        width: 34..w,
                                        height: 34..h,
                                        left: 177.w,
                                        top: 75.h,
                                        child: GestureDetector(
                                          onTap: () async {
                                            await _showChoiceDialog(context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2,
                                              ),
                                            ),
                                            child: const CircleAvatar(
                                              radius: 55,
                                              backgroundColor: Color(0xff009FC1),
                                              child: CircleAvatar(
                                                radius: 55,
                                                backgroundColor: Colors.transparent,
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 40.h,
                                ),
                                TextField(
                                  controller: cont.firstName,
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
                                SizedBox(height: 30.h),
                                TextField(
                                  controller: cont.lastName,
                                  decoration: InputDecoration(
                                    hintText: tr("Last Name"),
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
                                  controller: cont.email,
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
                                        text: auth.dateOfBirth,
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
                                CustomButton(
                                    height: 40.h,
                                    width: 100.w,
                                    text: tr("Submit"),
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        if (auth.dateOfBirth == "Select Date") {
                                          Get.defaultDialog(
                                            middleText: "Enter Date of Birth",
                                            title: "",
                                          );
                                        } else {
                                          if (auth.imageFile == null) {
                                            Get.defaultDialog(
                                              middleText: "Please Upload Image",
                                              title: "",
                                            );
                                          } else {
                                            auth.editProfile();
                                          }
                                        }
                                      }
                                    }),
                              ]),
                        ),
                      ));
              })),
        ));
  }

  _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      auth.imageFile = File(pickedFile!.path);
    });
    // assignImage();
  }

  _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      auth.imageFile = File(pickedFile!.path);
    });
    //assignImage();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              tr("Choose option"),
              style: TextStyle(color: const Color(0xff000000).withOpacity(.6)),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                      Navigator.pop(context);
                    },
                    title: Text(tr("Gallery")),
                    leading: const Icon(
                      Icons.account_box,
                      color: Color(0xff8C8FA5),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                      Navigator.pop(context);
                    },
                    title: Text(tr("Camera")),
                    leading: const Icon(
                      Icons.camera,
                      color: Color(0xff8C8FA5),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
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
        auth.dateOfBirth = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
}

/* GestureDetector(
                          onTap: (){
                            _selectDate(context);
                          },
                          child: TextField(
                            controller: dateOfBirth,
                            decoration: InputDecoration(
                              hintText: selectedDate,
                              hintStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(
                                Icons.calendar_month_outlined,
                                color: Colors.white,
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff606060), width: 3.0),
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff606060), width: 3.0),
                              ),
                            ),
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                              //
                            },
                          ),
                        ),
                        SizedBox(
                          height: 70.h,
                        ),
                        //AuthController().editProfileLoading.value
                        */ /* ? const Center(child: CircularProgressIndicator())
                      : */ /*
                        Container(
                          height: 45.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              */ /*var check = AuthController().editProfile(
                          "image",
                          firstName.text,
                          lastName.text,
                          email.text,
                          dateOfBirth.text,
                        );
                        if (check) {
                          showSnackBar(
                              context, 'Profile Edited Successfully');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                        } else {
                          showSnackBar(context, 'Operation Failed');
                        }*/ /*
                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF054255),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding:
                              const EdgeInsets.fromLTRB(16.0, 10.0, 12.0, 10.0),
                            ),
                            child: CustomText(
                              text: 'Submit',
                              fontColor: const Color(0xffFFFFFF),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),*/
