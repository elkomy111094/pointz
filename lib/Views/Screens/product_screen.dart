import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pointz/Views/Widgets/square_text_field.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../helper/components.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 40.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/burger.jpg"),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.h,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 5.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 5.h,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_outline,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 5.h,
                                      height: 5.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          pop(context);
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_rounded,
                                          color: Colors.black,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(7.h),
                                        topLeft: Radius.circular(7.h)),
                                    border: Border.all(
                                        color: Colors.white, width: 2.h),
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "assets/images/burger2.jpg")),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: "???????? ?????? ??????????",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Taga",
                                      fontSize: 12.sp))),
                          SizedBox(
                            height: 1.h,
                          ),
                          RichText(
                              text: TextSpan(
                                  text:
                                      "?????? ???????? ???????? ???? ?????????? ?????????? ?????????? ?????????? ?????????? ?????????? ?????????? ?????????? ?????????? ?????????? ??????????",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: "Taga",
                                      fontSize: 10.sp))),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(
                      height: 10.h,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 4.h,
                                  width: 4.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: kMainColor, width: 2),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.add,
                                        color: kMainColor,
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
                                            color: Colors.black,
                                            fontSize: 15.sp,
                                            fontFamily: "Taga"))),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Container(
                                  height: 4.h,
                                  width: 4.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: kMainColor, width: 2),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Center(
                                      child: Icon(
                                        FontAwesomeIcons.minus,
                                        color: kMainColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            RichText(
                                text: TextSpan(
                                    text: "SR 5.5",
                                    style: TextStyle(
                                      color: kMainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp,
                                    ))),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                      ),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "?????? ????????????????  ",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Taga",
                                fontSize: 10.sp,
                              )),
                          TextSpan(
                              text: "(??????????????)",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Taga",
                                fontSize: 10.sp,
                              ))
                        ]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: SquareTextField(
                        hintText: "???? ?????? ?????????????? ??????",
                        onChanged: (val) {},
                        onSubmit: (val) {},
                        preFixWidget: Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: SvgPicture.asset(
                            "assets/icons/message.svg",
                            width: 10,
                            height: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                      child: Container(
                        width: 70.w,
                        decoration: BoxDecoration(
                          color: kMainColor,
                          borderRadius: BorderRadius.circular(2.h),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: "?????? ????????",
                                      style: TextStyle(
                                          fontFamily: "Taga",
                                          fontSize: 12.sp))),
                              Row(
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text: "??????????????",
                                          style: TextStyle(
                                              fontFamily: "Taga",
                                              fontSize: 12.sp))),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white60,
                                        borderRadius:
                                            BorderRadius.circular(10.h)),
                                    child: Padding(
                                      padding: EdgeInsets.all(.5.h),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                                  text: "SR 5.5",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white))),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
