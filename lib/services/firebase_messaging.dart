import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as meth;
import 'dart:typed_data';
// import 'package:azer/fcm_model.dart';
import 'package:dr_cars/services/fcm_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Controllers/auth_Controller.dart';
class FCM {
  final authController=Get.put(AuthController());
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final streamCtrl = StreamController<String>.broadcast();
  // static SharedPreference sharedPreference = SharedPreference();
  // final NavigationService _navigationService = locator<NavigationService>();
  //
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings("@mipmap/ic_launcher");
  late DarwinInitializationSettings iosInitializationSettings;
  late InitializationSettings initializationSettings;

  void initializing() async {
    await FirebaseMessaging.instance
        .setAutoInitEnabled(true); // later added for manifest.xml permission
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    )
        .catchError((onError) {
      print("this is firebase error::: ${onError.toString()}");
    });

    androidInitializationSettings =
        const AndroidInitializationSettings("@mipmap/ic_launcher");
    iosInitializationSettings = const DarwinInitializationSettings();
    initializationSettings = InitializationSettings(
        iOS: iosInitializationSettings, android: androidInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        // onSelectNotification: onSelectNotification
    );
  }

  static void _showNotifications(
      String body,
      String title,
      String channelDescription,
      String ticker,
      bool wakeUpScreen,
      bool autoCancel,
      String category) async {
    // var value = await sharedPreference.readString("notification");
    // if(value == "yes"){
    await notification(body, title, channelDescription, ticker, wakeUpScreen,
        autoCancel, category);
    // }
  }

  static Future<void> notification(
      String body,
      String title,
      String channelDescription,
      String ticker,
      bool wakeUpScreen,
      bool autoCancel,
      String category) async {
    var vibrationPattern = Int64List(8);

    vibrationPattern[0] = 0;
    vibrationPattern[1] = 250;
    vibrationPattern[2] = 500;
    vibrationPattern[3] = 250;
    vibrationPattern[4] = 500;
    vibrationPattern[5] = 250;
    vibrationPattern[4] = 500;
    vibrationPattern[5] = 250;
    vibrationPattern[6] = 0;

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
            meth.Random().nextInt(1000).toString(), title,
            priority: Priority.high,
            largeIcon:
                const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
            vibrationPattern: vibrationPattern,
            channelDescription: channelDescription,
            fullScreenIntent: wakeUpScreen,
            // category: category,
            autoCancel: autoCancel,
            importance: Importance.high,
            channelShowBadge: true,
            styleInformation:
                BigTextStyleInformation(body, htmlFormatSummaryText: true),
            ticker: ticker);

    DarwinInitializationSettings iosNotificationDetails =
        const DarwinInitializationSettings();

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        // iOS: iosNotificationDetails
    );

    await flutterLocalNotificationsPlugin.show(
        meth.Random().nextInt(1000), title, body, notificationDetails);
  }

  Future<void> ios_permission() async {
    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted = await androidImplementation?.requestPermission();
    }
    _firebaseMessaging.requestPermission(sound: true, badge: true, alert: true);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage messages) async {
    print("background notification recieved");
    Map<String, dynamic> message = messages.data;
    if (message["type"] == "1") {
      if (Platform.isAndroid) {
        _showNotifications(message["body"], message["title"], 'message_channel',
            'message', false, false, 'CATEGORY_MESSAGE');
      } else {
        _showNotifications(
            messages.notification!.body!,
            messages.notification!.title!,
            'message_channel',
            'message',
            false,
            false,
            'CATEGORY_MESSAGE');
      }
    }
  }

  void firebaseCloudMessagingListeners(BuildContext context) {
    if (Platform.isIOS) ios_permission();
    print('listening firebase');
    Future.delayed(const Duration(milliseconds: 500), () {
      FirebaseMessaging.onMessage.listen((RemoteMessage messages) {
        print('A new onMessage event was published! ${messages.data["body"]}');
        if (Platform.isAndroid) {
          Map<String, dynamic> message = messages.data;
          _showNotifications(message["body"]??"Congratulations! Your listing Approved Successfully", message["title"]??"Listing Approved",
              'message_channel', 'message', false, false, 'CATEGORY_MESSAGE');
        } else {
          _showNotifications(
              messages.notification!.body!,
              messages.notification!.title!,
              'message_channel',
              'message',
              false,
              false,
              'CATEGORY_MESSAGE');
        }
        // if (messages.data["type"] == "1") {
        //   if (Platform.isAndroid) {
        //     Map<String, dynamic> message = messages.data;
        //     _showNotifications(message["body"], message["title"],
        //         'message_channel', 'message', false, false, 'CATEGORY_MESSAGE');
        //   } else {
        //     _showNotifications(
        //         messages.notification!.body!,
        //         messages.notification!.title!,
        //         'message_channel',
        //         'message',
        //         false,
        //         false,
        //         'CATEGORY_MESSAGE');
        //   }
        // }
      });

      FirebaseMessaging.onBackgroundMessage(
          _firebaseMessagingBackgroundHandler);
    });
  }

  void onDidReceiveLocalNotification(int id, String title, String body,
      String payload, BuildContext context) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              // Navigator.of(context, rootNavigator: true).pop();
              // await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => SecondScreen(payload),
              //   ),
              // );
            },
          )
        ],
      ),
    );
  }

  setNotifications(BuildContext context) {
    initializing();
    firebaseCloudMessagingListeners(context);
    _firebaseMessaging.getToken().then((token) {
      authController.deviceToken = token;
      saveStringValue("fcm_token", token!);
      debugPrint('device token_id:_______________$token _______________');
    });
  }

  saveStringValue(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  Future sendNotificationFCM(String token, String title, String body, int type,
      {String uid = 'uid',
      String myuid = 'myuid',
      String clientuid = 'clientuid',
      String name = 'name'}) async {
    Data data = Data(
        id: uid,
        status: "done",
        title: title,
        body: body,
        type: type.toString(),
        uid: uid,
        myuid: myuid,
        clientuid: clientuid,
        name: name);
    Notifications notification =
        Notifications(title: title, body: body, sound: "default");
    Android android = Android(
        ttl: "86400s",
        notification: NotificationA(clickAction: "OPEN_ACTIVITY_1"));
    Apns apns = Apns(
        headers: Headers(apnsPriority: "5"),
        payload: Payload(
            aps: Aps(category: "NEW_MESSAGE_CATEGORY", sound: "default")));
    FCMModel fcmModel = FCMModel(
        clickAction: "FLUTTER_NOTIFICATION_CLICK",
        priority: "high",
        data: data,
        to: token,
        notification: notification,
        android: android,
        apns: apns);
    print("im in fcm $body");
    print(jsonEncode(fcmModel));
    final response = await http
        .post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
        'Bearer AAAACOqoHOQ:APA91bE8gYuoTExWwKOi_uAp0Lvy3kM1AZIckPG-4PPgmRE1NjlQ7EOTBMi0qfh_Z-_uyIbRgV-uCeMCxFhrmxfX3UInVKudBUPQG1wH9SwRbfE3n_SXqMNwr9KDY_LGquhOz_4Hy2Pn',
      },
      body: jsonEncode(fcmModel),
    )
        .catchError((error, stackTrace) {
      log(error);
    });
    log(response.body);
    debugPrint(response.statusCode.toString());
  }

  onSelectNotification(String? payload) {
    print("notification done");
//    _navigationService.navigateTo(FaqPage.route());
  }
}
