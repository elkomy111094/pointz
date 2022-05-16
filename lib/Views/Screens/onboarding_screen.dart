import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/helper/components.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import 'login_screen.dart';

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
    {
      "imgUrl": "assets/icons/onboarding1.svg",
      "desc":
          "مش لازم تستنى طول السنة لما الخصومات تبدأ زي كل الناس، نقاطي جابتلك الخصومات لحد عندك، لأن عندنا أكتر من 400+ شريك واكتر من ٣٠٠٠+ فرع"
    },
    {
      "imgUrl": "assets/icons/onboarding2.svg",
      "desc":
          "هتلاقي عروض و خصومات على كل ماركات و محلات الملابس و الالكترونيات بالإضافة لكل الكافيهات والمطاعم اللي بتحبها"
    },
    {
      "imgUrl": "assets/icons/onboarding3.svg",
      "desc":
          "بوينتز بيوفرلك عروض وخصومات في أفضل صالونات التجميل والمنتجعات والنشاطات الترفيهية ليك ولأطفالك"
    },
    {
      "imgUrl": "assets/icons/onboarding4.svg",
      "desc":
          "زور المحل أو الكافيه اللي عليه التخفيض ، صور ال QR كود اللي عند الكاشير ، استلم نقاطك ، احصل علي مكافآتك"
    },
  ];

  @override
  Widget build(BuildContext context) {
    // the same function of stateless widget
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
          SizedBox(
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
                                    text: onBoardingMovedItemsList[currentIndex]
                                        ["desc"],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Hacen",
                                        fontSize: 12.sp)),
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
          //Skip Button
          Positioned(
            top: 2.h,
            right: 2.h,
            child: TextButton(
              onPressed: () {
                pushToStack(context, Login());
              },
              child: Text(
                "تخطي",
                style: TextStyle(
                    color: Colors.black, fontFamily: "Hacen", fontSize: 12.sp),
              ),
            ),
          ),
          //Indicator And Bottom Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 30.h,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          height: 1.h,
                          width: currentIndex == 0 ? 8.w : 5.w,
                          decoration: BoxDecoration(
                            color: currentIndex == 0 ? kMainColor : Colors.grey,
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
                            color: currentIndex == 1 ? kMainColor : Colors.grey,
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
                            color: currentIndex == 2 ? kMainColor : Colors.grey,
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
                            color: currentIndex == 3 ? kMainColor : Colors.grey,
                            borderRadius: const BorderRadius.horizontal(
                                right: Radius.circular(50),
                                left: Radius.circular(50)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    currentIndex == 3
                        ? InkWell(
                            onTap: () {
                              pushToStack(context, Login());
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                    "assets/icons/onboardingbu${currentIndex + 1}.svg",
                                    width: 8.h,
                                    height: 8.h),
                                Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Hacen",
                                            fontSize: 10.sp),
                                        text: "أبداء"),
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
                              height: 8.h,
                              width: 8.h,
                              child: SvgPicture.asset(
                                  "assets/icons/onboardingbu${currentIndex + 1}.svg"),
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
