import 'package:easy_localization/easy_localization.dart';

class ImageModel {
  final String image;
  ImageModel({required this.image});

  static List<ImageModel> dummyData = [
    ImageModel(image: "assets/Images/kiv.png"),
    ImageModel(image: "assets/Images/bmw.png"),
    ImageModel(image: "assets/Images/honda.png"),
    ImageModel(image: "assets/Images/nishan.png"),
  ];
}

class Listing {
  String text;
  Listing({required this.text});
}

List<Listing> listing = [
  Listing(text: tr("Active Listing")),
  Listing(text: tr("Previous Listing")),
];
// final ImageModel image1 = ImageModel('assets/Icons/kiv.png');
// final ImageModel image2 = ImageModel('assets/Icons/bmw.png');
// final ImageModel image3 = ImageModel('assets/Icons/honda.png');
// final ImageModel image4 = ImageModel('assets/Icons/nishan.png');
// // final images = [
//   ImageModel(images: 'assets/Icons/icon.png'),
//   ImageModel(imagePath: 'assets/Images/bmw.png'),
//   ImageModel(imagePath: 'assets/Images/honda.png'),
//   ImageModel(imagePath: 'assets/Images/nishan.png'),
// ];
