import 'package:dr_cars/res/routes/routes_name.dart';
import 'package:get/get.dart';

import '../../Views/Started/Started.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RoutesName.Started,
            page: () => Started(),
            transition: Transition.leftToRightWithFade,
            transitionDuration: Duration(milliseconds: 250))
      ];
}
