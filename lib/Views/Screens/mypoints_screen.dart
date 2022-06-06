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
            padding: EdgeInsets.only(top: 10.h, bottom: 2.h),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        width: 90.w,
                        height: 15.h,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 15.h,
                                width: 90.w,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.h)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                                        fontFamily: "Taga")),
                                              ])),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "نقطه",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12.sp,
                                                        fontFamily: "Taga")),
                                              ])),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        Row(
                                          children: [
                                            Container(
                                              height: 5.h,
                                              width: 5.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: kMainColor,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(2),
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
                                            Text(
                                              "ماكدونلدز",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: "Taga",
                                                color: kMainColor,
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                      ],
                                    ),
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
