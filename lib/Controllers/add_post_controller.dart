import 'dart:io';

import 'package:dr_cars/Controllers/home_controller.dart';
import 'package:dr_cars/Models/getAllColorModel.dart';
import 'package:dr_cars/Share%20Preferences/Share%20Preferences.dart';
import 'package:dr_cars/Utils/app_constants.dart';
import 'package:dr_cars/Utils/functions.dart';
import 'package:dr_cars/Views/Posting%20Add/Posting%20add.dart';
import 'package:dr_cars/api/api_checker.dart';
import 'package:dr_cars/api/api_client.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/DataList.dart';
import '../Models/TypeUsedNew.dart';
import '../Views/NavigationBar/NavigationBar.dart';
import '../Widgets/custom_text.dart';

class AddPostController extends GetxController {
  HomeController homeController = HomeController();
  UserPreferences userPreferences = UserPreferences();
  late SharedPreferences prefs;
  TextEditingController title = TextEditingController();
  TextEditingController actualPrice = TextEditingController();
  TextEditingController discountPrice = TextEditingController();
  TextEditingController engineType = TextEditingController();
  TextEditingController mpg = TextEditingController();
  ColorD? exteriorColorId;
  ColorD? interiorColorId;
  TextEditingController drivetrain = TextEditingController();
  TextEditingController transmission = TextEditingController();
  TextEditingController door = TextEditingController();
  TextEditingController seatCapacity = TextEditingController();
  TypeUsedNew? typeId;
  TextEditingController vin = TextEditingController();
  //TextEditingController stock = TextEditingController();
  //TextEditingController location = TextEditingController();
  TextEditingController windowSticker = TextEditingController();
  List<File> images = [];
  List<XFile>? imagesM = [];
  List<File> images1 = [];
  List<File> images2 = [];
  List<File> images3 = [];
  DataList? dataList;
  File? image;
  File? image1;
  File? image2;
  File? image3;
  String? manufactureIdSearch;
  String? currentType = '';
  String? currentTransmission = '';
  String? radius = '';
  String? lat = '';
  String? long = '';
  String? manufactureId;
  String? location;
  final ImagePicker _imagePicker = ImagePicker();
  RxList imagesPath = [].obs;
  RxInt selectedImagesCount = 0.obs;

  final loadingColor = false.obs;
  ApiClient api = ApiClient(appBaseUrl: baseUrl);
  ApiChecker apichecker = ApiChecker();
  List<TypeUsedNew> typeUsedNewList = [
    TypeUsedNew(id: 1, name: "Brand New"),
    TypeUsedNew(id: 2, name: "Used"),
  ];
//String? typeId;
  @override
  Future<void> onInit() async {
    getAllColor();
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  void selectImages() async {
    imagesM = await _imagePicker.pickMultiImage();
    if (imagesM != null) {
      for (XFile file in imagesM!) {
        imagesPath.add(file.path);
        selectedImagesCount.value = imagesPath.length;
      }
    } else {
      Get.snackbar("No image selected", "", snackPosition: SnackPosition.BOTTOM);
    }
  }

  GetAllColorModel? getAllColorModel;
  Future<void> getAllColor() async {
    loadingColor.value = true;
    Response response = await api.getData(
      "/get-all-colors",
    );
    if (response == null) {
      errorAlert('Check your internet connection.');
    } else if (response.statusCode == 200) {
      getAllColorModel = GetAllColorModel.fromJson(response.body);
      loadingColor.value = false;
    } else {
      errorAlert('Something went wrong\nPlease try again!');
    }
  }

  Future postingAdd1(BuildContext context) async {
    print({
      'title': title.text,
      'actualPrice': actualPrice.text,
      'discountPrice': actualPrice.text,
      'engineType': engineType.text,
      'mpg': mpg.text,
      'exteriorColorId': exteriorColorId?.id.toString() ?? "0",
      'interiorColorId': interiorColorId?.id.toString() ?? "0",
      'drivetrain': drivetrain.text,
      'transmission': transmission.text,
      'door': door.text,
      'seatCapacity': seatCapacity.text,
      'type_id': typeId?.id.toString(),
      'vin': vin.text,
      'stock': "123",
      'location': location,
      'manufacture_id': manufactureId
    });
    popDialog();
    var headers = {'Accept': 'application/json', 'Authorization': 'Bearer $tokenMain'};
    var request = http.MultipartRequest('POST', Uri.parse('http://drcars.hadisolution.com/api/ads-post'));
    request.fields.addAll({
      'title': title.text.trim(),
      'actual_price': actualPrice.text.trim(),
      'discount_price': discountPrice.text.trim(),
      'engine_type': engineType.text.trim(),
      'mpg': mpg.text.trim(),
      'exterior_color_id': exteriorColorId?.id.toString() ?? "0".trim(),
      'interior_color_id': interiorColorId?.id.toString() ?? "0".trim(),
      'drivetrain': drivetrain.text.trim(),
      'transmission': transmission.text.trim(),
      'door': door.text.trim(),
      'seat_capacity': seatCapacity.text.trim(),
      'type_id': "Brand New",
      'manufacture_id': manufactureId ?? "0",
      'vin': vin.text.trim(),
      'stock': "123",
      'location': location ?? "",
    });
    request.files.add(await http.MultipartFile.fromPath('window_sticker', image!.path));
    request.files.add(await http.MultipartFile.fromPath('car_paper_image', image1!.path));
    request.files.add(await http.MultipartFile.fromPath('seller_document_image', image2!.path));
    request.files.add(await http.MultipartFile.fromPath('car_tile_image', image3!.path));
    for (int i = 0; i < imagesPath!.length; i++) {
      print("???????????????????????$i????????????????????????");
      request.files.add(await http.MultipartFile.fromPath('images[]', imagesPath[i]));
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response == null) {
      errorAlert("Please Check Internet Connection");
    } else if (response.statusCode == 200) {
      Get.back();
      _successMessage(context);
      homeController.getActiveListing();
      homeController.getPreviousListing();
      print(response.reasonPhrase);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(tr("Your job successfully posted now waiting for admin approval")),
        duration: Duration(seconds: 4),
      ));
    }
    update();
  }

  Future postingEdited(BuildContext context) async {
    print({
      'listing_id': dataList?.id.toString() ?? "0",
      'title': title.text,
      'actualPrice': actualPrice.text,
      'discountPrice': discountPrice.text,
      'engineType': engineType.text,
      'mpg': mpg.text,
      'exteriorColorId': exteriorColorId?.id.toString() ?? "0",
      'interiorColorId': interiorColorId?.id.toString() ?? "0",
      'drivetrain': drivetrain.text,
      'transmission': transmission.text,
      'door': door.text,
      'seatCapacity': seatCapacity.text,
      'typeId': "1" ?? "",
      'vin': vin.text,
      //'stock':"",
      'location': location ?? "",
    });
    popDialog();
    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': "*",
      'Authorization': 'Bearer $tokenMain'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse('http://drcars.hadisolution.com/api/edit-ads-post'));
    request.fields.addAll({
      'listing_id': dataList?.id.toString() ?? "0",
      'title': title.text.trim(),
      'actual_price': actualPrice.text.trim(),
      'discount_price': discountPrice.text.trim(),
      'engine_type': engineType.text.trim(),
      'mpg': mpg.text.trim(),
      'exterior_color_id': exteriorColorId?.id.toString() ?? "0".trim(),
      'interior_color_id': interiorColorId?.id.toString() ?? "0".trim(),
      'drivetrain': drivetrain.text.trim(),
      'transmission': transmission.text.trim(),
      'door': door.text.trim(),
      'seat_capacity': seatCapacity.text.trim(),
      'type_id': typeId?.id.toString() ?? "0",
      'vin': vin.text.trim(),
      // 'stock':"",
      'location': location ?? "",
    });
    request.files.add(await http.MultipartFile.fromPath('window_sticker', image!.path));
    for (int i = 0; i < images!.length; i++) {
      print("???????????????????????$i????????????????????????");
      request.files.add(await http.MultipartFile.fromPath('images[]', images![i].path));
    }
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    print(response.statusCode);
    if (response == null) {
      errorAlert("Please Check Internet Connection");
    } else if (response.statusCode == 200) {
      _successMessageEdited(context);
      homeController.getActiveListing();
      homeController.getPreviousListing();
    } else {
      Get.back();
      print(response.reasonPhrase);
    }
    update();
  }

  popDialog() {
    Get.defaultDialog(
      backgroundColor: Colors.transparent,
      title: "",
      content: WillPopScope(
          onWillPop: () => Future.value(false),
          child: const CircularProgressIndicator(
            color: Color(0xff054255),
          )),
    );
  }

  void _successMessageEdited(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(bottom: 20),
          scrollable: true,
          content: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  // border: Border(
                  //   top: BorderSide(
                  //     color: Color(0xff054559),
                  //     width: 1.0,
                  //   ),
                  // ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: const BoxDecoration(
                        color: Color(0xff054559),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                        ),
                      ),
                    ),
                    Container(
                      // Set overflow to visible
                      height: 30.h + 60,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -40.h,
                            left: 80.w,
                            child: Center(
                              child: Image.asset(
                                "assets/Icons/success.png",
                                height: 120.h,
                                width: 120.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CustomText(
                            text: 'Your Product Updated \n           Successfully',
                            fontColor: const Color(0xff000000),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Get.offAll(const NavigationBarScreen());
                        },
                        child: CustomText(
                          text: 'Back to Home',
                          fontColor: const Color(0xff37CFDC),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _successMessage(BuildContext context) {
    print("????????????????????????????????????????????????");
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(bottom: 20),
          scrollable: true,
          content: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  // border: Border(
                  //   top: BorderSide(
                  //     color: Color(0xff054559),
                  //     width: 1.0,
                  //   ),
                  // ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: const BoxDecoration(
                        color: Color(0xff054559),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                        ),
                      ),
                    ),
                    Container(
                      // Set overflow to visible
                      height: 30.h + 60,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -40.h,
                            left: 80.w,
                            child: Center(
                              child: Image.asset(
                                "assets/Icons/success.png",
                                height: 120.h,
                                width: 120.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: CustomText(
                            text: 'Your Product Submitted \n           Successfully',
                            fontColor: const Color(0xff000000),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Get.offAll(const NavigationBarScreen());
                        },
                        child: CustomText(
                          text: 'Back to Home',
                          fontColor: const Color(0xff37CFDC),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
