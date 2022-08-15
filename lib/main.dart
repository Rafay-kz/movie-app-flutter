import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/utils/screen_bindings.dart';
import 'package:movie_app/view/movie_description_screen.dart';
import 'package:movie_app/view/movie_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LoginScreen(),

      initialRoute: "/",
   getPages: [
        GetPage(name: "/", page:()=> MovieScreen(),binding: ScreenBindings()),
     GetPage(name: "/DescriptionScreen", page:()=> MovieDescriptionScreen(),binding: ScreenBindings()),
      ],
      initialBinding: ScreenBindings(),
    );
  }
}




