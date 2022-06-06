import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class GiftsSentCard extends StatelessWidget {
  const GiftsSentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 85.w,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.h)),
        child: Padding(
          padding: EdgeInsets.all(1.h),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 8.h,
                    height: 10.h,
                    decoration: BoxDecoration(
                      color: kMainColor.withOpacity(.2),
                      borderRadius: BorderRadius.circular(1.h),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/giftmessage.svg",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 10.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Text(
                                "هديه مني لك لشراء ماتبغاه",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                    fontFamily: "Taga",
                                    fontSize: 10.sp),
                              )),
                              Container(
                                height: 4.h,
                                decoration: BoxDecoration(
                                  color: kMainColor,
                                  borderRadius: BorderRadius.circular(2.h),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Center(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/icons/gifts.svg",
                                          color: kBackGroundColor,
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                          "SR 300",
                                          style: TextStyle(
                                              color: kBackGroundColor,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "طلال السحيمي",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                    fontFamily: "Taga",
                                    fontSize: 10.sp),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "+966549327651",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.black,
                                    fontFamily: "Taga",
                                    fontSize: 10.sp),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4.h,
                        height: 4.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kMainColor, width: 2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kBackGroundColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/images/mac.jpg")),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text("ماكدونلدز",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Taga",
                              fontSize: 10.sp)),
                    ],
                  ),
                  Text("1994 / 10 / 11",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Taga",
                          fontSize: 10.sp))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
