import 'package:test_project_one/app/modules/sigin_in/views/sigin_in_view.dart';
import 'package:test_project_one/app/modules/sigin_in/bindings/sigin_in_binding.dart';
import 'package:test_project_one/app/modules/home/views/home_view.dart';
import 'package:test_project_one/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
import 'package:test_project_one/splash_screen.dart';
part 'app_routes.dart';

class AppPages {
  
static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(), 
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SPLASH, 
      page:()=> SplashScreen(), 
    ),
    GetPage(
      name: Routes.SIGIN_IN, 
      page:()=> SiginInView(), 
      binding: SiginInBinding(),
    ),
  ];
}