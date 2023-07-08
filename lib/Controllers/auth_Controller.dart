// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dr_cars/Controllers/updateLocationControler.dart';
import 'package:dr_cars/Models/UserData.dart';
import 'package:dr_cars/Utils/app_constants.dart';
import 'package:dr_cars/Utils/functions.dart';
import 'package:dr_cars/Views/CreateAccount/CreateAccount.dart';
import 'package:dr_cars/Views/Edit%20Profile/Edit%20Profile.dart';
import 'package:dr_cars/Views/Home/Home.dart';
import 'package:dr_cars/Views/Profile/Profile.dart';
import 'package:dr_cars/Views/SignUp/SignUp.dart';
import 'package:dr_cars/api/api_checker.dart';
import 'package:dr_cars/api/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sms_autofill/sms_autofill.dart';
import '../Share Preferences/Share Preferences.dart';
import '../Views/NavigationBar/NavigationBar.dart';
import '../Views/NavigationBar/NavigationBayer/NavigationBayer.dart';
import '../Views/Started/Started.dart';

class AuthController extends GetxController {
  String? sellerType;
  int? isSelected = 1;
  UserPreferences userPreferences = UserPreferences();
  late SharedPreferences prefs;
  TextEditingController firstNameCont = TextEditingController(text: "");
  TextEditingController lastNameCont = TextEditingController(text: "");
  TextEditingController emailCont = TextEditingController(text: "");

  var messageOtpCode = "";
  //TextEditingController dobCont = TextEditingController(text: '');
  ///For EditProfile
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  //TextEditingController dateOfBirth = TextEditingController();
  String dateOfBirth = "Select Date";
  File? image;
  String? token = "";
  String? deviceToken = "";
  RxBool loading = false.obs;
  RxBool editProfileLoading = false.obs;
  // var editProfileLoading = false.obs;
  ApiClient api = ApiClient(appBaseUrl: baseUrl);
  ApiChecker apichecker = ApiChecker();
  Rx<UserData>? userData;
  File? imageFile;

  @override
  void onClose() {
    // TODO: implement onClose
    // otpController.dispose();
    SmsAutoFill().unregisterListener();
    super.onClose();
  }

  @override
  void onInit() async {
    super.onInit();
    await SmsAutoFill().listenForCode();
    initialize();
  }

  Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<Widget> checkUserLoggedIn() async {
    SharedPreferences prefss = await SharedPreferences.getInstance();
    bool isLogin = (prefss.get(AppConstants().userdata) == null ? false : true);
    if (isLogin) {
      await getuserDetail();
      return const NavigationBarScreenBayer();
    } else {
      return Started();
    }
  }
  // Future<Widget> checkUserLoggedIn() async {
  //   bool loginStatus = await userPreferences.getLoginStatus();
  //   await Future.delayed(const Duration(seconds: 10));
  //   if (loginStatus) {
  //     await getuserDetail();
  //     return const NavigationBarScreen();
  //   } else {
  //     return const Started();
  //   }
  // }

  Future signUp(String phoneNumber, String date) async {
    print("sign up device token sign up............... $deviceToken");
    loading.value = true;
    Response response = await api.postData(
      "/signUp",
      {
        "phone": phoneNumber,
        "first_name": firstNameCont.text,
        "last_name": lastNameCont.text,
        "email": emailCont.text,
        "dob": date,
        "device_token": deviceToken
      },
    );
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      await prefs.setString(AppConstants().token, response.body["access_token"]);
      // userPreferences.setLoginStatus(true);
      // userPreferences.setUserData(response.body);
      await onLoginSuccess(response.body);
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
    loading.value = false;
  }

  Future login(String phoneNumber) async {
    print("sign up device token............... $deviceToken");

    try {
      final response = await http.post(
        Uri.parse('http://drcars.hadisolution.com/api/login'),
        headers: {
          'Accept': 'application/json',
          'Access-Control-Allow-Origin': "*",
        },
        body: {
          'phone': phoneNumber,
          'device_token': deviceToken,
        },
      );
      print("ssssssssssss${response.statusCode}");
      if (response.statusCode == 200) {
        //print("//////////////////////");
        // userPreferences.setLoginStatus(true);
        // userPreferences.setUserData(response.body);
        print(
            "jsonEncodejsonEncodejsonEncodejsonEncodejsonEncodejsonEncodejsonEncode${jsonEncode(response.body)}");
        await prefs.setString(AppConstants().token, jsonDecode(response.body)["access_token"]);
        onLoginSuccess(jsonDecode(response.body));
      } else if (response.statusCode == null) {
        errorAlert("Please Check Internet Connection");
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        Get.off(CreateAccount(number: phoneNumber));
      } else {
        errorAlert("Unauthorized");
        print("Login successful not");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future logout() async {
    loading.value = true;
    Response response = await api.postData(
      "/logout",
      {},
    );
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove(AppConstants().token);
      prefs.remove(AppConstants().userdata);
      Get.offAll(() => const SignUp());
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
    loading.value = false;
  }

  onLoginSuccess(Map<String, dynamic> value) async {
    await prefs.setString(AppConstants().userdata, jsonEncode(value));
    await prefs.setString(AppConstants().userCheck, "true");

    await getuserDetail();
    Get.offAll(const NavigationBarScreenBayer());
    update();
  }

  Future getuserDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tokenMain = prefs.getString(AppConstants().token);
    token = prefs.getString(AppConstants().token);
    api.updateHeader(token ?? "");
    print(jsonDecode(prefs.getString(AppConstants().userdata)!));
    try {
      userData = UserData.fromJson(jsonDecode(prefs.getString(AppConstants().userdata)!)).obs;
    } catch (e) {
      Get.offAll(const SignUp());
      print(e);
    }
    update();
  }

  // Future editProfile(String phoneNumber, String date) async {
  //   loading.value = true;
  //   Response response = await api.postData(
  //     "/edit-profile",
  //     {
  //       "phone": phoneNumber,
  //       "first_name": firstName.text,
  //       "last_name": lastName.text,
  //       "email": email.text,
  //       "dob": dateOfBirth,
  //     },
  //   );
  //   if (response == null) {
  //     errorAlert('Check your internet connection.');
  //   } else if (response.statusCode == 200) {
  //     await prefs.setString(
  //         AppConstants().token, response.body["access_token"]);
  //     // userPreferences.setLoginStatus(true);
  //     // userPreferences.setUserData(response.body);
  //     onLoginSuccess(response.body);
  //   } else {
  //     errorAlert('Something went wrong\nPlease try again!');
  //   }
  //   loading.value = false;
  // }
  Future editProfile() async {
    print("Good");
    editProfileLoading.value = true;
    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': "*",
      'Authorization': 'Bearer $tokenMain'
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://drcars.hadisolution.com/api/edit-profile'));
    request.fields.addAll(
        {'first_name': firstName.text, 'last_name': lastName.text, 'email': email.text, 'dob': dateOfBirth});
    request.files.add(await http.MultipartFile.fromPath('profile_pic', imageFile!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print(response.statusCode);

    if (response.statusCode == 200) {
      userData = UserData.fromJson(jsonDecode(await response.stream.bytesToString())).obs;
      await prefs.setString(AppConstants().userdata, jsonEncode(userData));
      editProfileLoading.value = false;
      update();
      Get.close(1);
    } else {
      editProfileLoading.value = false;
      print(response.reasonPhrase);
    }
  }
}
