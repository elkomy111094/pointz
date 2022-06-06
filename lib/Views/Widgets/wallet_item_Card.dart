import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class WalletItemCard extends StatefulWidget {
  const WalletItemCard({Key? key}) : super(key: key);

  @override
  State<WalletItemCard> createState() => _WalletItemCardState();
}

class _WalletItemCardState extends State<WalletItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: 85.w,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.h)),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 7.h,
                    height: 8.h,
                    decoration: BoxDecoration(
                        color: kMainColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(1.h),
                        image: DecorationImage(
                            image: AssetImage("assets/images/mac.jpg"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 60.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "ماكدونلدز",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Taga",
                                    fontSize: 12.sp),
                              ),
                              RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                  text: "SR  ",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 12.sp),
                                ),
                                TextSpan(
                                  text: "20 +",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 12.sp),
                                ),
                              ]))
                            ],
                          ),
                        ),
                        SizedBox(height: .1.h),
                        SizedBox(
                          width: 60.w,
                          child: Text(
                            "2022 / 5 / 13",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Taga",
                                fontSize: 10.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
