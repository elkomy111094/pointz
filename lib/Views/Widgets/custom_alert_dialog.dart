import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CustomAlertDialog extends StatelessWidget {
  String cardImgUrl;

  Widget content;

  Widget? xRoute;

  void Function()? onTapXButton;

  CustomAlertDialog(
      {Key? key,
      required this.cardImgUrl,
      required this.content,
      this.xRoute,
      required this.onTapXButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: translator.isDirectionRTL(context)
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 80.w,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.h)),
                      child: content,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 16.h,
                    width: 16.h,
                    child: Card(
                      color: kMainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(300),
                          side:
                              const BorderSide(color: Colors.white, width: 5)),
                      child: Padding(
                        padding: EdgeInsets.all(3.h),
                        child: SvgPicture.asset(
                          cardImgUrl,
                          width: 5.h,
                          height: 5.h,
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          GestureDetector(
            onTap: onTapXButton,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.cancel_outlined,
                size: 30.sp,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
