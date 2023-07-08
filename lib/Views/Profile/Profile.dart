import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_cars/Controllers/auth_Controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Utils/app_constants.dart';
import '../../Widgets/custom_text.dart';
import '../Edit Profile/Edit Profile.dart';
import '../SignUp/SignUp.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _url = "https://www.freeprivacypolicy.com/live/e188af17-b5e7-450c-92fd-bcd503c122b4";
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw Exception('Could not launch $_url');
    }
  }

  gotcallf() async {
    SharedPreferences prefss = await SharedPreferences.getInstance();
    bool isLogin = (prefss.get(AppConstants().userdata) == null ? false : true);
    print("isLogin $isLogin");
    if (isLogin == true) {
    } else {
      Get.to(SignUp());
    }
  }

  @override
  void initState() {
    gotcallf();
    super.initState();
  }

  // final auth=Get.put(AuthController());
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
              // automaticallyImplyLeading: false,
              titleSpacing: 25,
              elevation: 0,
              backgroundColor: Colors.transparent,

              title: Padding(
                padding: EdgeInsets.only(top: 25.h),
                child: CustomText(
                  text: tr('Profile'),
                  fontColor: const Color(0xffFFFFFF),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: GetBuilder<AuthController>(
              builder: (auth) {
                return SingleChildScrollView(
                  child: SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(EditProfile());
                              },
                              child: CustomText(
                                text: tr('Edit Profile'),
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 97.h,
                              width: 87.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xffFFFFFF),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: auth.userData!.value.profilePic != null
                                    ? CachedNetworkImage(
                                        imageUrl: "${auth.userData?.value.profilePic}" ?? "N/A",
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
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text:
                                      "${auth.userData?.value.firstName ?? "N/A"} ${auth.userData?.value.lastName ?? "N/A"}",

                                  //text: "${auth.userData?.firstName}"  "${auth.userData?.lastName}",
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                CustomText(
                                  text: "${auth.userData?.value.phone}",
                                  //text: '(+1) 331 623 8413',
                                  fontColor: const Color(0xffFFFFFF),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/Icons/gmail.png"),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    CustomText(
                                      text: "${auth.userData?.value.email}",
                                      //text: 'alexandra23@gmail.com',
                                      fontColor: const Color(0xffFFFFFF),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        InkWell(
                          onTap: () {
                            _launchUrl();
                          },
                          child: CustomText(
                            text: tr('About us'),
                            fontColor: const Color(0xffFFFFFF),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            _launchUrl();
                          },
                          child: CustomText(
                            text: tr('Contact us'),
                            fontColor: const Color(0xffFFFFFF),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            _launchUrl();
                          },
                          child: CustomText(
                            text: tr('Help'),
                            fontColor: const Color(0xffFFFFFF),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            _launchUrl();
                          },
                          child: CustomText(
                            text: tr('Privacy Policy'),
                            fontColor: const Color(0xffFFFFFF),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            _launchUrl();
                          },
                          child: CustomText(
                            text: tr('Terms and conditions'),
                            fontColor: const Color(0xffFFFFFF),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )),
                );
              },
            )));
  }
}
