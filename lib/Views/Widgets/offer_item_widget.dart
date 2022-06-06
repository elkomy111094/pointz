import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pointz/Views/Screens/product_screen.dart';
import 'package:pointz/helper/components.dart';
import 'package:sizer/sizer.dart';

class OfferItemWidget extends StatelessWidget {
  BuildContext currentContext;

  Widget? tabNavigateToScreen;

  OfferItemWidget({required this.currentContext, this.tabNavigateToScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      child: InkWell(
        onTap: () {
          pushToStack(currentContext, tabNavigateToScreen ?? ProductScreen());
        },
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(bottom: 1.h),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Stack(
                children: [
                  Container(
                    height: 20.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/image.jpg"))),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 1.h, vertical: 1.h),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 2.5.h,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/images/image.jpg"),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "آزور مطعم إسباني",
                      style: TextStyle(fontSize: 10.sp, fontFamily: "Taga"),
                    ),
                    Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/navbar_icons/offers.svg",
                          width: 3.h,
                          height: 3.h,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "SR 70",
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 2.w, right: 5.w, left: 5.w),
                child: Text(
                  "أديداس تعتبر من أكبر الشركات عالمياً في تصنيع الأدوات الرياضية وتحديداً الأحذية ",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: "Taga",
                      color: Colors.grey.shade500),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
