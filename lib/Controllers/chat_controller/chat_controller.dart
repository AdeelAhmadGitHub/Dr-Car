import 'dart:convert';
import 'package:dr_cars/Models/UserData.dart';
import 'package:dr_cars/Share%20Preferences/Share%20Preferences.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  String? usermsgId = "0";
  var loading = false.obs;
  var myName = "".obs;
  var userName = "".obs;
  var myId = "".obs;
  var userId = "".obs;
  var chatRoomId = "".obs;
  var chatRoomName = "".obs;
  var email = "".obs;
  var phone = "".obs;

  Future collectUserData() async {
    // final id = FirebaseAuth.instance.currentUser!.uid;
    String? data = UserPreferences.getUserData();
    UserData loginResponse = UserData.fromJson(jsonDecode(data!));

    //
    myId.value = 'u' + loginResponse.userId.toString();
    myName.value = loginResponse.firstName!;
    email.value = loginResponse.email!;
    phone.value = loginResponse.phone!;

    print('in collectUserData >> ${myName.value} '
        '${myId.value}'
        '${myName.value} '
        '${myName.value} ');
  }
}
