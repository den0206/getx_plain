import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_plain/src/constants/colors.dart';
import 'package:getx_plain/src/extensions/image_widgets.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const routeName = '/SignUp';

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
                    _SignUpForm(),
                    _Login(),
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

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(
        bottom: 17,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already Have Account",
              style: TextStyle(fontSize: 17),
            ),
            TextButton(
              onPressed: () => Get.back(),
              child: Text(
                "Log in",
                style: TextStyle(fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SignUpForm extends StatelessWidget {
  const _SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 27,
        vertical: 20,
      ),
      margin: EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
            style: TextStyle(color: kAuthColor, fontSize: 18),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter your name",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kAuthColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kAuthColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Email",
            style: TextStyle(color: kAuthColor, fontSize: 18),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter your Email",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kAuthColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kAuthColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Password",
            style: TextStyle(color: kAuthColor, fontSize: 18),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter your Password",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kAuthColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kAuthColor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Confirm Password",
            style: TextStyle(color: kAuthColor, fontSize: 18),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter your Password",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kAuthColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: kAuthColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 23),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "privacy policy",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: Container(
                padding: EdgeInsets.all(10),
                height: 60,
                decoration: BoxDecoration(
                  color: Color(0xFF0377dd),
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Sign Up",
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
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios,
                        ),
                      ),
                    ),
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
              "assets/images/welcome/fast_car.png",
              "assets/images/welcome/vehicle_sale.png",
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
                    "Sign Up",
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
          SizedBox(
            height: 13,
          ),
        ],
      ),
    );
  }
}
