import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:pointz/Views/Widgets/square_text_field.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:sizer/sizer.dart';

import '../login_screen.dart';
import 'otp_screen.dart';

class PhoneRegisterationScreen extends StatefulWidget {
  @override
  State<PhoneRegisterationScreen> createState() =>
      _PhoneRegisterationScreenState();
}

class _PhoneRegisterationScreenState extends State<PhoneRegisterationScreen> {
  var checkBoxVal = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                color: kBackGroundColor,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  child: SvgPicture.asset("assets/icons/login.svg",
                      fit: BoxFit.contain),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 65.h,
                  width: 90.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 45.h,
                        width: 90.w,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.h)),
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 3.h,
                                ),
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                        text: "تسجيل الدخول",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Hacen",
                                          fontSize: 15.sp,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_enabled,
                                      color: kMainColor,
                                      size: 15.sp,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          text: "رقم الهاتف",
                                          style: TextStyle(
                                            letterSpacing: 1.5,
                                            color: kMainColor,
                                            fontSize: 10.sp,
                                            fontFamily: "Hacen",
                                          )),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                SizedBox(
                                  height: 8.h,
                                  child: SquareTextField(
                                    hintText: "",
                                    onChanged: (phone) {},
                                    onSave: (phone) {},
                                    keyBoardType: TextInputType.phone,
                                  ),
                                ),
                                SizedBox(
                                  height: .5.h,
                                ),
                                SizedBox(
                                  height: 5.h,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Transform.scale(
                                          scale: 1.1,
                                          child: Checkbox(
                                              activeColor: kMainColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          .5.h)),
                                              value: checkBoxVal,
                                              onChanged: (val) {
                                                setState(() {
                                                  checkBoxVal = !checkBoxVal;
                                                });
                                              }),
                                        ),
                                        RichText(
                                          text: const TextSpan(
                                              text:
                                                  "الموافقه علي الشروط والاحكام",
                                              style: TextStyle(
                                                color: Colors.black38,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontFamily: "Hacen",
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                CustomTextButton(
                                    buttonColor: kMainColor,
                                    textColor: Colors.white,
                                    textSize: 12.sp,
                                    onPressed: () {
                                      pushToStack(
                                          context,
                                          OTPScreen(
                                            phoneNumber: "01128756021",
                                          ));
                                    },
                                    roundedBorder: 1.h,
                                    text: "تسجيل")
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                        child: Container(
                          height: 7.h,
                          width: 75.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1.h),
                              border: Border.all(color: kMainColor, width: 1)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: "لديك حساب بالفعل ؟",
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: 12.sp,
                                        fontFamily: "Hacen",
                                      )),
                                ),
                                TextButton(
                                  onPressed: () {
                                    pushToStack(context, Login());
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                        text: "تسجيل الدخول",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Hacen",
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
