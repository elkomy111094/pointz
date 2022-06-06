import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class NotificationItem extends StatefulWidget {
  const NotificationItem({Key? key}) : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: 95.w,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.h)),
        elevation: 20,
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
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Center(
                        child: SvgPicture.asset(
                          "assets/icons/notification.svg",
                          color: kMainColor,
                        ),
                      ),
                    ),
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
                        Text(
                          "11/5/2022",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Taga",
                              fontSize: 12.sp),
                        ),
                        SizedBox(height: .1.h),
                        SizedBox(
                          width: 65.w,
                          child: Text(
                            "تم قبول طلبك بنجاح لحظات وسيتم البدء في تجيز طلبك ،يمكنك تتبع طلبك من خلال التطلبيق",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
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
