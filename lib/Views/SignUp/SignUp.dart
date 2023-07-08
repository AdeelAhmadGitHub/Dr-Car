import 'dart:async';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dr_cars/Controllers/auth_Controller.dart';
import 'package:dr_cars/Widgets/CustomButton.dart';
import 'package:dr_cars/Widgets/CustomOTPTextFiledBox/CustomOTPTextFiledBox.dart';
import 'package:dr_cars/Widgets/custom_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Utils/app_constants.dart';
import '../NavigationBar/NavigationBayer/NavigationBayer.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  TextEditingController oneController = TextEditingController();
  TextEditingController twoController = TextEditingController();
  TextEditingController threeController = TextEditingController();
  TextEditingController fourController = TextEditingController();
  TextEditingController fiveController = TextEditingController();
  TextEditingController sixController = TextEditingController();
  // final TextEditingController otpController = TextEditingController();
  final auth = Get.put(AuthController());
  String? phoneNumber;
  int countDownTimer = 60;
  bool isShow = false;

  startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countDownTimer > 0) {
        if (this.mounted) {
          setState(() {
            countDownTimer--;
            // Your state change code goes here
          });
        }
      } else {
        timer.cancel();
      }
    });
  }

  String? verificationId;
  String? code;
  CountryCode? countryCode;
  bool showLoading = false;
  SharedPreferences? prefs;
  TextEditingController phoneTextEditingController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  getMobileFormWidget(context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 86.h, bottom: 20.h),
                      child: CustomText(
                        text: tr("Sign In"),
                        fontColor: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 130.w),
                    child: Image.asset(
                      'assets/Icons/icon.png',
                      height: 180.h,
                      width: 197.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(
                      text: tr("Enter your Mobile Number to Register account"),
                      fontColor: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 8.0),
                      //   child: CountryListPick(
                      //     pickerBuilder: (context, countryCode) {
                      //       return Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //         crossAxisAlignment: CrossAxisAlignment.center,
                      //         children: [
                      //           Image.asset(
                      //             countryCode!.flagUri!,
                      //             package: 'country_list_pick',
                      //             height: 20.h,
                      //             width: 15.w,
                      //           ),
                      //           Text(
                      //             countryCode.dialCode!,
                      //             style: const TextStyle(color: Colors.white, fontSize: 10),
                      //           ),
                      //           const Icon(
                      //             Icons.keyboard_arrow_down,
                      //             color: Colors.white,
                      //             size: 18,
                      //           )
                      //         ],
                      //       );
                      //     },
                      //     theme: CountryTheme(isDownIcon: true, isShowTitle: false),
                      //     initialSelection: '+92',
                      //     onChanged: (code) {
                      //       countryCode = code;
                      //     },
                      //   ),
                      // ),
                      Flexible(
                        child: CountryCodePicker(
                          textOverflow: TextOverflow.ellipsis,
                          flagWidth: 40,
                          countryList: const [
                            {
                              'name': 'Dominican Republic',
                              'code': 'DO',
                              'dial_code': '+1809',
                            },
                            {
                              'name': 'Dominican Republic',
                              'code': 'DO',
                              'dial_code': '+1849',
                            },
                            {
                              'name': 'Dominican Republic',
                              'code': 'DO',
                              'dial_code': '+1829',
                            },
                            {
                              "name": "افغانستان",
                              "code": "AF",
                              "dial_code": "+93",
                            },
                            {
                              "name": "Åland",
                              "code": "AX",
                              "dial_code": "+358",
                            },
                            {
                              "name": "Shqipëria",
                              "code": "AL",
                              "dial_code": "+355",
                            },
                            {
                              "name": "الجزائر",
                              "code": "DZ",
                              "dial_code": "+213",
                            },
                            {
                              "name": "American Samoa",
                              "code": "AS",
                              "dial_code": "+1684",
                            },
                            {
                              "name": "Andorra",
                              "code": "AD",
                              "dial_code": "+376",
                            },
                            {
                              "name": "Angola",
                              "code": "AO",
                              "dial_code": "+244",
                            },
                            {
                              "name": "Anguilla",
                              "code": "AI",
                              "dial_code": "+1264",
                            },
                            {
                              "name": "Antarctica",
                              "code": "AQ",
                              "dial_code": "+672",
                            },
                            {
                              "name": "Antigua and Barbuda",
                              "code": "AG",
                              "dial_code": "+1268",
                            },
                            {
                              "name": "Argentina",
                              "code": "AR",
                              "dial_code": "+54",
                            },
                            {
                              "name": "Հայաստան",
                              "code": "AM",
                              "dial_code": "+374",
                            },
                            {
                              "name": "Aruba",
                              "code": "AW",
                              "dial_code": "+297",
                            },
                            {
                              "name": "Australia",
                              "code": "AU",
                              "dial_code": "+61",
                            },
                            {
                              "name": "Österreich",
                              "code": "AT",
                              "dial_code": "+43",
                            },
                            {
                              "name": "Azərbaycan",
                              "code": "AZ",
                              "dial_code": "+994",
                            },
                            {
                              "name": "Bahamas",
                              "code": "BS",
                              "dial_code": "+1242",
                            },
                            {
                              "name": "‏البحرين",
                              "code": "BH",
                              "dial_code": "+973",
                            },
                            {
                              "name": "Bangladesh",
                              "code": "BD",
                              "dial_code": "+880",
                            },
                            {
                              "name": "Barbados",
                              "code": "BB",
                              "dial_code": "+1246",
                            },
                            {
                              "name": "Белару́сь",
                              "code": "BY",
                              "dial_code": "+375",
                            },
                            {
                              "name": "België",
                              "code": "BE",
                              "dial_code": "+32",
                            },
                            {
                              "name": "Belize",
                              "code": "BZ",
                              "dial_code": "+501",
                            },
                            {
                              "name": "Bénin",
                              "code": "BJ",
                              "dial_code": "+229",
                            },
                            {
                              "name": "Bermuda",
                              "code": "BM",
                              "dial_code": "+1441",
                            },
                            {
                              "name": "ʼbrug-yul",
                              "code": "BT",
                              "dial_code": "+975",
                            },
                            {
                              "name": "Bolivia",
                              "code": "BO",
                              "dial_code": "+591",
                            },
                            {
                              "name": "Bosna i Hercegovina",
                              "code": "BA",
                              "dial_code": "+387",
                            },
                            {
                              "name": "Botswana",
                              "code": "BW",
                              "dial_code": "+267",
                            },
                            {
                              "name": "Bouvetøya",
                              "code": "BV",
                              "dial_code": "+47",
                            },
                            {
                              "name": "Brasil",
                              "code": "BR",
                              "dial_code": "+55",
                            },
                            {
                              "name": "British Indian Ocean Territory",
                              "code": "IO",
                              "dial_code": "+246",
                            },
                            {
                              "name": "Negara Brunei Darussalam",
                              "code": "BN",
                              "dial_code": "+673",
                            },
                            {
                              "name": "България",
                              "code": "BG",
                              "dial_code": "+359",
                            },
                            {
                              "name": "Burkina Faso",
                              "code": "BF",
                              "dial_code": "+226",
                            },
                            {
                              "name": "Burundi",
                              "code": "BI",
                              "dial_code": "+257",
                            },
                            {
                              "name": "Cambodia",
                              "code": "KH",
                              "dial_code": "+855",
                            },
                            {
                              "name": "Cameroon",
                              "code": "CM",
                              "dial_code": "+237",
                            },
                            {
                              "name": "Canada",
                              "code": "CA",
                              "dial_code": "+1",
                            },
                            {
                              "name": "Cabo Verde",
                              "code": "CV",
                              "dial_code": "+238",
                            },
                            {
                              "name": "Cayman Islands",
                              "code": "KY",
                              "dial_code": "+1345",
                            },
                            {
                              "name": "Ködörösêse tî Bêafrîka",
                              "code": "CF",
                              "dial_code": "+236",
                            },
                            {
                              "name": "Tchad",
                              "code": "TD",
                              "dial_code": "+235",
                            },
                            {
                              "name": "Chile",
                              "code": "CL",
                              "dial_code": "+56",
                            },
                            {
                              "name": "中国",
                              "code": "CN",
                              "dial_code": "+86",
                            },
                            {
                              "name": "Christmas Island",
                              "code": "CX",
                              "dial_code": "+61",
                            },
                            {
                              "name": "Cocos (Keeling) Islands",
                              "code": "CC",
                              "dial_code": "+61",
                            },
                            {
                              "name": "Colombia",
                              "code": "CO",
                              "dial_code": "+57",
                            },
                            {
                              "name": "Komori",
                              "code": "KM",
                              "dial_code": "+269",
                            },
                            {
                              "name": "République du Congo",
                              "code": "CG",
                              "dial_code": "+242",
                            },
                            {
                              "name": "République démocratique du Congo",
                              "code": "CD",
                              "dial_code": "+243",
                            },
                            {
                              "name": "Cook Islands",
                              "code": "CK",
                              "dial_code": "+682",
                            },
                            {
                              "name": "Costa Rica",
                              "code": "CR",
                              "dial_code": "+506",
                            },
                            {
                              "name": "Côte d'Ivoire",
                              "code": "CI",
                              "dial_code": "+225",
                            },
                            {
                              "name": "Hrvatska",
                              "code": "HR",
                              "dial_code": "+385",
                            },
                            {
                              "name": "Cuba",
                              "code": "CU",
                              "dial_code": "+53",
                            },
                            {
                              "name": "Κύπρος",
                              "code": "CY",
                              "dial_code": "+357",
                            },
                            {
                              "name": "Česká republika",
                              "code": "CZ",
                              "dial_code": "+420",
                            },
                            {
                              "name": "Danmark",
                              "code": "DK",
                              "dial_code": "+45",
                            },
                            {
                              "name": "Djibouti",
                              "code": "DJ",
                              "dial_code": "+253",
                            },
                            {
                              "name": "Dominica",
                              "code": "DM",
                              "dial_code": "+1767",
                            },
                            {
                              "name": "República Dominicana",
                              "code": "DO",
                              "dial_code": "+1",
                            },
                            {
                              "name": "Ecuador",
                              "code": "EC",
                              "dial_code": "+593",
                            },
                            {
                              "name": "مصر‎",
                              "code": "EG",
                              "dial_code": "+20",
                            },
                            {
                              "name": "El Salvador",
                              "code": "SV",
                              "dial_code": "+503",
                            },
                            {
                              "name": "Guinea Ecuatorial",
                              "code": "GQ",
                              "dial_code": "+240",
                            },
                            {
                              "name": "ኤርትራ",
                              "code": "ER",
                              "dial_code": "+291",
                            },
                            {
                              "name": "Eesti",
                              "code": "EE",
                              "dial_code": "+372",
                            },
                            {
                              "name": "ኢትዮጵያ",
                              "code": "ET",
                              "dial_code": "+251",
                            },
                            {
                              "name": "Falkland Islands",
                              "code": "FK",
                              "dial_code": "+500",
                            },
                            {
                              "name": "Føroyar",
                              "code": "FO",
                              "dial_code": "+298",
                            },
                            {
                              "name": "Fiji",
                              "code": "FJ",
                              "dial_code": "+679",
                            },
                            {
                              "name": "Suomi",
                              "code": "FI",
                              "dial_code": "+358",
                            },
                            {
                              "name": "France",
                              "code": "FR",
                              "dial_code": "+33",
                            },
                            {
                              "name": "Guyane française",
                              "code": "GF",
                              "dial_code": "+594",
                            },
                            {
                              "name": "Polynésie française",
                              "code": "PF",
                              "dial_code": "+689",
                            },
                            {
                              "name": "Territoire des Terres australes et antarctiques fr",
                              "code": "TF",
                              "dial_code": "+262",
                            },
                            {
                              "name": "Gabon",
                              "code": "GA",
                              "dial_code": "+241",
                            },
                            {
                              "name": "Gambia",
                              "code": "GM",
                              "dial_code": "+220",
                            },
                            {
                              "name": "საქართველო",
                              "code": "GE",
                              "dial_code": "+995",
                            },
                            {
                              "name": "Deutschland",
                              "code": "DE",
                              "dial_code": "+49",
                            },
                            {
                              "name": "Ghana",
                              "code": "GH",
                              "dial_code": "+233",
                            },
                            {
                              "name": "Gibraltar",
                              "code": "GI",
                              "dial_code": "+350",
                            },
                            {
                              "name": "Ελλάδα",
                              "code": "GR",
                              "dial_code": "+30",
                            },
                            {
                              "name": "Kalaallit Nunaat",
                              "code": "GL",
                              "dial_code": "+299",
                            },
                            {
                              "name": "Grenada",
                              "code": "GD",
                              "dial_code": "+1473",
                            },
                            {
                              "name": "Guadeloupe",
                              "code": "GP",
                              "dial_code": "+590",
                            },
                            {
                              "name": "Guam",
                              "code": "GU",
                              "dial_code": "+1671",
                            },
                            {
                              "name": "Guatemala",
                              "code": "GT",
                              "dial_code": "+502",
                            },
                            {
                              "name": "Guernsey",
                              "code": "GG",
                              "dial_code": "+44",
                            },
                            {
                              "name": "Guinée",
                              "code": "GN",
                              "dial_code": "+224",
                            },
                            {
                              "name": "Guiné-Bissau",
                              "code": "GW",
                              "dial_code": "+245",
                            },
                            {
                              "name": "Guyana",
                              "code": "GY",
                              "dial_code": "+592",
                            },
                            {
                              "name": "Haïti",
                              "code": "HT",
                              "dial_code": "+509",
                            },
                            {
                              "name": "Heard Island and McDonald Islands",
                              "code": "HM",
                              "dial_code": "+0",
                            },
                            {
                              "name": "Vaticano",
                              "code": "VA",
                              "dial_code": "+379",
                            },
                            {
                              "name": "Honduras",
                              "code": "HN",
                              "dial_code": "+504",
                            },
                            {
                              "name": "香港",
                              "code": "HK",
                              "dial_code": "+852",
                            },
                            {
                              "name": "Magyarország",
                              "code": "HU",
                              "dial_code": "+36",
                            },
                            {
                              "name": "Ísland",
                              "code": "IS",
                              "dial_code": "+354",
                            },
                            {
                              "name": "भारत",
                              "code": "IN",
                              "dial_code": "+91",
                            },
                            {
                              "name": "Indonesia",
                              "code": "ID",
                              "dial_code": "+62",
                            },
                            {
                              "name": "ایران",
                              "code": "IR",
                              "dial_code": "+98",
                            },
                            {
                              "name": "العراق",
                              "code": "IQ",
                              "dial_code": "+964",
                            },
                            {
                              "name": "Éire",
                              "code": "IE",
                              "dial_code": "+353",
                            },
                            {
                              "name": "Isle of Man",
                              "code": "IM",
                              "dial_code": "+44",
                            },
                            {
                              "name": "ישראל",
                              "code": "IL",
                              "dial_code": "+972",
                            },
                            {
                              "name": "Italia",
                              "code": "IT",
                              "dial_code": "+39",
                            },
                            {
                              "name": "Jamaica",
                              "code": "JM",
                              "dial_code": "+1876",
                            },
                            {
                              "name": "日本",
                              "code": "JP",
                              "dial_code": "+81",
                            },
                            {
                              "name": "Jersey",
                              "code": "JE",
                              "dial_code": "+44",
                            },
                            {
                              "name": "الأردن",
                              "code": "JO",
                              "dial_code": "+962",
                            },
                            {
                              "name": "Қазақстан",
                              "code": "KZ",
                              "dial_code": "+7",
                            },
                            {
                              "name": "Kenya",
                              "code": "KE",
                              "dial_code": "+254",
                            },
                            {
                              "name": "Kiribati",
                              "code": "KI",
                              "dial_code": "+686",
                            },
                            {
                              "name": "북한",
                              "code": "KP",
                              "dial_code": "+850",
                            },
                            {
                              "name": "대한민국",
                              "code": "KR",
                              "dial_code": "+82",
                            },
                            {
                              "name": "Republika e Kosovës",
                              "code": "XK",
                              "dial_code": "+383",
                            },
                            {
                              "name": "الكويت",
                              "code": "KW",
                              "dial_code": "+965",
                            },
                            {
                              "name": "Кыргызстан",
                              "code": "KG",
                              "dial_code": "+996",
                            },
                            {
                              "name": "ສປປລາວ",
                              "code": "LA",
                              "dial_code": "+856",
                            },
                            {
                              "name": "Latvija",
                              "code": "LV",
                              "dial_code": "+371",
                            },
                            {
                              "name": "لبنان",
                              "code": "LB",
                              "dial_code": "+961",
                            },
                            {
                              "name": "Lesotho",
                              "code": "LS",
                              "dial_code": "+266",
                            },
                            {
                              "name": "Liberia",
                              "code": "LR",
                              "dial_code": "+231",
                            },
                            {
                              "name": "‏ليبيا",
                              "code": "LY",
                              "dial_code": "+218",
                            },
                            {
                              "name": "Liechtenstein",
                              "code": "LI",
                              "dial_code": "+423",
                            },
                            {
                              "name": "Lietuva",
                              "code": "LT",
                              "dial_code": "+370",
                            },
                            {
                              "name": "Luxembourg",
                              "code": "LU",
                              "dial_code": "+352",
                            },
                            {
                              "name": "澳門",
                              "code": "MO",
                              "dial_code": "+853",
                            },
                            {
                              "name": "Македонија",
                              "code": "MK",
                              "dial_code": "+389",
                            },
                            {
                              "name": "Madagasikara",
                              "code": "MG",
                              "dial_code": "+261",
                            },
                            {
                              "name": "Malawi",
                              "code": "MW",
                              "dial_code": "+265",
                            },
                            {
                              "name": "Malaysia",
                              "code": "MY",
                              "dial_code": "+60",
                            },
                            {
                              "name": "Maldives",
                              "code": "MV",
                              "dial_code": "+960",
                            },
                            {
                              "name": "Mali",
                              "code": "ML",
                              "dial_code": "+223",
                            },
                            {
                              "name": "Malta",
                              "code": "MT",
                              "dial_code": "+356",
                            },
                            {
                              "name": "M̧ajeļ",
                              "code": "MH",
                              "dial_code": "+692",
                            },
                            {
                              "name": "Martinique",
                              "code": "MQ",
                              "dial_code": "+596",
                            },
                            {
                              "name": "موريتانيا",
                              "code": "MR",
                              "dial_code": "+222",
                            },
                            {
                              "name": "Maurice",
                              "code": "MU",
                              "dial_code": "+230",
                            },
                            {
                              "name": "Mayotte",
                              "code": "YT",
                              "dial_code": "+262",
                            },
                            {
                              "name": "México",
                              "code": "MX",
                              "dial_code": "+52",
                            },
                            {
                              "name": "Micronesia",
                              "code": "FM",
                              "dial_code": "+691",
                            },
                            {
                              "name": "Moldova",
                              "code": "MD",
                              "dial_code": "+373",
                            },
                            {
                              "name": "Monaco",
                              "code": "MC",
                              "dial_code": "+377",
                            },
                            {
                              "name": "Монгол улс",
                              "code": "MN",
                              "dial_code": "+976",
                            },
                            {
                              "name": "Црна Гора",
                              "code": "ME",
                              "dial_code": "+382",
                            },
                            {
                              "name": "Montserrat",
                              "code": "MS",
                              "dial_code": "+1664",
                            },
                            {
                              "name": "المغرب",
                              "code": "MA",
                              "dial_code": "+212",
                            },
                            {
                              "name": "Moçambique",
                              "code": "MZ",
                              "dial_code": "+258",
                            },
                            {
                              "name": "Myanmar",
                              "code": "MM",
                              "dial_code": "+95",
                            },
                            {
                              "name": "Namibia",
                              "code": "NA",
                              "dial_code": "+264",
                            },
                            {
                              "name": "Nauru",
                              "code": "NR",
                              "dial_code": "+674",
                            },
                            {
                              "name": "नेपाल",
                              "code": "NP",
                              "dial_code": "+977",
                            },
                            {
                              "name": "Nederland",
                              "code": "NL",
                              "dial_code": "+31",
                            },
                            {
                              "name": "Netherlands Antilles",
                              "code": "AN",
                              "dial_code": "+599",
                            },
                            {
                              "name": "Nouvelle-Calédonie",
                              "code": "NC",
                              "dial_code": "+687",
                            },
                            {
                              "name": "New Zealand",
                              "code": "NZ",
                              "dial_code": "+64",
                            },
                            {
                              "name": "Nicaragua",
                              "code": "NI",
                              "dial_code": "+505",
                            },
                            {
                              "name": "Niger",
                              "code": "NE",
                              "dial_code": "+227",
                            },
                            {
                              "name": "Nigeria",
                              "code": "NG",
                              "dial_code": "+234",
                            },
                            {
                              "name": "Niuē",
                              "code": "NU",
                              "dial_code": "+683",
                            },
                            {
                              "name": "Norfolk Island",
                              "code": "NF",
                              "dial_code": "+672",
                            },
                            {
                              "name": "Northern Mariana Islands",
                              "code": "MP",
                              "dial_code": "+1670",
                            },
                            {
                              "name": "Norge",
                              "code": "NO",
                              "dial_code": "+47",
                            },
                            {
                              "name": "عمان",
                              "code": "OM",
                              "dial_code": "+968",
                            },
                            {
                              "name": "Pakistan",
                              "code": "PK",
                              "dial_code": "+92",
                            },
                            {
                              "name": "Palau",
                              "code": "PW",
                              "dial_code": "+680",
                            },
                            {
                              "name": "فلسطين",
                              "code": "PS",
                              "dial_code": "+970",
                            },
                            {
                              "name": "Panamá",
                              "code": "PA",
                              "dial_code": "+507",
                            },
                            {
                              "name": "Papua Niugini",
                              "code": "PG",
                              "dial_code": "+675",
                            },
                            {
                              "name": "Paraguay",
                              "code": "PY",
                              "dial_code": "+595",
                            },
                            {
                              "name": "Perú",
                              "code": "PE",
                              "dial_code": "+51",
                            },
                            {
                              "name": "Pilipinas",
                              "code": "PH",
                              "dial_code": "+63",
                            },
                            {
                              "name": "Pitcairn Islands",
                              "code": "PN",
                              "dial_code": "+64",
                            },
                            {
                              "name": "Polska",
                              "code": "PL",
                              "dial_code": "+48",
                            },
                            {
                              "name": "Portugal",
                              "code": "PT",
                              "dial_code": "+351",
                            },
                            {
                              "name": "Puerto Rico",
                              "code": "PR",
                              "dial_code": "+1939",
                            },
                            {
                              "name": "Puerto Rico",
                              "code": "PR",
                              "dial_code": "+1787",
                            },
                            {
                              "name": "قطر",
                              "code": "QA",
                              "dial_code": "+974",
                            },
                            {
                              "name": "România",
                              "code": "RO",
                              "dial_code": "+40",
                            },
                            {
                              "name": "Россия",
                              "code": "RU",
                              "dial_code": "+7",
                            },
                            {
                              "name": "Rwanda",
                              "code": "RW",
                              "dial_code": "+250",
                            },
                            {
                              "name": "La Réunion",
                              "code": "RE",
                              "dial_code": "+262",
                            },
                            {
                              "name": "Saint-Barthélemy",
                              "code": "BL",
                              "dial_code": "+590",
                            },
                            {
                              "name": "Saint Helena",
                              "code": "SH",
                              "dial_code": "+290",
                            },
                            {
                              "name": "Saint Kitts and Nevis",
                              "code": "KN",
                              "dial_code": "+1869",
                            },
                            {
                              "name": "Saint Lucia",
                              "code": "LC",
                              "dial_code": "+1758",
                            },
                            {
                              "name": "Saint-Martin",
                              "code": "MF",
                              "dial_code": "+590",
                            },
                            {
                              "name": "Saint-Pierre-et-Miquelon",
                              "code": "PM",
                              "dial_code": "+508",
                            },
                            {
                              "name": "Saint Vincent and the Grenadines",
                              "code": "VC",
                              "dial_code": "+1784",
                            },
                            {
                              "name": "Samoa",
                              "code": "WS",
                              "dial_code": "+685",
                            },
                            {
                              "name": "San Marino",
                              "code": "SM",
                              "dial_code": "+378",
                            },
                            {
                              "name": "São Tomé e Príncipe",
                              "code": "ST",
                              "dial_code": "+239",
                            },
                            {
                              "name": "العربية السعودية",
                              "code": "SA",
                              "dial_code": "+966",
                            },
                            {
                              "name": "Sénégal",
                              "code": "SN",
                              "dial_code": "+221",
                            },
                            {
                              "name": "Србија",
                              "code": "RS",
                              "dial_code": "+381",
                            },
                            {
                              "name": "Seychelles",
                              "code": "SC",
                              "dial_code": "+248",
                            },
                            {
                              "name": "Sierra Leone",
                              "code": "SL",
                              "dial_code": "+232",
                            },
                            {
                              "name": "Singapore",
                              "code": "SG",
                              "dial_code": "+65",
                            },
                            {
                              "name": "Slovensko",
                              "code": "SK",
                              "dial_code": "+421",
                            },
                            {
                              "name": "Slovenija",
                              "code": "SI",
                              "dial_code": "+386",
                            },
                            {
                              "name": "Solomon Islands",
                              "code": "SB",
                              "dial_code": "+677",
                            },
                            {
                              "name": "Soomaaliya",
                              "code": "SO",
                              "dial_code": "+252",
                            },
                            {
                              "name": "South Africa",
                              "code": "ZA",
                              "dial_code": "+27",
                            },
                            {
                              "name": "South Sudan",
                              "code": "SS",
                              "dial_code": "+211",
                            },
                            {
                              "name": "South Georgia",
                              "code": "GS",
                              "dial_code": "+500",
                            },
                            {
                              "name": "España",
                              "code": "ES",
                              "dial_code": "+34",
                            },
                            {
                              "name": "Sri Lanka",
                              "code": "LK",
                              "dial_code": "+94",
                            },
                            {
                              "name": "السودان",
                              "code": "SD",
                              "dial_code": "+249",
                            },
                            {
                              "name": "Suriname",
                              "code": "SR",
                              "dial_code": "+597",
                            },
                            {
                              "name": "Svalbard og Jan Mayen",
                              "code": "SJ",
                              "dial_code": "+47",
                            },
                            {
                              "name": "Swaziland",
                              "code": "SZ",
                              "dial_code": "+268",
                            },
                            {
                              "name": "Sverige",
                              "code": "SE",
                              "dial_code": "+46",
                            },
                            {
                              "name": "Schweiz",
                              "code": "CH",
                              "dial_code": "+41",
                            },
                            {
                              "name": "سوريا",
                              "code": "SY",
                              "dial_code": "+963",
                            },
                            {
                              "name": "臺灣",
                              "code": "TW",
                              "dial_code": "+886",
                            },
                            {
                              "name": "Тоҷикистон",
                              "code": "TJ",
                              "dial_code": "+992",
                            },
                            {
                              "name": "Tanzania",
                              "code": "TZ",
                              "dial_code": "+255",
                            },
                            {
                              "name": "ประเทศไทย",
                              "code": "TH",
                              "dial_code": "+66",
                            },
                            {
                              "name": "Timor-Leste",
                              "code": "TL",
                              "dial_code": "+670",
                            },
                            {
                              "name": "Togo",
                              "code": "TG",
                              "dial_code": "+228",
                            },
                            {
                              "name": "Tokelau",
                              "code": "TK",
                              "dial_code": "+690",
                            },
                            {
                              "name": "Tonga",
                              "code": "TO",
                              "dial_code": "+676",
                            },
                            {
                              "name": "Trinidad and Tobago",
                              "code": "TT",
                              "dial_code": "+1868",
                            },
                            {
                              "name": "تونس",
                              "code": "TN",
                              "dial_code": "+216",
                            },
                            {
                              "name": "Türkiye",
                              "code": "TR",
                              "dial_code": "+90",
                            },
                            {
                              "name": "Türkmenistan",
                              "code": "TM",
                              "dial_code": "+993",
                            },
                            {
                              "name": "Turks and Caicos Islands",
                              "code": "TC",
                              "dial_code": "+1649",
                            },
                            {
                              "name": "Tuvalu",
                              "code": "TV",
                              "dial_code": "+688",
                            },
                            {
                              "name": "Uganda",
                              "code": "UG",
                              "dial_code": "+256",
                            },
                            {
                              "name": "Україна",
                              "code": "UA",
                              "dial_code": "+380",
                            },
                            {
                              "name": "دولة الإمارات العربية المتحدة",
                              "code": "AE",
                              "dial_code": "+971",
                            },
                            {
                              "name": "United Kingdom",
                              "code": "GB",
                              "dial_code": "+44",
                            },
                            {
                              "name": "United States",
                              "code": "US",
                              "dial_code": "+1",
                            },
                            {
                              "name": "Uruguay",
                              "code": "UY",
                              "dial_code": "+598",
                            },
                            {
                              "name": "O‘zbekiston",
                              "code": "UZ",
                              "dial_code": "+998",
                            },
                            {
                              "name": "Vanuatu",
                              "code": "VU",
                              "dial_code": "+678",
                            },
                            {
                              "name": "Venezuela",
                              "code": "VE",
                              "dial_code": "+58",
                            },
                            {
                              "name": "Việt Nam",
                              "code": "VN",
                              "dial_code": "+84",
                            },
                            {
                              "name": "British Virgin Islands",
                              "code": "VG",
                              "dial_code": "+1284",
                            },
                            {
                              "name": "United States Virgin Islands",
                              "code": "VI",
                              "dial_code": "+1340",
                            },
                            {
                              "name": "Wallis et Futuna",
                              "code": "WF",
                              "dial_code": "+681",
                            },
                            {
                              "name": "اليَمَن",
                              "code": "YE",
                              "dial_code": "+967",
                            },
                            {
                              "name": "Zambia",
                              "code": "ZM",
                              "dial_code": "+260",
                            },
                            {
                              "name": "Zimbabwe",
                              "code": "ZW",
                              "dial_code": "+263",
                            },
                          ],
                          // countryFilter: const [
                          //   "+1809",
                          // ],
                          textStyle: const TextStyle(color: Colors.white),
                          onChanged: (value) {
                            setState(() {
                              countryCode = value;
                            });
                          },
                          initialSelection: "US",

                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: true,
                        ),
                      ),

                      SizedBox(
                        width: 210.w,
                        child: TextFormField(
                          onTap: () => FocusScope.of(context).unfocus(),
                          style: TextStyle(color: Colors.white),
                          onChanged: (val) {},
                          controller: phoneTextEditingController,
                          cursorColor: const Color(0xff5AD6FE),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                )),
                            contentPadding: EdgeInsets.only(top: 4.h, bottom: 4.h, left: 10.w, right: 10.w),
                            hintText: "(525)333-1254",
                            hintStyle: TextStyle(
                                fontFamily: "DM Sans",
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/Images/SigninLine.png",
                    color: Color(0xff606060),
                  ),
                  SizedBox(height: 110.h),
                  SizedBox(
                    width: 237.w,
                    child: CustomButton(
                      text: tr("Sign in"),
                      textColor: Colors.black,
                      buttonColor: Colors.white,
                      // onPressed:(){ authController.login(context, '123456789');},
                      onPressed: () {
                        _verifyPhoneNumber();
                        //   auth.login("+92307022345");
                      },
                      textSize: 18.sp,
                      textFontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: 237.w,
                    child: CustomButton(
                      text: tr("Skip"),
                      textColor: Colors.black,
                      buttonColor: Colors.white,
                      // onPressed:(){ authController.login(context, '123456789');},
                      onPressed: () async {
                        await prefs?.setString(AppConstants().userCheck, "false");

                        Get.off(NavigationBarScreenBayer());
                      },
                      textSize: 18.sp,
                      textFontWeight: FontWeight.w600,
                    ),
                  ),
                  //  ),
                  // backgroundColor: Colors.lightBlue[50],
                ],
              ),
            ),
          ),
        ));
  }

  getOtpFormWidget(context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Images/background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100.h, bottom: 15.h),
                    child: Text(
                      "00:$countDownTimer",
                      style: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffC0C0C0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "${tr("Type the verification code we’ve sent you on")} $phoneNumber",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xffC0C0C0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, left: 150.w),
                    child: Image.asset(
                      'assets/Icons/icon.png',
                      height: 140.h,
                      width: 147.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Center(
                  //   child: Padding(
                  //     padding: EdgeInsets.all(16.0),
                  //     child: PinCodeTextField(
                  //       appContext: context,
                  //       length: 6,
                  //       controller: otpController,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           code = value;
                  //         });
                  //       },
                  //       pinTheme: PinTheme(
                  //         shape: PinCodeFieldShape.underline,
                  //         selectedFillColor: Colors.transparent,
                  //         inactiveFillColor: Colors.transparent,
                  //         activeFillColor: Colors.transparent,
                  //         activeColor: Colors.blue,
                  //         inactiveColor: Colors.grey,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // PinFieldAutoFill(
                  //   textInputAction: TextInputAction.done,
                  //   controller: auth.otpController,
                  //   decoration: UnderlineDecoration(
                  //     textStyle: const TextStyle(fontSize: 16, color: Colors.white),
                  //     colorBuilder: const FixedColorBuilder(Colors.transparent),
                  //     bgColorBuilder: FixedColorBuilder(const Color(0x0ff00000).withOpacity(.5)),
                  //   ),
                  //   currentCode: auth.messageOtpCode,
                  //   onCodeSubmitted: (code) {},
                  //   onCodeChanged: (code) {
                  //     setState(() {
                  //       auth.messageOtpCode = code!;
                  //     });
                  //   },
                  // ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomOTPTextFiledBox(
                        textEditingController: oneController,
                      ),
                      CustomOTPTextFiledBox(
                        textEditingController: twoController,
                      ),
                      CustomOTPTextFiledBox(
                        textEditingController: threeController,
                      ),
                      CustomOTPTextFiledBox(
                        textEditingController: fourController,
                      ),
                      CustomOTPTextFiledBox(
                        textEditingController: fiveController,
                      ),
                      CustomOTPTextFiledBox(
                        textEditingController: sixController,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    width: 237.w,
                    child: MaterialButton(
                        height: 40.h,
                        minWidth: double.infinity,
                        onPressed: () async {
                          final code = oneController.text +
                              twoController.text +
                              threeController.text +
                              fourController.text +
                              fiveController.text +
                              sixController.text;
                          final credential =
                              PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: code);
                          await signInWithPhoneAuthCredential(credential);
                          // .then((value) => Get.to(NavigationBarScreenBayer()));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.white,
                        child: Center(
                          child: Text(tr("Submit"),
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              )),
                        )),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        _verifyPhoneNumber();
                      },
                      child: Text(
                        tr("Send again?"),
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff2461D7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showLoading
        ? Center(
            child: const CircularProgressIndicator(
              color: Color(0xff054559),
            ),
          )
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
            ),
          );
  }

  Future<void> _verifyPhoneNumber() async {
    setState(() {
      showLoading = true;
    });
    if (countryCode == null) {
      code = "+92";
    } else {
      code = countryCode.toString();
    }
    phoneNumber = code! + phoneTextEditingController.text;
    print(phoneNumber);
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 59),
        verificationCompleted: (_) {
          setState(() {
            showLoading = false;
          });
          print(_.toString());
        },
        verificationFailed: (e) {
          setState(() {
            showLoading = false;
          });
          if (e.code == 'invalid-phone-number') {
            snackBarShow(context, tr("The Provided number is not valid"));
          } else {
            snackBarShow(context, tr("Something went wrong. Try again."));
          }
        },
        codeSent: (String verificationI, int? code) {
          setState(() {
            showLoading = false;
          });
          verificationId = verificationI;
          currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
          startCountDown();
        },
        codeAutoRetrievalTimeout: (e) {
          setState(() {
            showLoading = false;
          });
        });
  }

  Future<void> signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential = await _auth.signInWithCredential(phoneAuthCredential);
      await auth.login(phoneNumber!);
      setState(() {
        showLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  snackBarShow(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
