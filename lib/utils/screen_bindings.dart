import 'package:get/get.dart';
import 'package:movie_app/controller/movie_description_screen_controller.dart';
import 'package:movie_app/controller/movie_screen_controller.dart';

class ScreenBindings extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(()=>MovieScreenController());
  Get.lazyPut(()=>MovieDescriptionScreenController());
   /* Get.lazyPut(()=>RegistrationScreenController());*/
  }


}