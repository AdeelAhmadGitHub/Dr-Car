import 'dart:convert';

import 'package:dr_cars/Models/AllManufacturesModel.dart';
import 'package:dr_cars/Utils/app_constants.dart';
import 'package:dr_cars/Views/Home/Home.dart';
import 'package:dr_cars/Views/Manufacture/searchByManufactuer.dart';
import 'package:dr_cars/Views/NavigationBar/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Models/DataList.dart';
import '../Models/GetHomePageModel.dart';
import '../Models/UserData.dart';
import '../Models/getAcitveListModel.dart';
import '../Models/getSearchFilterModel.dart';
import '../Models/getpreviouslistingModel.dart';
import '../Utils/functions.dart';
import '../Views/NavigationBar/NavigationBayer/NavigationBayer.dart';
import '../Views/SignUp/SignUp.dart';
import '../Views/Started/Started.dart';
import '../api/api_client.dart';
import 'auth_Controller.dart';

class HomeController extends GetxController {
  var loading = false.obs;
  var loadingMarkSold = false.obs;
  var buyerHomeLoading = false.obs;
  var loadingBrowseManufacture = false.obs;
  String? listingId;
  var manufactureLoading = false.obs;
  ApiClient api = ApiClient(appBaseUrl: baseUrl);
  TextEditingController minimumCont = TextEditingController();
  TextEditingController maximumCont = TextEditingController();
  String? manufactureIdSearch;
  String? currentType = '';
  String? currentTransmission = '';
  String? radius = '';
  String? lat = '';
  String? long = '';
  String? userID = '';
  Rx<UserData>? userData;
  String? checkToken = "";
  final authController = Get.put(AuthController());

  // DataListPrevious? dataListPrevious;
  DataList? dataList;

  checkUser() async {
    checkToken = authController.token;
    SharedPreferences prefss = await SharedPreferences.getInstance();
    bool isLogin = (prefss.get(AppConstants().userdata) == null ? false : true);
    print("isLogin $isLogin");
    if (isLogin == true) {
      getActiveListing();
      getPreviousListing();
      allManufactures();
    } else {
      allManufactures();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    checkUser();

    super.onInit();
  }

  Future<void> getRefresh() async {
    await getActiveListing();
    await getPreviousListing();
    update();
  }

  GetActiveListingModel? getActiveListingModel;

  Future<void> getActiveListing() async {
    loading.value = true;
    Response response = await api.getData("/get-active-listing", headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': "*",
      'Authorization': 'Bearer $tokenMain'
    });
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      getActiveListingModel = GetActiveListingModel.fromJson(response.body);
      loading.value = false;
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
  }

  Future<void> markASold() async {
    loadingMarkSold.value = true;
    Response response = await api.getData(
      "/mark-a-sold?listing_id=${dataList?.id ?? 0}",
    );
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      getActiveListing();
      getPreviousListing();
      Get.back();
      loadingMarkSold.value = false;
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
  }

  GetPreviousListingModel? getPreviousListingModel;
  RecentListingB? currentBuyerData;
  GetBuyerHomePageModel? getBuyerHomePageModel;
  Future<void> getBuyerHomePage() async {
    // buyerHomeLoading.value = true;
    // var headers = {'Accept': 'application/json'};
    // var request = http.Request('GET', Uri.parse('http://drcars.hadisolution.com/api/get-home-page-detail'));
    //
    // request.headers.addAll(headers);
    //
    // http.StreamedResponse response = await request.send();
    //
    // if (response.statusCode == 200) {
    //   getBuyerHomePageModel = GetBuyerHomePageModel.fromJson(response.headers);
    //   buyerHomeLoading.value = false;
    //   print(await response.stream.bytesToString());
    // } else {
    //   print(response.reasonPhrase);
    // }
    final response = await http.get(Uri.parse("http://drcars.hadisolution.com/api/get-home-page-detail"));
    var responseData = json.decode(response.body);
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      getBuyerHomePageModel = GetBuyerHomePageModel.fromJson(responseData);
      buyerHomeLoading.value = false;
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
  }

  Future<void> getPreviousListing() async {
    loading.value = true;

    Response response = await api.getData("/get-previous-listing", headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': "*",
      'Authorization': 'Bearer $tokenMain'
    });
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      getPreviousListingModel = GetPreviousListingModel.fromJson(response.body);
      loading.value = false;
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
  }

  // Future<void> getMarkASold() async {
  //   loading.value = true;
  //   Response response = await api.getData(
  //     "/mark-a-sold?listing_id=16",
  //
  //   );
  //   if (response == null) {
  //     errorAlert('Check your internet connection.');
  //   } else if (response.statusCode == 200) {
  //     //Get.
  //   } else {
  //     errorAlert('Something went wrong\nPlease try again!');
  //   }
  //   }

  RxBool homeAllManufacturesLoading = true.obs;
  AllManufacturesModel? allManufacturesModel;

  Future<void> allManufactures() async {
    manufactureLoading.value = true;

    final response = await http.get(Uri.parse("http://drcars.hadisolution.com/api/get-all-manufactures"));

    var responseData = json.decode(response.body);
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      allManufacturesModel = AllManufacturesModel.fromJson(responseData);
      manufactureLoading.value = false;
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
    // Response response = await api.getData("/get-all-manufactures", headers: {
    //   'Content-Type': 'application/json; charset=UTF-8',
    //   'Accept': 'application/json',
    //   'Access-Control-Allow-Origin': "*",
    //   'Authorization': 'Bearer 263|C0wssEr0aibRV8gHsTBl6W9YQJ4E1HqJMF6KFRn9'
    // });
    // if (response == null) {
    //   errorAlert('Check your internet connection.');
    // } else if (response.statusCode == 200) {
    //   allManufacturesModel = AllManufacturesModel.fromJson(response.body);
    //   manufactureLoading.value = false;
    // } else {
    //   errorAlert('Something went wrong\nPlease try again!');
    // }
  }

  Future deleteAddPost() async {
    Response response = await api.postData("/delete-ads-post", {"listing_id": dataList?.id.toString() ?? ""},
        showdialog: true);
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      Get.offAll(() => const NavigationBarScreen());
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
  }

  GetSearchFilterModel? getSearchFilterModel;

  Future<void> getSearchData() async {
    loadingBrowseManufacture.value = true;
    Response response = await api.getData(
      "/search-filter?minimum=${minimumCont.text}&maximum=${maximumCont.text}&location_latitude=$lat&location_longtitude=$long&type=$currentType&transmission=$currentTransmission&radius=$radius&manufacture_id=$manufactureIdSearch",
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': "*",
        'Authorization': 'Bearer $tokenMain'
      },
    );
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      loadingBrowseManufacture.value = false;
      getSearchFilterModel = GetSearchFilterModel.fromJson(response.body);
      Get.to(SearchByManufacture());
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
  }
}
