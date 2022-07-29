import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';

class SimpleHeader extends StatelessWidget {
  bool? showPopIconButton;
  String headerTitle;
  SimpleHeader({required this.headerTitle, this.showPopIconButton = true});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: getDirection(context),
      child: Container(
        height: 9.h,
        color: kMainColor.withOpacity(.05),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        headerTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: kMainColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Taga",
                            fontSize: 15.sp),
                      ),
                    ),
                  ),
                ],
              ),
              showPopIconButton!
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: GestureDetector(
                        onTap: () {
                          pop(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(.5.h),
                            child: Icon(
                              Icons.arrow_back,
                              color: kMainColor,
                              size: 15.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
