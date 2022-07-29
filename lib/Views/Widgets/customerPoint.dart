import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';

class CustomerPoint extends StatefulWidget {
  String logoImage;
  int pointsValue;
  String storeName;

  CustomerPoint(
      {required this.logoImage,
      required this.storeName,
      required this.pointsValue});

  @override
  State<CustomerPoint> createState() => _CustomerPointState();
}

class _CustomerPointState extends State<CustomerPoint> {
  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                  text: widget.pointsValue.toString(),
                                  style: TextStyle(
                                      color: kMainColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
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
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kMainColor, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2),
                              child: CircleAvatar(
                                backgroundColor: widget.logoImage == null
                                    ? kMainColor
                                    : Colors.white,
                                child: widget.logoImage == null
                                    ? Padding(
                                        padding: EdgeInsets.all(1.h),
                                        child: SvgPicture.asset(
                                            "assets/icons/store.svg",
                                            fit: BoxFit.contain,
                                            width: 4.h,
                                            height: 4.h,
                                            color: Colors.white),
                                      )
                                    : Center(
                                        child: Container(
                                          height: 4.5.h,
                                          width: 4.5.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(15.0),
                                                topRight:
                                                    Radius.circular(15.0)),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(2.h),
                                            child: Image.memory(
                                              convertBase64Url(
                                                  base64Url: widget.logoImage!),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Text(
                            widget.storeName,
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
  }
}
