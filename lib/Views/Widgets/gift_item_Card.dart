import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

class GiftItemCard extends StatelessWidget {
  const GiftItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      child: Card(
        elevation: 5,
        color: kBackGroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.h),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: 35.h,
                  height: 18.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(2.h),
                        topLeft: Radius.circular(2.h)),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/giftsCardbg.svg",
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: " SR " + " 70 " + "\n\n",
                              style: TextStyle(
                                  color: kMainColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp)),
                          TextSpan(
                              text: "هديه مني لك لشراء ماتبغاه",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Taga",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.sp)),
                        ])),
                    SizedBox(
                      height: 1.5.h,
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("طلال السحيمي",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Taga",
                              fontSize: 10.sp)),
                      Text("966549327651+",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Taga",
                              fontSize: 10.sp))
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 6.h,
                            height: 6.h,
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
                                      image:
                                          AssetImage("assets/images/mac.jpg")),
                                ),
                              ),
                            ),
                          ),
                          Text("ماكدونالدز",
                              style: TextStyle(
                                  color: kMainColor,
                                  fontFamily: "Taga",
                                  fontSize: 12.sp))
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
          ],
        ),
      ),
    );
  }
}
