import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dr_cars/Controllers/chat_controller/chat_controller.dart';
import 'package:dr_cars/Models/UserData.dart';
import 'package:dr_cars/Share%20Preferences/Share%20Preferences.dart';
import 'package:dr_cars/Views/chatScreen/full_media_display.dart';
import 'package:dr_cars/Widgets/custom_text.dart';
import 'package:dr_cars/Widgets/message_field.dart';
import 'package:dr_cars/services/database.dart';
import 'package:dr_cars/services/firebase_messaging.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({
    Key? key,
    this.chatRoomId,
    this.driverPic,
    this.driverName,
    this.userName,
    this.driverPhone,
    this.driverId,
    this.userId,
  }) : super(key: key);
  static const String id = "ChattingScreen";

  final String? chatRoomId;
  final String? driverPic;
  final String? driverName, userName;
  final String? driverPhone;
  final String? driverId, userId;
  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  String? userMsgId;
  TextEditingController messageEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  Stream<QuerySnapshot>? chats;
  var chatController = Get.put(ChatController());
  FCM firebaseMessaging = FCM();

  @override
  initState() {
    // DatabaseMethods().getChats(widget.chatRoomId!).then((value) {
    //   setState(() {
    //     chats = value;
    //   });
    // });

    print('This is user id $userMsgId');
    String? data = UserPreferences.getUserData();
    if (data != null) {
      UserData userProfile = UserData.fromJson(jsonDecode(data));
      userMsgId = userProfile.userId.toString();
      getChat();
    } else {}

    super.initState();
  }

  @override
  dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomText(
            text: '${widget.driverName}',
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Color(0xff5D3EBF),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //
              // Uri uri = Uri.parse('tel: +923331751075');
              Uri uri = Uri.parse('tel: ${widget.driverPhone}');
              launchUrl(uri);
            },
            icon: const Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ChatScreenAppBar(),
            Expanded(
              child: newMethod(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0.h),
              child: Container(
                height: 60.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2.sp,
                      blurRadius: 20.sp,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // SizedBox(width: 10.w),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: const Color(0xffDADBD8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: CustomMessageField(
                            // height: 35.h,
                            // width: 205.w,
                            // borderRadius: 20,
                            // textFieldIcon: Image.asset(
                            //   "assets/icons/attach.png",
                            //   height: 15.h,
                            //   width: 15.w,
                            // ),
                            textFieldIcon: InkWell(
                              onTap: () {
                                showModalBottomSheet(context: context, builder: (builder) => myBottomSheet());
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(Icons.attach_file),
                              ),
                            ),
                            hintText: tr("Type Your Message"),
                            hintTextColor: Colors.black.withOpacity(0.6),
                            controller: messageEditingController,
                            onChanged: (v) {
                              scrollController.jumpTo(scrollController.position.maxScrollExtent);
                            },
                            onTap: () {
                              scrollController.jumpTo(scrollController.position.maxScrollExtent);
                            },
                          ),
                        ),
                      ),
                      // SizedBox(width: 10.w),
                      InkWell(
                        onTap: () {
                          sendMessage('text');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: tr("Send"),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            fontColor: const Color(0xff1D69A6),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  newMethod() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      scrollController.jumpTo(
        scrollController.position.maxScrollExtent,
      );
    });

    return StreamBuilder(
        stream: chats,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            // Future.delayed(const Duration(milliseconds: 500), () {
            //   scrollController
            //       .jumpTo(scrollController.position.maxScrollExtent);
            // });
            return ListView.builder(
              controller: scrollController,
              itemCount: snapshot.data!.docs.length, // messages.length,
              itemBuilder: (BuildContext context, index) {
                var doc = snapshot.data!.docs[index];
                // print('chatController.myId = ${chatController.myId.value}');

                // var msgTime =
                //     DateTime.fromMillisecondsSinceEpoch(doc.get('time') * 1000);
                // print('msgTime>>$msgTime');
                var sendBy = doc.get('sendBy').toString();
                // var myId = chatController.myId.value;
                // print('sendBy=$sendBy <>myId= $myId');
                // var timeFormat=msgTime.hour>=12
                // var time = DateFormat('hh:mm a').format(msgTime);
                var messageType = sendBy != userMsgId ? 'receiver' : 'sender';
                // if (sendBy != myId) {
                //   driverId = sendBy;
                // }
                // print('driverId= $driverId');

                // if (snapshot.data!.docs.length == index) {
                // scrollController
                //     .jumpTo(scrollController.position.maxScrollExtent);
                // }
                return SingleMessage(
                  driverPic: widget.driverPic!,
                  messageType: messageType,
                  doc: doc,
                );
              },
            );
          } else {
            return Container();
          }
        });
  }
  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }
  // var driverId = '';
  sendMessage(String? messageDataType) async {
    print('send message by message type $messageDataType');
    String? data = UserPreferences.getUserData();
    UserData loginResponse = UserData.fromJson(jsonDecode(data!));
    // final id = '${widget.userId}'; // 'u' + loginResponse.userId; // 13;
    // FirebaseAuth.instance.currentUser!.uid;
    print('${getChatRoomId(widget.userId.toString()??"0",widget.chatRoomId.toString()??"0")}');

    final doc = await FirebaseFirestore.instance.collection('chatRoom').doc('${widget.chatRoomId.toString()}').get();
    print('send message doc $doc');

    /// fcm token hide
   var fcmToken = doc.get('device_token');
    print(fcmToken);
    // print('send by fcmToken $fcmToken');

    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": userMsgId, //Constants.myName,
        "message": messageEditingController.text,
        // 'time': DateTime.now().millisecondsSinceEpoch,
        'time': FieldValue.serverTimestamp(),
        "messageDataType": messageDataType,
      };
      DatabaseMethods().addMessage(widget.chatRoomId!, chatMessageMap);
      // fcmToken =
      //     'fTboR0spSX6FclUOunjSb4:APA91bEsbPzXvC1jJvlxXYFb9LI34oqLIYXmOgHPiPLTwQ3DtA2wUyASw0DjxoilSU7YUcbo9hJi3oF8zFCZYE0JawGYhzFQ1spxecAVFrzsbNn1zzCENXjo5_f0PfjkEFbqLipkLTD7';
      // fcmToken ='e7tYftHqSWu34-9NWP2uN6:APA91bFDvDNnS-P5WPUxliBttgRgr4egGduDXqnaHROblMx4t4-wqo7tSGQLWLsTUALBLW6I8BrTNIUClVbHx4zIXzcIluoDD7v0QxQH7khS5Gem4eeKnSg9sk47dORwaO9LYydgACpK';
      // print('fcmToken >>> $fcmToken');
      /// fcm token hide
      firebaseMessaging.sendNotificationFCM(
        fcmToken,
        "${widget.userName}", // 'Text Message',
        messageEditingController.text,
        1,
      );
      messageEditingController.text = "";
      setState(() {});
    }
  }

  getChat() {
    DatabaseMethods().getChats(widget.chatRoomId!).then((value) {
      setState(() {
        chats = value;
      });
    });
  }

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  bool? _loading = false;

  // takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.pickImage(source: source);
  //   _imageFile = File(pickedFile!.path);
  //   setState(() {});
  // }
  takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 300,
      imageQuality: 90,
    );
    setState(() {
      _imageFile = File(pickedFile!.path);
    });
    Navigator.pop(context);

    final ref = FirebaseStorage.instance.ref().child('images').child(DateTime.now().toString() + '.jpg');
    await ref.putFile(_imageFile!);
    final url = await ref.getDownloadURL();
    messageEditingController.text = url;
    // setState(() {});
    await sendMessage('image');
    print('send message');
    // messageEditingController.clear();
  }

  uploadFile() async {
    print('uploadFile start ');
    final ref = FirebaseStorage.instance.ref().child('images').child(DateTime.now().toString() + '.jpg');
    await ref.putFile(_imageFile!);
    final url = await ref.getDownloadURL();
    messageEditingController.text = url;
    // setState(() {});
    await sendMessage('image');
    print('send message');
    // messageEditingController.clear();
    // setState(() {});
  }

  Widget myBottomSheet() {
    return Container(
      height: 100.h,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            tr('Select Media'),
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      await takePhoto(ImageSource.camera);
                      if (mounted) Navigator.pop(context);
                      await uploadFile();
                    },
                    icon: const Icon(Icons.camera_alt),
                  ),
                  Text(
                    tr('Camera'),
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      await takePhoto(ImageSource.gallery);
                      // if (mounted)
                      // Navigator.pop(context);
                      // await uploadFile();
                    },
                    icon: const Icon(Icons.image),
                  ),
                  Text(
                    tr('Gallery'),
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class SingleMessage extends StatelessWidget {
  const SingleMessage({
    Key? key,
    required this.driverPic,
    required this.messageType,
    required this.doc,
  }) : super(key: key);

  final String driverPic;
  final String messageType;
  final QueryDocumentSnapshot<Object?> doc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.h),
      child: Align(
        alignment: messageType != 'receiver' ? Alignment.topRight : Alignment.topLeft,
        child: Column(
          crossAxisAlignment: messageType != 'receiver' ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: messageType != 'receiver' ? MainAxisAlignment.end : MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                messageType == 'receiver'
                    ? CircleAvatar(
                        backgroundImage: NetworkImage('${driverPic}'),
                        radius: 20.sp,
                      )
                    : const SizedBox(height: 0, width: 0),
                const SizedBox(width: 10),
                doc.get('messageDataType') == 'text'
                    ? Container(
                        // height: 40.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                          color:
                              messageType != "receiver" ? const Color(0xffD9D9D9) : const Color(0xff1D69A6),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: CustomText(
                            text: doc.get('message'),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            fontColor:
                                messageType != "receiver" ? Colors.black.withOpacity(0.6) : Colors.white,
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullMediaDisplay(
                                imageUrl: doc.get('message'),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 200,
                          height: 320,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage(doc.get('message')),
                              fit: BoxFit.cover,
                            ),
                          ),
                          // child: Image.network(doc.get('message')),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
