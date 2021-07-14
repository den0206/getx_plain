import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_plain/screens/sample_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX Plain',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleScreen(),
    );
  }
}
