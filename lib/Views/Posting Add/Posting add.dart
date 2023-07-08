import 'package:dr_cars/Controllers/add_post_controller.dart';
import 'package:dr_cars/Controllers/home_controller.dart';
import 'package:dr_cars/Views/NavigationBar/NavigationBar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Models/AllManufacturesModel.dart';
import '../../Widgets/custom_text.dart';
import 'Posting add1.dart';

class PostingAdd extends StatefulWidget {
  const PostingAdd({Key? key}) : super(key: key);

  @override
  State<PostingAdd> createState() => _PostingAddState();
}

class _PostingAddState extends State<PostingAdd> {
  List<int> selectedItem = [];
  int selectedIndex = 0;
  final homeCont = Get.put(HomeController());
  final addPostCont = Get.put(AddPostController());



TextEditingController searchCont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/Homebck.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: GetX<HomeController>(builder: (cont) {
          return Scaffold(
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
                    text: tr('Posting add'),
                    fontColor: const Color(0xffFFFFFF),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              body: cont.manufactureLoading.value == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SafeArea(
                      child: Container(
                        padding: const EdgeInsets.only(top: 20).r,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: tr('Select a Make'),
                                fontColor: const Color(0xffFFFFFF),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(width: 1, color: const Color(0xffC6BEE3)),
                                ),
                                child: TextField(
                                  controller:searchCont,
                                  decoration: InputDecoration(
                                    hintText: tr('Search'),
                                    hintStyle: TextStyle(
                                      color: Color(0xff606060),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),

                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.search, color: Color(0xff727272)),
                                  ),
                                  onChanged: (value){

                                    setState(() {

                                    });


                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Divider(
                                height: 4,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: homeCont.allManufacturesModel?.manufactures?.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      final value = homeCont.allManufacturesModel?.manufactures?[index];
                                      if(searchCont.text.isEmpty){
                                      return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              addPostCont.manufactureId = value?.id.toString() ?? "";
                                              Get.to(PostingAdd1(
                                                isEdited: false,
                                              ));
                                            },
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  child: Image.network(
                                                    value?.logo ?? "",
                                                    height: 40.h,
                                                    width: 40.w,
                                                  ),
                                                  backgroundColor: Colors.white,
                                                  radius: 25,
                                                ),
                                                SizedBox(
                                                  width: 20.w,
                                                ),
/*
                                          Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(0xffF4F4F4),
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                          ),
*/
                                                SizedBox(
                                                  width: 20.w,
                                                ),
                                                CustomText(
                                                  text: value?.name ?? "N/A",
                                                  fontColor: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  textAlign: TextAlign.end,
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Divider(
                                            height: 4,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                        ],
                                      );}else if(value!.name!.toLowerCase()
                                          .contains(searchCont.text.toLowerCase().toString())){
                                        return Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              addPostCont.manufactureId = value?.id.toString() ?? "";
                                              Get.to(PostingAdd1(
                                                isEdited: false,
                                              ));
                                            },
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  child: Image.network(
                                                    value?.logo ?? "",
                                                    height: 40.h,
                                                    width: 40.w,
                                                  ),
                                                  backgroundColor: Colors.white,
                                                  radius: 25,
                                                ),
                                                SizedBox(
                                                  width: 20.w,
                                                ),
/*
                                          Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(
                                                  color: Color(0xffF4F4F4),
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                          ),
*/
                                                SizedBox(
                                                  width: 20.w,
                                                ),
                                                CustomText(
                                                  text: value?.name ?? "N/A",
                                                  fontColor: Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                  textAlign: TextAlign.end,
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Divider(
                                            height: 4,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                        ],
                                      );}else{
                                        return Container();

                                    }})
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
        }));
  }
}
