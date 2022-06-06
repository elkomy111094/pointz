import 'package:flutter/material.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CategoryItems extends StatelessWidget {
  void Function()? onTapItem;
  BuildContext? navBarContext;

  CategoryItems({required this.onTapItem, this.navBarContext});

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
              backgroundColor: kBackGroundColor,
              child: Icon(
                Icons.favorite_border_outlined,
                color: kMainColor,
              ),
            ),
            Text(
              "مطاعم",
              style: TextStyle(
                  color: Colors.black, fontSize: 10.sp, fontFamily: "Taga"),
            )
          ],
        ),
      ),
    );
  }
}
