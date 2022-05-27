import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

class OrderTracking extends StatefulWidget {
  const OrderTracking({Key? key}) : super(key: key);

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SvgPicture.asset("assets/icons/stepperbg.svg",
                width: double.infinity, height: double.infinity),
          ),
          Column(
            children: [
              SizedBox(
                height: 38.h,
                width: double.infinity,
              ),
              Text(
                "الغاء الطلب",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Hacen",
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 3.h),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.h),
                    topRight: Radius.circular(5.h),
                  ),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
