class ManufactureModel {
  final String backgroundImage;
  final String title;
  final String logo;
  ManufactureModel(
      {required this.backgroundImage, required this.title, required this.logo});

  static List<ManufactureModel> dummyData = [
    ManufactureModel(
        backgroundImage: "assets/Images/BMW3.png",
        title: 'BMV',
        logo: 'assets/Images/BmwLogo.png'),
    ManufactureModel(
        backgroundImage: "assets/Images/Ford.png",
        title: 'Ford',
        logo: 'assets/Images/FordLogo.png'),
    ManufactureModel(
        backgroundImage: "assets/Images/General Motors.png",
        title: 'General Motors',
        logo: 'assets/Images/GeneralMotorsLogo.png'),
    ManufactureModel(
        backgroundImage: "assets/Images/Honda.png",
        title: 'Honda',
        logo: 'assets/Images/HondaLogo.png'),
    ManufactureModel(
        backgroundImage: "assets/Images/KIA.png",
        title: 'KIA',
        logo: 'assets/Images/KIALogo.png'),
    ManufactureModel(
        backgroundImage: "assets/Images/Nissan.png",
        title: 'Nissan',
        logo: 'assets/Images/NissanLogo.png'),
    ManufactureModel(
        backgroundImage: "assets/Images/KIA.png",
        title: 'KIA',
        logo: 'assets/Images/KIALogo.png'),
    ManufactureModel(
        backgroundImage: "assets/Images/Nissan.png",
        title: 'Nissan',
        logo: 'assets/Images/NissanLogo.png'),
  ];
}
