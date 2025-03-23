import 'package:flutter/material.dart';
import 'package:kitobix/utils/size/screen_size.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.img,
  });

  final String title;
  final String img;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(height: height * 220 / figmaHeight),
        Image.asset(
          img,
          height: height * 260 / figmaHeight,
          width: height * 260 / figmaHeight,
        ),
        SizedBox(height: height / 15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 40 / figmaWidth),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: width / 13,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}
