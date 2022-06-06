import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

class MoreItemCard extends StatelessWidget {
  final String title;
  final String iconUrl;
  void Function()? onTabButton;

  MoreItemCard(
      {required this.onTabButton, required this.title, required this.iconUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: 95.w,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.h)),
        elevation: 20,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 6.h,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: kMainColor.withOpacity(.2),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Center(
                        child: SvgPicture.asset(
                          iconUrl,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Taga",
                        fontSize: 12.sp),
                  ),
                ],
              ),
              InkWell(
                onTap: onTabButton,
                child: Container(
                  height: 5.h,
                  width: 5.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: kMainColor, width: 1)),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: kMainColor,
                    size: 10.sp,
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
