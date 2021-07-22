import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_plain/src/extensions/image_widgets.dart';
import 'package:get/get.dart';
import 'package:getx_plain/src/extensions/open_dialog.dart';
import 'package:getx_plain/src/screens/auth/signup_screen.dart';
import 'package:getx_plain/src/screens/main/main_tab_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/Login_Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            height: 300,
          ),
          SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _Header(),
                    _LoginForm(),
                    _Signup(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Signup extends StatelessWidget {
  const _Signup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(bottom: 17),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This Button", style: TextStyle(fontSize: 17)),
            TextButton(
                onPressed: () => Get.toNamed(SignUpScreen.routeName),
                child: Text(
                  "Sign Up for Free",
                  style: TextStyle(fontSize: 17),
                ))
          ],
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 27,
        vertical: 20,
      ),
      margin: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Email",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF707070),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF707070),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Password",
            style: TextStyle(color: Color(0xFF707070), fontSize: 18),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF707070),
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF707070),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: Text("Forgot your Password"),
              onPressed: () {
                // OpenDialog.info(
                //   title: "Sample",
                //   content: "Sample",
                //   lottieFile: 'thinking',
                //   onClick: () {},
                // );

                OpenDialog.confitm(
                  title: "Samole",
                  content: "Smaple",
                  lottieFile: 'thinking',
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () => Get.toNamed(MainTabScreen.routeName),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF0377dd),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 22,
          ),
          ImagesCarousel(
            heightImages: 200,
            images: [
              "assets/images/welcome/off_road.png",
              "assets/images/welcome/by_my_car.png",
              "assets/images/welcome/city_driver.png",
            ],
          ),
          SizedBox(
            height: 13,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Travel",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
