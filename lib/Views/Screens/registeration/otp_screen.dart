import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../Widgets/otp_verfication.dart';

class OTPScreen extends StatelessWidget {
  final String phoneNumber;

  OTPScreen({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: 30.h,
              width: 100.w,
              child: Center(
                child: SvgPicture.asset("assets/icons/pincode.svg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 5.h, left: 5.w, right: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "كود التحقق" + " \n\n ",
                                      style: TextStyle(
                                          color: kMainColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Taga",
                                          fontSize: 13.sp)),
                                  TextSpan(
                                      text: "تم أرسال كود التفعيل الي رقم" +
                                          " \n\n ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Taga",
                                          fontSize: 12.sp)),
                                  TextSpan(
                                      text: phoneNumber,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Taga",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.sp)),
                                ])),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Container(
                      height: 40.h,
                      width: 90.w,
                      child: PinCodeVerificationScreen(phoneNumber),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
