import 'package:companycam/Pages/Onboarding-Screen/onboarding.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:flutter/material.dart';

import 'Theme/Theme-Constant/theme-constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Company Cam',
      //theme: lightTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(
        navigateRoute: Onboarding(),
        duration: 3000,
        imageSize: 100,
        imageSrc: "images/camera.png",
        text: "Customer App",
        textType: TextType.ColorizeAnimationText,
        textStyle: const TextStyle(
          fontSize: 20.0,
        ),
        colors: const [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
        backgroundColor: Colors.white,
      ),
    );
  }
}
