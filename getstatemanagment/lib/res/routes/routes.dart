import 'package:get/get.dart';
import 'package:getstatemanagment/res/routes/routes_name.dart';
import 'package:getstatemanagment/view/splash_screen.dart';

class ApppRoutes {
  static appRouts() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => const SplashScreen(),
            transition: Transition.leftToRight,
            transitionDuration: const Duration(microseconds: 250)),
      ];
}
