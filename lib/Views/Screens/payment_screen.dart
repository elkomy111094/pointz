import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pointz/Views/Screens/oreder_tracking.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';
import '../Widgets/customt_text_button.dart';
import '../Widgets/square_text_field.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: 14.h,
                color: kMainColor.withOpacity(.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pop(context);
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: kMainColor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  "???????? ????????",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontFamily: "Taga",
                                      fontSize: 15.sp),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1.h),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5.w),
                            child: Column(
                              children: [
                                Container(
                                  height: 12.h,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                      text: "?????? ??????????????",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10.sp,
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
                                                keyBoardType:
                                                    TextInputType.emailAddress,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 12.h,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                      text: "?????????? ????????????????",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10.sp,
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
                                                keyBoardType:
                                                    TextInputType.name,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                RichText(
                                                  text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "?????? ????",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10.sp,
                                                          fontFamily: "Taga",
                                                        )),
                                                    TextSpan(
                                                        text: " CCV ",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10.sp,
                                                        ))
                                                  ]),
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
                                                keyBoardType:
                                                    TextInputType.name,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            FlutterSwitch(
                                              width: 20.w,
                                              height: 4.h,
                                              valueFontSize: 10.sp,
                                              inactiveText: "Off",
                                              activeText: "On",
                                              activeTextColor: Colors.white,
                                              activeColor: kMainColor,
                                              inactiveColor: Colors.grey,
                                              value: status,
                                              borderRadius: 30.0,
                                              padding: 10.0,
                                              showOnOff: true,
                                              onToggle: (val) {
                                                setState(() {
                                                  status = val;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Expanded(
                                        child: Text(
                                      "?????? ???????????? ??????????????",
                                      style: TextStyle(
                                          color: kMainColor,
                                          fontFamily: "Taga"),
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 3.w),
                                    child: Text(
                                      "???????? ??????????",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          color: kMainColor,
                                          fontFamily: "Taga",
                                          fontSize: 10.sp),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h, horizontal: 3.w),
                                      child: Text(
                                        "???????? ??????????",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Taga",
                                            fontSize: 10.sp),
                                      ),
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: " SR ",
                                          style: TextStyle(
                                              color: kMainColor,
                                              fontSize: 10.sp)),
                                      TextSpan(
                                          text: " 55 ",
                                          style: TextStyle(
                                              color: kMainColor,
                                              fontFamily: "Taga",
                                              fontSize: 10.sp)),
                                    ]))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h, horizontal: 3.w),
                                      child: Text(
                                        "???????????? ??????????????",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Taga",
                                            fontSize: 10.sp),
                                      ),
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: " SR ",
                                          style: TextStyle(
                                              color: kMainColor,
                                              fontSize: 10.sp)),
                                      TextSpan(
                                          text: " 55 ",
                                          style: TextStyle(
                                              color: kMainColor,
                                              fontFamily: "Taga",
                                              fontSize: 10.sp)),
                                    ]))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: kBackGroundColor,
                                      borderRadius: BorderRadius.circular(5.h)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.h, horizontal: 3.w),
                                          child: Text(
                                            "????????????????",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Taga",
                                                fontSize: 10.sp),
                                          ),
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: " SR ",
                                              style: TextStyle(
                                                  color: kMainColor,
                                                  fontSize: 10.sp)),
                                          TextSpan(
                                              text: " 55 ",
                                              style: TextStyle(
                                                  color: kMainColor,
                                                  fontFamily: "Taga",
                                                  fontSize: 10.sp)),
                                        ]))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        CustomTextButton(
                            roundedBorder: 1.h,
                            buttonHorizontalPaddingval: 15.w,
                            buttonVerticalPaddingVal: 2.h,
                            buttonColor: kMainColor,
                            textColor: Colors.white,
                            textSize: 12.sp,
                            onPressed: () {
                              pushToStack(context, OrderTracking());
                            },
                            text: "?????????? ??????????"),
                      ],
                    ),
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
