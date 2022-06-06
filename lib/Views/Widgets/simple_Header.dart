import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class SimpleHeader extends StatelessWidget {
  final String headerTitle;
  const SimpleHeader({
    required this.headerTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      color: kMainColor.withOpacity(.05),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Text(
                    headerTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kMainColor, fontFamily: "Taga", fontSize: 15.sp),
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
