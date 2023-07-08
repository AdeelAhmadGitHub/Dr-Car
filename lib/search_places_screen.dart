import 'package:dr_cars/Controllers/updateLocationControler.dart';
import 'package:dr_cars/google_map/map_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

import 'Controllers/buyer_home_controller.dart';
import 'Controllers/home_controller.dart';
import 'Widgets/CustomButton.dart';
import 'Widgets/custom_text.dart';

class SearchPlacesScreen extends StatefulWidget {
  const SearchPlacesScreen({Key? key}) : super(key: key);
  static const String id = "SearchPlacesScreen";

  @override
  State<SearchPlacesScreen> createState() => _SearchPlacesScreenState();
}

const kGoogleApiKey = 'AIzaSyBx95Bvl9O-US2sQpqZ41GdsHIprnXvJv8';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  CameraPosition initialCameraPosition =
      CameraPosition(target: LatLng(dLatitude ?? 0.0, dLongitude ?? 0.0), zoom: 14.0);

  Set<Marker> markersList = {};

  late GoogleMapController googleMapController;

  final Mode _mode = Mode.overlay;
  LatLng? latLng;
  double _sliderValue = 100.0;
  final homeCont = Get.put(HomeController());
  @override
  void initState() {
    print(dLatitude);
    print(dLongitude);
    // TODO: implement initState
    markersList.add(
      Marker(
        markerId: const MarkerId("001"),
        position: LatLng(dLatitude ?? 0.0, dLongitude ?? 0.0),
      ),
    );
    super.initState();
  }

  void _onSliderChanged(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    homeCont.radius = '';
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
        backgroundColor: Colors.transparent,
        key: homeScaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
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
          title: CustomText(
            text: 'Map Filter',
            fontColor: const Color(0xffFFFFFF),
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.start,
          ),
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    _sliderValue = 100.0;
                    setState(() {});
                  },
                  child: const CustomText(
                    text: "RESET",
                    fontColor: Color(0xffF4F8F8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    homeCont.radius = _sliderValue.toString();
                    homeCont.getSearchData();
                  },
                  child: const CustomText(
                    text: "APPLY",
                    fontColor: Color(0xffF4F8F8),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              initialCameraPosition: initialCameraPosition,
              markers: markersList,
              rotateGesturesEnabled: false,
              scrollGesturesEnabled: false,
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                googleMapController = controller;
              },
            ),
            Center(
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 2, color: Colors.black)),
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: _sliderValue,
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(.8),
              height: 90.0.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      const CustomText(
                        text: "Browsing Around",
                        fontColor: Color(0xffFFFFFF),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                    child: Slider(
                      activeColor: Color(0xff37DC44),
                      inactiveColor: Color(0xffB1FFB8),
                      value: _sliderValue,
                      max: 100,
                      min: 0,
                      onChanged: _onSliderChanged,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      CustomText(
                        text: "${_sliderValue.toPrecision(3)} km",
                        fontColor: Color(0xffFFFFFF),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: SizedBox(
            //     height: 40.h,
            //     child: CustomButton(
            //       text:'Submit',
            //       onPressed: () async {
            //         print('latlng successfully');
            //         if (latLng != null) {
            //           //
            //           // Object? data = {"latlng": latLng};
            //           Navigator.pop(context, latLng);
            //         } else {
            //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            //             content: Text('Select Place first.'),
            //           ));
            //         }
            //       },
            //     ),
            //   ),
            // ),
            // Positioned(
            //   top: 10.h,
            //   right: 10.w,
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: InkWell(
            //       onTap: () {
            //         getCurrentLocation();
            //         setState(() {});
            //       },
            //       child: Material(
            //         borderRadius: BorderRadius.circular(8.0),
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Icon(
            //             Icons.my_location_outlined,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Future _handlePressButton() async {
    Prediction? p = await PlacesAutocomplete.show(
      context: context,
      apiKey: kGoogleApiKey,
      onError: onError,
      mode: _mode,
      language: 'en',
      strictbounds: false,
      types: [""],
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
      components: [
        // Component(Component.country, "pk"),
        // Component(Component.country, "usa")
      ],
    );

    displayPrediction(p!, homeScaffoldKey.currentState);
  }

  onError(PlacesAutocompleteResponse response) {
    // homeScaffoldKey.currentState!
    //     .showSnackBar(SnackBar(content: Text(response.errorMessage!)));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future displayPrediction(Prediction p, ScaffoldState? currentState) async {
    GoogleMapsPlaces places = GoogleMapsPlaces(
      apiKey: kGoogleApiKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );

    PlacesDetailsResponse detail = await places.getDetailsByPlaceId(p.placeId!);
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;
    print(lat);
    print(lng);
    // final address = detail.result.geometry!.location.lng;
    latLng = LatLng(lat, lng);
    markersList.clear();
    markersList.add(
      Marker(
        markerId: const MarkerId("001"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: detail.result.name),
      ),
    );

    setState(() {});

    googleMapController.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));
  }
}
