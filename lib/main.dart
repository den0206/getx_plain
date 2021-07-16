import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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
          name: LoginScreen.routeName,
          page: () => LoginScreen(),
        )
      ],
      initialRoute: LoginScreen.routeName,
    );
  }
}
