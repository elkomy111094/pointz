import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/Views/Widgets/more_item_card.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../helper/components.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 25.h,
                  color: kMainColor.withOpacity(.05),
                ),
                Padding(
                  padding: EdgeInsets.all(2.h),
                  child: GestureDetector(
                    onTap: () {
                      pop(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Icon(
                          Icons.arrow_back,
                          color: kMainColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                        ),
                        Text(
                          "الملف الشخصي",
                          style: TextStyle(
                              color: kMainColor,
                              fontFamily: "Taga",
                              fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          height: 25.h,
                          width: 80.w,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.h),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Container(
                                        width: 14.h,
                                        height: 14.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: kMainColor, width: 2),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: kBackGroundColor,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      "assets/images/eslam.jpg")),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: kMainColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(1.h),
                                          child: SvgPicture.asset(
                                            "assets/icons/camera.svg",
                                            width: 3.h,
                                            height: 3.h,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    "إسلام الكومي",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp,
                                      fontFamily: "Taga",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          height: 12.h,
                          width: 95.w,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.h)),
                            elevation: 20,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 6.h,
                                        height: 6.h,
                                        decoration: BoxDecoration(
                                          color: kMainColor.withOpacity(.2),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(1.5.h),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              "assets/icons/phone-call.svg",
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "01153942488",
                                        style: TextStyle(
                                            color: Colors.black,
                                            letterSpacing: 1,
                                            fontFamily: "Taga",
                                            fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ),
                        MoreItemCard(
                            onTabButton: () {},
                            title: "elkomy.dev@gmail.com",
                            iconUrl: "assets/icons/message-cover.svg"),
                        MoreItemCard(
                            onTabButton: () {},
                            title: " 1994 / 10 / 11 ",
                            iconUrl: "assets/icons/birthday.svg"),
                        MoreItemCard(
                            onTabButton: () {},
                            title: "ذكر",
                            iconUrl: "assets/icons/male.svg"),
                        SizedBox(
                          height: 3.h,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/signout.svg",
                                width: 5.h,
                                height: 5.h,
                                color: kMainColor,
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(
                                "تسجيل الخروج",
                                style: TextStyle(
                                    color: kMainColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Taga",
                                    fontSize: 12.sp),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
