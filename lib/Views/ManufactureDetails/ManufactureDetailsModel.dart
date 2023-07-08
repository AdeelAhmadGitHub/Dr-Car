class ManufactureDetailsModel {
  final String leading;
  final String title;
  ManufactureDetailsModel({required this.leading, required this.title});

  static List<ManufactureDetailsModel> dummyData = [
    ManufactureDetailsModel(
      leading: 'Actual Price',
      title: '\$85,000,00  ',
    ),
    ManufactureDetailsModel(
      leading: 'Discounted Price',
      title: '\$68,000.00',
    ),
    ManufactureDetailsModel(
      leading: 'Engine Type',
      title: '4-Cyl, 1.8 Liter',
    ),
    ManufactureDetailsModel(
      leading: 'MPG',
      title: '26 City / 39 Hwy',
    ),
    ManufactureDetailsModel(
      leading: 'Exterior Color',
      title: 'Black',
    ),
    ManufactureDetailsModel(
      leading: 'Interior Color',
      title: 'Being',
    ),
    ManufactureDetailsModel(
      leading: 'Drivetrain',
      title: 'FWD',
    ),
    ManufactureDetailsModel(
      leading: 'Transmission',
      title: 'Auto, 6-Spd w/Sportmatic & \nActive ECO System',
    ),
    ManufactureDetailsModel(
      leading: 'Doors',
      title: '4',
    ),
    ManufactureDetailsModel(
      leading: 'seatinge',
      title: '5',
    ),
    ManufactureDetailsModel(
      leading: 'VIN',
      title: 'KNAFX4A69F5428013r',
    ),
    ManufactureDetailsModel(
      leading: 'Stock #',
      title: '2001159908',
    ),
  ];
}
