import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_plain/src/screens/auth/signup_screen.dart';
import 'package:getx_plain/src/screens/main/book_car_screen.dart';
import 'package:getx_plain/src/screens/main/main_tab_screen.dart';

import 'src/screens/auth/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Plain',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 230),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
          name: MainTabScreen.routeName,
          page: () => MainTabScreen(),
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
        ),
        GetPage(
          name: SignUpScreen.routeName,
          page: () => SignUpScreen(),
        ),
        GetPage(
          name: BookCarScreen.routeName,
          page: () => BookCarScreen(),
        )
      ],
      initialRoute: LoginScreen.routeName,
    );
  }
}
