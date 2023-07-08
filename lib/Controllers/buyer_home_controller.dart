import 'dart:convert';

import 'package:dr_cars/Models/GetAllRecentViewModel.dart';
import 'package:dr_cars/Models/GetHomePageModel.dart';
import 'package:dr_cars/Utils/functions.dart';
import 'package:dr_cars/Views/Recent%20Upload%20Item/RecentUploadItems.dart';
import 'package:dr_cars/api/api_client.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

class BuyerHomeController extends GetxController {
  var buyerHomeLoading = false.obs;
  var buyerRecentViewLoading = false.obs;
  ApiClient api = ApiClient(appBaseUrl: baseUrl);
  @override
  void onInit() {
    // TODO: implement onInit
    getBuyerHomePage();
    super.onInit();
  }

  RecentListingB? currentBuyerData;
  GetBuyerHomePageModel? getBuyerHomePageModel;
  Future<void> getBuyerHomePage() async {
    buyerHomeLoading.value = true;
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
      print("???????????????????????????????????");
      print(responseData);
      print(response.statusCode);
      print("???????????????????????????????????");
      getBuyerHomePageModel = GetBuyerHomePageModel.fromJson(responseData);
      buyerHomeLoading.value = false;
    } else {
      errorAlert('Something went wrong\nPlease try again!');
      buyerHomeLoading.value = false;
    }
    update();
  }

  GetAllRecentViewModel? getAllRecentViewModel;
  Future<void> getAllRecentView() async {
    buyerRecentViewLoading.value = true;
    // var headers = {'Accept': 'application/json'};
    // var request = http.Request(
    //     'GET', Uri.parse('http://drcars.hadisolution.com/api/view-all-recent-listings?user_id=15'));
    //
    // request.headers.addAll(headers);
    //
    // http.StreamedResponse response = await request.send();
    //
    // if (response.statusCode == 200) {
    //   getAllRecentViewModel = GetAllRecentViewModel.fromJson(response.headers);
    //   Get.to(const RecentUploadItems());
    //
    //   buyerRecentViewLoading.value = false;
    //   print(await response.stream.bytesToString());
    // } else {
    //   print(response.reasonPhrase);
    // }

    final response = await http.get(Uri.parse("http://drcars.hadisolution.com/api/view-all-recent-listings"));
    var responseData = json.decode(response.body);
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      getAllRecentViewModel = GetAllRecentViewModel.fromJson(responseData);
      Get.to(const RecentUploadItems());

      buyerRecentViewLoading.value = false;
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
  }
}
