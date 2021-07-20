import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_plain/src/extensions/avatar_widget.dart';
import 'package:getx_plain/src/screens/profile/profile_controller.dart';
import 'package:line_icons/line_icons.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            height: 100,
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _header(),
                    _buildbody(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[300],
                          padding: EdgeInsets.symmetric(vertical: 12),
                          elevation: 0.2,
                          textStyle: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        icon: Icon(
                          LineIcons.alternateSignOut,
                          size: 27,
                        ),
                        label: Text("Sign out"),
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

  Column _buildbody() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            children: [
              builditem(
                icon: LineIcons.envelope,
                name: "Email",
                data: controller.user.email,
              ),
              Divider(),
              builditem(
                icon: LineIcons.phone,
                name: "Phone",
                data: controller.user.phone,
              ),
              Divider(),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          margin: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            children: [
              builditem(icon: LineIcons.gifts, name: "Invite Friends"),
              Divider(),
              builditem(
                icon: LineIcons.cog,
                name: "Settings",
              )
            ],
          ),
        )
      ],
    );
  }

  Container _header() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            AvatarWidget(
              photoUrl: controller.user.imageUrl,
              memberShip: "member",
              progress: 50,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.7),
                      child: Text(
                        controller.user.fullname,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 5,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            LineIcons.wallet,
                            size: 22,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 2,
                                ),
                                child: Text(
                                  "IDR",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Text(
                                controller.user.phone,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border.all(color: Colors.grey[300]!, width: 1),
                ),
                child: Icon(
                  LineIcons.userEdit,
                  color: Colors.black,
                  size: 29,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget builditem({
    required IconData icon,
    required String name,
    String? data,
    Function()? onPressed,
  }) {
    return InkWell(
      onTap: data != null ? null : onPressed,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              icon,
              size: 29,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: data == null ? 20 : 18,
                        fontWeight: FontWeight.w500),
                  ),
                  data == null
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            data,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                ],
              ),
            ),
          ),
          data != null
              ? Container()
              : Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.black45,
                  ),
                )
        ],
      ),
    );
  }
}
