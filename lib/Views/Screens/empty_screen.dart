import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class EmptyScreen extends StatelessWidget {
  String? textUnderImage;
  String? svgImageUrl;

  EmptyScreen({this.textUnderImage = "", this.svgImageUrl = ""});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FittedBox(
            child: SvgPicture.asset(
              svgImageUrl!,
            ),
          ),
          Text(
            textUnderImage!,
            style: TextStyle(
                color: kMainColor,
                fontWeight: FontWeight.bold,
                fontFamily: "Taga",
                fontSize: 15.sp),
          ),
        ],
      ),
    );
  }
}
