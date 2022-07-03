import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../Widgets/simple_Header.dart';

class OrdersScreen extends StatefulWidget {
  BuildContext? navBarScreenContext;

  OrdersScreen({this.navBarScreenContext});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool detailsButtonPress = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            SimpleHeader(
              headerTitle: 'طلباتي',
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "طلبي الحالي",
                                style: TextStyle(
                                  color: kMainColor,
                                  fontFamily: "Taga",
                                  fontSize: 12.sp,
                                )),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: kMainColor,
                              borderRadius: BorderRadius.circular(5.h),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.h, vertical: .5.h),
                              child: Text(
                                "1",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "Taga"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        width: 95.w,
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.h),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 8.h,
                                      height: 8.h,
                                      decoration: BoxDecoration(
                                        color: kBackGroundColor,
                                        image: DecorationImage(
                                          fit: BoxFit.contain,
                                          image: AssetImage(
                                              "assets/images/mac.jpg"),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(2.h),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                text: "ماكدونلدز",
                                                style: TextStyle(
                                                    color: kMainColor,
                                                    fontFamily: "Taga",
                                                    fontSize: 12.sp)),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/money.svg",
                                                color: kMainColor,
                                                width: 5.w,
                                                height: 4.w,
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "  SR  ",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10.sp)),
                                                TextSpan(
                                                    text: "17",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10.sp)),
                                              ]))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: "456789",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp)),
                                          TextSpan(
                                              text: "  #  ",
                                              style: TextStyle(
                                                  color: kMainColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12.sp)),
                                        ]))
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 2.h,
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "دوبل ماك رويال" + "\n",
                                      style: TextStyle(
                                          height: .2.h,
                                          color: Colors.black,
                                          fontFamily: "Taga",
                                          fontSize: 11.sp)),
                                  TextSpan(
                                      text:
                                          "قطع دجاج تقدم مع بطاطس ، 1 كولوسلو ، 3 خبز",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "Taga",
                                          fontSize: 10.sp)),
                                ])),
                                SizedBox(
                                  height: 3.h,
                                ),
                                CustomTextButton(
                                  buttonColor: kBackGroundColor,
                                  textColor: kMainColor,
                                  buttonHorizontalPaddingval: 3.w,
                                  textSize: 12.sp,
                                  onPressed: () {},
                                  text: "تتبع الطلب",
                                  roundedBorder: 1.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "طلباتي السابقه",
                                style: TextStyle(
                                  color: kMainColor,
                                  fontFamily: "Taga",
                                  fontSize: 12.sp,
                                )),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: kMainColor,
                              borderRadius: BorderRadius.circular(5.h),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 3.h, vertical: .5.h),
                              child: Text(
                                "5",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: "Taga"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        height: 40.h,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.h),
                                    border: Border.all(color: kBackGroundColor),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(1.h),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 6.h,
                                              height: 6.h,
                                              decoration: BoxDecoration(
                                                color: kBackGroundColor,
                                                image: DecorationImage(
                                                  fit: BoxFit.contain,
                                                  image: AssetImage(
                                                      "assets/images/mac.jpg"),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(2.h),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 2.h,
                                                    ),
                                                    Container(
                                                      width: 28.w,
                                                      child: RichText(
                                                        text: TextSpan(
                                                            text: "ماكدونلدز",
                                                            style: TextStyle(
                                                                color:
                                                                    kMainColor,
                                                                fontFamily:
                                                                    "Taga",
                                                                fontSize:
                                                                    12.sp)),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    Container(
                                                      height: 4.h,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SvgPicture.asset(
                                                            "assets/icons/money.svg",
                                                            color: kMainColor,
                                                            width: 5.w,
                                                            height: 4.w,
                                                          ),
                                                          SizedBox(
                                                            width: 1.w,
                                                          ),
                                                          RichText(
                                                              text: TextSpan(
                                                                  children: [
                                                                TextSpan(
                                                                    text:
                                                                        "  SR  ",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            10.sp)),
                                                                TextSpan(
                                                                    text: "17",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            10.sp)),
                                                              ]))
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    Container(
                                                      height: 4.h,
                                                      width: 4.h,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(1.h),
                                                        color: kBackGroundColor,
                                                      ),
                                                      child: Center(
                                                        child: IconButton(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    0),
                                                            visualDensity:
                                                                VisualDensity(
                                                                    vertical: 0,
                                                                    horizontal:
                                                                        0),
                                                            onPressed: () {
                                                              setState(() {
                                                                detailsButtonPress =
                                                                    !detailsButtonPress;
                                                              });
                                                            },
                                                            icon: Icon(
                                                              detailsButtonPress
                                                                  ? Icons
                                                                      .keyboard_arrow_down
                                                                  : Icons
                                                                      .arrow_forward_ios,
                                                              color: kMainColor,
                                                              size: 12.sp,
                                                            )),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Container(
                                                  width: 64.w,
                                                  height: detailsButtonPress
                                                      ? 30.h
                                                      : 3.h,
                                                  child: RichText(
                                                      overflow:
                                                          detailsButtonPress
                                                              ? TextOverflow
                                                                  .visible
                                                              : TextOverflow
                                                                  .ellipsis,
                                                      text: TextSpan(
                                                          text:
                                                              "قطع دجاج تقدم مع بطاطس ، 1 كولوسلو ، 3 خبزقطع دجاج تقدم مع بطاطس ، 1 كولوسلو ، 3 خبزقطع دجاج تقدم مع بطاطس ، 1 كولوسلو ، 3 خبزقطع دجاج تقدم مع بطاطس ، 1 كولوسلو ، 3 خبز",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Taga",
                                                              color: Colors
                                                                  .black))),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1.h, horizontal: 2.w),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    "assets/icons/calender.svg",
                                                    width: 3.h,
                                                    height: 3.h,
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  Text(
                                                    "11/10/1994",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily: "Taga",
                                                        fontSize: 10.sp),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    "assets/icons/delivered.svg",
                                                    width: 3.h,
                                                    height: 3.h,
                                                  ),
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  Text(
                                                    "تم استلام الطلب بنجاح",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily: "Taga",
                                                        fontSize: 10.sp),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 1.h,
                                );
                              },
                              itemCount: 5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
