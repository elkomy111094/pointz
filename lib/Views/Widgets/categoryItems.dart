import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:sizer/sizer.dart';

class CategoryItems extends StatelessWidget {
  void Function()? onTapItem;
  BuildContext? navBarContext;
  String? name;
  Color color;

  CategoryItems(
      {required this.name,
      required this.onTapItem,
      this.navBarContext,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapItem,
      child: Container(
        height: 10.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 3.h,
              backgroundColor: color,
              child: SvgPicture.asset(
                "assets/icons/navbar_icons/points.svg",
              ),
            ),
            Text(
              name ?? "NoName".tr(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
                fontFamily: "Taga",
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
