import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/helper/components.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/colors.dart';
import '../registeration/phone_registeration_screen.dart';

class OnBoarding extends StatefulWidget {
  //write stf to Create fully stateful widget
  @override
  _OnBoardingState createState() =>
      _OnBoardingState(); //_OnBoardingState onCreateState =>_OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  // Index Of Shown Moved Item On Screen
  int currentIndex = 0;
  //List of All Moved Items In OnBoarding Screen each Block(Map) Consider One Moved Item
  List<Map<String, dynamic>> onBoardingMovedItemsList = [
    {"imgUrl": "assets/icons/onboarding1.svg", "desc": "onboardingdesc1".tr()},
    {"imgUrl": "assets/icons/onboarding2.svg", "desc": "onboardingdesc2".tr()},
    {"imgUrl": "assets/icons/onboarding3.svg", "desc": "onboardingdesc3".tr()},
    {"imgUrl": "assets/icons/onboarding4.svg", "desc": "onboardingdesc4".tr()},
  ];
  @override
  initState() {}

  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setEnabledSystemUIOverlays([]);*/
    // the same function of stateless widget

    return SafeArea(
      child: Scaffold(
          body: Stack(
        //this Stack For Containing PageView and above it the getStarted buttom
        children: <Widget>[
          //main background that has half of screen height
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 50.h,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: kMainColor.withOpacity(.05),
            ),
          ),
          //Moved Widget
          Directionality(
            textDirection: TextDirection.ltr,
            child: SizedBox(
              height: 75.h,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context,
                        index) //itemBuilder will call with all items with number of index times
                    {
                  return Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                  onBoardingMovedItemsList[currentIndex]
                                      ["imgUrl"],
                                  width: 50.w,
                                  height: 30.h,
                                ),
                                height: 30.h,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                width: 80.w,
                                height: 20.h,
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      text:
                                          onBoardingMovedItemsList[currentIndex]
                                              ["desc"],
                                      style: TextStyle(
                                          wordSpacing: 1,
                                          color: Colors.black,
                                          fontFamily: "Taga",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                itemCount: onBoardingMovedItemsList.length,
              ),
            ),
          ),
          //Skip Button
          Positioned(
            top: 2.h,
            right: 2.h,
            child: TextButton(
              onPressed: () {
                pushToStack(context, PhoneRegisterationScreen());
              },
              child: Text(
                "skip".tr(),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Taga",
                  fontSize: 13.sp, /*fontWeight: FontWeight.bold*/
                ),
              ),
            ),
          ),
          //Indicator And Bottom Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 25.h,
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 1.h,
                            width: currentIndex == 0 ? 8.w : 5.w,
                            decoration: BoxDecoration(
                              color:
                                  currentIndex == 0 ? kMainColor : Colors.grey,
                              borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(50),
                                  left: Radius.circular(50)),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 1.h,
                            width: currentIndex == 1 ? 8.w : 5.w,
                            decoration: BoxDecoration(
                              color:
                                  currentIndex == 1 ? kMainColor : Colors.grey,
                              borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(50),
                                  left: Radius.circular(50)),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 1.h,
                            width: currentIndex == 2 ? 8.w : 5.w,
                            decoration: BoxDecoration(
                              color:
                                  currentIndex == 2 ? kMainColor : Colors.grey,
                              borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(50),
                                  left: Radius.circular(50)),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 1.h,
                            width: currentIndex == 3 ? 8.w : 5.w,
                            decoration: BoxDecoration(
                              color:
                                  currentIndex == 3 ? kMainColor : Colors.grey,
                              borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(50),
                                  left: Radius.circular(50)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    currentIndex == 3
                        ? InkWell(
                            onTap: () {
                              pushToStack(context, PhoneRegisterationScreen());
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/onboardingbu${currentIndex + 1}.svg",
                                    width: 9.h,
                                    height: 9.h),
                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Taga",
                                            fontSize: 10.sp),
                                        text: "start".tr()),
                                  ),
                                )
                              ],
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                currentIndex++;
                              });
                            },
                            child: SizedBox(
                              height: 9.h,
                              width: 9.h,
                              child: Transform.rotate(
                                angle: 180 * pi / 180,
                                child: SvgPicture.asset(
                                    "assets/icons/onboardingbu${currentIndex + 1}.svg"),
                              ),
                            ),
                          ),
                  ],
                )),
          ),
        ],
      )),
    );
  }
}
