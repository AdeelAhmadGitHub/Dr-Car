import 'dart:convert';

import 'package:dr_cars/Controllers/chat_controller/chat_controller.dart';
import 'package:dr_cars/Controllers/home_controller.dart';
import 'package:dr_cars/Models/UserData.dart';
import 'package:dr_cars/Views/chatScreen/chat_screen.dart';
import 'package:dr_cars/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatRoomLauncher {
// Chat Utils
  HomeController? homeController;
  DatabaseMethods databaseMethods = DatabaseMethods();
  var chatController = Get.put(ChatController());
  Future<UserData> getUserData(context, coreProvider) async {
    coreProvider = coreProvider; // context.read<CoreProvider>();
    SharedPreferences sp = await SharedPreferences.getInstance();
    var data = sp.getString('userData');
    UserData loginResponse = UserData.fromJson(jsonDecode(data.toString()));
    return loginResponse;
  }

  sendMessage(context, coreProvider, String? posteID, String? postedNAME, String? postedProfilePIC,
      String? postedPHONE, String? deviceToken) async {
    UserData loginResponse = await getUserData(context, coreProvider);
    var userId = '${loginResponse.userId.toString()}';
    // var offer = coreProvider!
    //     .myQuotations!
    //     .quotations![coreProvider!.currentQuotationIndex!]
    //     .offers![coreProvider!.currentDriverOfferIndex!]; // '24';
    // int? currentQuoteIndex = coreProvider!.currentQuotationIndex!;
    // int? currentOfferIndex = coreProvider!.currentDriverOfferIndex!;
    // var quote = coreProvider!.myQuotations!.quotations![currentQuoteIndex];
    //NearByListing? offer;4

    String? postedId = posteID!;
    String? postedName = postedNAME;
    String? postedProfilePIc = postedProfilePIC;
    String? postedPhone = postedPHONE;
    // postedId = loginResponse.userId.toString();
    //postedName = loginResponse.firstName;
    postedProfilePIc = loginResponse.profilePic;
    postedPhone = loginResponse.phone;
    //
    print("name...........${postedName}");
    print("Post id...........${postedId}");
    print("user id...........${postedId}");

    List<String> users = [userId, postedId];

    String chatRoomId = getChatRoomId(userId, postedId);
    // 'Enter Driver here'; // 'Abbas';
    var userName = '${loginResponse.firstName}';
    String chatRoomName = getChatRoomId(postedName!, userName);

    Map<String, dynamic> chatRoom = {
      "roomName": "$chatRoomName",
      "users": users,
      "chatRoomId": chatRoomId,
      "driverPic": postedProfilePIc,
      "userPic": '${loginResponse.profilePic}',
      "driverPhone": postedPhone,
      "userPhone": '${loginResponse.phone}',
      "userId": '$userId',
      "driverId": '$postedId',
      "device_token": '$deviceToken',
    };

    databaseMethods.addChatRoom(chatRoom, chatRoomId);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChattingScreen(
          chatRoomId: chatRoomId,
          driverName: postedName, // '${userName.replaceAll(myName, "")}',
          driverPic: postedProfilePIc,
          driverPhone: postedPhone,
          driverId: '$postedId',
          userId: ('$userId'),
          userName: '$userName', // doc.get('driverPic').toString(),
        ),
      ),
    );
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }
}
