import 'package:dr_cars/Controllers/auth_Controller.dart';
import 'package:dr_cars/Share%20Preferences/Share%20Preferences.dart';
import 'package:dr_cars/res/getx_loclization/languages.dart';
import 'package:dr_cars/res/routes/routes.dart';
import 'package:dr_cars/services/firebase_messaging.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Controllers/updateLocationControler.dart';
import 'Views/FilterAndSort/FilterAndSort.dart';
import 'Views/Home/Home.dart';
import 'Views/ManufactureDetails/ManufactureDetails.dart';
import 'Views/Messange/Messange.dart';
import 'Views/Search/Search.dart';
import 'Views/Sign in/Sign in.dart';
import 'Views/Started/Started.dart';
import 'Views/log_out/log_out_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await UserPreferences.init();
  runApp(EasyLocalization(
    path: 'assets/translations',
    saveLocale: true,
    supportedLocales: [Locale('en'), Locale('es')],
    startLocale: const Locale('en'),
    fallbackLocale: Locale('es'),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authController = Get.put(AuthController());
  UpdateLocationController updateLocationController = UpdateLocationController();
  FCM firebaseMessaging = FCM();
  @override
  void initState() {
    // TODO: implement initState
    firebaseMessaging.setNotifications(context);
    updateLocationController.getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),

            localizationsDelegates: context.localizationDelegates,
            // supportedLocales: context.supportedLocales,
            locale: context.locale,
            fallbackLocale: Locale('es', 'ES'),
            //translations: Languages(),
            getPages: AppRoutes.appRoutes(),
            home: FutureBuilder(
              future: authController.checkUserLoggedIn(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return snapshot.data;
              },
              initialData: const Started(),
            ),
            supportedLocales: [
              Locale("af"),
              Locale("do"),
              Locale("am"),
              Locale("ar"),
              Locale("az"),
              Locale("be"),
              Locale("bg"),
              Locale("bn"),
              Locale("bs"),
              Locale("ca"),
              Locale("cs"),
              Locale("da"),
              Locale("de"),
              Locale("el"),
              Locale("en"),
              Locale("es"),
              Locale("et"),
              Locale("fa"),
              Locale("fi"),
              Locale("fr"),
              Locale("gl"),
              Locale("ha"),
              Locale("he"),
              Locale("hi"),
              Locale("hr"),
              Locale("hu"),
              Locale("hy"),
              Locale("id"),
              Locale("is"),
              Locale("it"),
              Locale("ja"),
              Locale("ka"),
              Locale("kk"),
              Locale("km"),
              Locale("ko"),
              Locale("ku"),
              Locale("ky"),
              Locale("lt"),
              Locale("lv"),
              Locale("mk"),
              Locale("ml"),
              Locale("mn"),
              Locale("ms"),
              Locale("nb"),
              Locale("nl"),
              Locale("nn"),
              Locale("no"),
              Locale("pl"),
              Locale("ps"),
              Locale("pt"),
              Locale("ro"),
              Locale("ru"),
              Locale("sd"),
              Locale("sk"),
              Locale("sl"),
              Locale("so"),
              Locale("sq"),
              Locale("sr"),
              Locale("sv"),
              Locale("ta"),
              Locale("tg"),
              Locale("th"),
              Locale("tk"),
              Locale("tr"),
              Locale("tt"),
              Locale("uk"),
              Locale("ug"),
              Locale("ur"),
              Locale("uz"),
              Locale("vi"),
              Locale("zh")
            ],
            // localizationsDelegates: [
            //   CountryLocalizations.delegate,
            //   // GlobalMaterialLocalizations.delegate,
            //   // GlobalWidgetsLocalizations.delegate,
            // ],
          );
        });
  }
}
