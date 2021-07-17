import 'package:flutter/material.dart';

class TitleWidgets extends StatelessWidget {
  const TitleWidgets({
    Key? key,
    required this.title,
    required this.subtitle,
    this.fontSizeSubtitle = 18,
    this.spacer = 2,
    this.fontSizeTitle = 27,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final double spacer, fontSizeTitle, fontSizeSubtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: fontSizeTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: spacer,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey,
              fontSize: fontSizeSubtitle,
            ),
          ),
        ),
      ],
    );
  }
}
