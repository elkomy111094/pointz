import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/Views/Screens/registeration/phone_registeration_screen.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:pointz/Views/Widgets/square_text_field.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var checkBoxVal = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: 100.h,
            width: 100.w,
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
                          height: 50.h,
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
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Taga",
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
                                              color: Colors.black,
                                              fontSize: 12.sp,
                                              fontFamily: "Taga",
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
                                    height: 1.h,
                                  ),
                                  CustomTextButton(
                                      buttonColor: kMainColor,
                                      textColor: Colors.white,
                                      textSize: 13.sp,
                                      onPressed: () {},
                                      roundedBorder: 1.h,
                                      text: "دخول"),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Center(
                                    child: RichText(
                                      text: TextSpan(
                                          text: "أو",
                                          style: TextStyle(
                                            letterSpacing: 1.5,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            fontFamily: "Taga",
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        pushToStack(context,
                                            PhoneRegisterationScreen());
                                      },
                                      child: Container(
                                        height: 7.h,
                                        width: 75.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(1.h),
                                            border: Border.all(
                                                color: kMainColor, width: 1)),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                    text: "ليس لديك حساب ؟",
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontSize: 13.sp,
                                                      fontFamily: "Taga",
                                                    )),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  pushToStack(context,
                                                      PhoneRegisterationScreen());
                                                },
                                                child: RichText(
                                                  text: TextSpan(
                                                      text: "إنشاء حساب",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: "Taga",
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                            height: 8.h,
                            width: 60.w,
                            child: MaterialButton(
                              splashColor: kMainColor.withOpacity(.5),
                              onPressed: () {
                                print("x");
                              },
                              child: Center(
                                  child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                        text: "أستكشف بوينترز أولا",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Taga",
                                          fontSize: 13.sp,
                                        )),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  CircleAvatar(
                                    radius: 2.h,
                                    backgroundColor: kMainColor.withOpacity(.2),
                                    child: Padding(
                                      padding: EdgeInsets.all(1.2.h),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/left-arrow.png",
                                          color: kMainColor.withOpacity(.5),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                            )),
                        SizedBox(height: 5.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
