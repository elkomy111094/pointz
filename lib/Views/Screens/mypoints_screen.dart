import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../Widgets/simple_Header.dart';

class MyPointsScreen extends StatefulWidget {
  BuildContext? navBarScreenContext;

  MyPointsScreen({this.navBarScreenContext});

  @override
  _MyPointsScreenState createState() => _MyPointsScreenState();
}

class _MyPointsScreenState extends State<MyPointsScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SimpleHeader(
          headerTitle: 'نقاطي',
        ),
        Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        width: 90.w,
                        height: 20.h,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 15.h,
                                width: 80.w,
                                child: Card(
                                  elevation: 5,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/pointswithshadow.svg",
                                          width: 5.h,
                                          color: Colors.black,
                                          height: 5.h,
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: "100",
                                              style: TextStyle(
                                                  color: kMainColor,
                                                  fontSize: 20.sp,
                                                  fontFamily: "Hacen")),
                                        ])),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: "نقطه",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.sp,
                                                  fontFamily: "Hacen")),
                                        ])),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Row(
                                children: [
                                  Container(
                                    height: 10.h,
                                    width: 10.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black12,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: kBackGroundColor,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    "assets/images/mac.jpg"))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.h, horizontal: 11.h),
                                child: Text(
                                  "ماكدونلدز",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: "Hacen",
                                    color: kMainColor,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 2.h,
                      );
                    },
                    itemCount: 10),
              ),
            )),
      ],
    );
  }
}
