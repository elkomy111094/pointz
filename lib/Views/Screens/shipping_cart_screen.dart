import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pointz/Views/Screens/payment_screen.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';

class ShippingCartScreen extends StatefulWidget {
  @override
  _ShippingCartScreenState createState() => _ShippingCartScreenState();
}

class _ShippingCartScreenState extends State<ShippingCartScreen> {
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
                                "سلة المشتريات",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: kMainColor,
                                    fontFamily: "Hacen",
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Center(
                      child: Container(
                        color: Colors.white,
                        width: 100.w,
                        child: Column(
                          children: [
                            Container(
                              height: 40.h,
                              child: ListView.separated(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Card(
                                        elevation: 10,
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(1.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 12.h,
                                                width: 10.h,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                    alignment: Alignment.center,
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        "assets/images/mac.jpg"),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1.h),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.w),
                                                child: Container(
                                                  height: 12.h,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      RichText(
                                                          text: TextSpan(
                                                              text:
                                                                  "دوبل ماك رويال",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      "Hacen",
                                                                  fontSize:
                                                                      12.sp))),
                                                      RichText(
                                                          text: TextSpan(
                                                              text:
                                                                  "قطع دجاج تقدم مع بطاطس",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontFamily:
                                                                      "Hacen",
                                                                  fontSize:
                                                                      10.sp))),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            height: 3.h,
                                                            width: 3.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  color:
                                                                      kMainColor,
                                                                  width: 1),
                                                            ),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {},
                                                              child: Center(
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(.5
                                                                              .h),
                                                                  child: Icon(
                                                                    FontAwesomeIcons
                                                                        .add,
                                                                    color:
                                                                        kMainColor,
                                                                    size: 10.sp,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          RichText(
                                                              text: TextSpan(
                                                                  text: "1",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          15.sp,
                                                                      fontFamily:
                                                                          "Hacen"))),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Container(
                                                            height: 3.h,
                                                            width: 3.h,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  color:
                                                                      kMainColor,
                                                                  width: 1),
                                                            ),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {},
                                                              child: Center(
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(.5
                                                                              .h),
                                                                  child: Icon(
                                                                    FontAwesomeIcons
                                                                        .minus,
                                                                    color:
                                                                        kMainColor,
                                                                    size: 10.sp,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: kMainColor
                                                        .withOpacity(.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.h)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(.5.h),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      RichText(
                                                          text: TextSpan(
                                                              text: "SR 5.5",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      kMainColor))),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, _) {
                                    return SizedBox(
                                      height: 1.h,
                                    );
                                  },
                                  itemCount: 5),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 3.w),
                                  child: Text(
                                    "إستلام الطلب",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: kMainColor,
                                        fontFamily: "Hacen",
                                        fontSize: 10.sp),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1.h),
                                color: kMainColor.withOpacity(.2),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30.w, vertical: 3.h),
                                child: SvgPicture.asset(
                                  "assets/icons/navbar_icons/home.svg",
                                  width: 5.h,
                                  height: 5.h,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 1.h),
                                  child: Text(
                                    "بالفرع",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: kMainColor,
                                        fontFamily: "Hacen",
                                        fontSize: 12.sp),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 3.w),
                          child: Text(
                            "ملخص الدفع",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: kMainColor,
                                fontFamily: "Hacen",
                                fontSize: 10.sp),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 3.w),
                            child: Text(
                              "قيمه الطلب",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hacen",
                                  fontSize: 10.sp),
                            ),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: " SR ",
                                style: TextStyle(
                                    color: kMainColor, fontSize: 10.sp)),
                            TextSpan(
                                text: " 55 ",
                                style: TextStyle(
                                    color: kMainColor,
                                    fontFamily: "Hacen",
                                    fontSize: 10.sp)),
                          ]))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 1.h, horizontal: 3.w),
                            child: Text(
                              "القيمه المضافه",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Hacen",
                                  fontSize: 10.sp),
                            ),
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: " SR ",
                                style: TextStyle(
                                    color: kMainColor, fontSize: 10.sp)),
                            TextSpan(
                                text: " 55 ",
                                style: TextStyle(
                                    color: kMainColor,
                                    fontFamily: "Hacen",
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
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 1.h, horizontal: 3.w),
                                child: Text(
                                  "الاجمالي",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Hacen",
                                      fontSize: 10.sp),
                                ),
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: " SR ",
                                    style: TextStyle(
                                        color: kMainColor, fontSize: 10.sp)),
                                TextSpan(
                                    text: " 55 ",
                                    style: TextStyle(
                                        color: kMainColor,
                                        fontFamily: "Hacen",
                                        fontSize: 10.sp)),
                              ]))
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomTextButton(
                        roundedBorder: 1.h,
                        buttonHorizontalPaddingval: 15.w,
                        buttonVerticalPaddingVal: 2.h,
                        buttonColor: kMainColor,
                        textColor: Colors.white,
                        textSize: 12.sp,
                        onPressed: () {
                          pushToStack(context, PaymentScreen());
                        },
                        text: "متابعه"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
