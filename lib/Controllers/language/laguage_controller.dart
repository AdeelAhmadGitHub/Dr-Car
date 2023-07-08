import 'package:get/get.dart';

class RadioController extends GetxController {
  RxInt selectedRadio = 0.obs;

  void setSelectedRadio(int value) {
    selectedRadio.value = value;
  }
}
