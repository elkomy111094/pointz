import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../helper/components.dart';

class OrderTracking extends StatefulWidget {
  const OrderTracking({Key? key}) : super(key: key);

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  int currentStep = 2;
  List<Map<String, String>> steppesDetails = [
    {"title": "تم قبول طلبك بنجاح", "desc": "لحظات ويتم البدء في تجهيز طلبك"},
    {"title": "جاري تجهيز طلبك الان", "desc": "لحظات ويتم البدء في تجهيز طلبك"},
    {"title": "طلبك جاهز الان", "desc": "من فضلك توجه الي الفرع لاستلام الطلب"}
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: currentStep == 2
            ? FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: kMainColor,
                elevation: 20,
                label: Text(
                  "تم إستلام طلبي",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Hacen",
                      fontSize: 10.sp),
                ),
              )
            : null,
        backgroundColor: kMainColor,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: SvgPicture.asset("assets/icons/stepperbg.svg",
                  width: double.infinity, height: double.infinity),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Align(
                alignment: Alignment.topRight,
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 14.h,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 20.h,
                                  width: 85.w,
                                  child: Card(
                                    elevation: 5,
                                  ),
                                  /*decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.h),
                                      color: Colors.grey.shade400,
                                      boxShadow: []),*/
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 12.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(1.h),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: Offset(0, 5),
                                        ),
                                      ]),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 3.w),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 6.h,
                                          height: 6.h,
                                          decoration: BoxDecoration(
                                              color: kMainColor.withOpacity(.3),
                                              shape: BoxShape.circle),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(top: .5.h),
                                              child: SvgPicture.asset(
                                                "assets/icons/indecator.svg",
                                                width: 5.h,
                                                height: 5.h,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Expanded(
                                          child: RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: steppesDetails[
                                                                  currentStep]
                                                              ["title"]
                                                          .toString() +
                                                      "\n",
                                                  style: TextStyle(
                                                    color: kMainColor,
                                                    fontFamily: "Hacen",
                                                    fontSize: 10.sp,
                                                  )),
                                              TextSpan(
                                                  text: steppesDetails[
                                                          currentStep]["desc"]
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontFamily: "Hacen",
                                                    fontSize: 10.sp,
                                                  )),
                                            ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Stepper(
                              controlsBuilder: (cotext, d) {
                                return SizedBox();
                              },
                              onStepCancel: () {},
                              currentStep: currentStep,
                              type: StepperType.vertical,
                              onStepTapped: (stepNo) {
                                setState(() {
                                  currentStep = stepNo;
                                });
                              },
                              steps: [
                                Step(
                                    title: Text(
                                        steppesDetails[0]["title"].toString(),
                                        style: TextStyle(
                                          color: currentStep >= 0
                                              ? kMainColor
                                              : Colors.grey,
                                          fontFamily: "Hacen",
                                          fontSize: 10.sp,
                                        )),
                                    content: Text(
                                        steppesDetails[0]["desc"].toString(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "Hacen",
                                          fontSize: 10.sp,
                                        ))),
                                Step(
                                    title: Text(
                                        steppesDetails[1]["title"].toString(),
                                        style: TextStyle(
                                          color: currentStep >= 1
                                              ? kMainColor
                                              : Colors.grey,
                                          fontFamily: "Hacen",
                                          fontSize: 10.sp,
                                        )),
                                    content: Text(
                                        steppesDetails[1]["desc"].toString(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "Hacen",
                                          fontSize: 10.sp,
                                        ))),
                                Step(
                                    title: Text(
                                        steppesDetails[2]["title"].toString(),
                                        style: TextStyle(
                                          color: currentStep == 2
                                              ? kMainColor
                                              : Colors.grey,
                                          fontFamily: "Hacen",
                                          fontSize: 10.sp,
                                        )),
                                    content: Text(
                                        steppesDetails[2]["desc"].toString(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "Hacen",
                                          fontSize: 10.sp,
                                        ))),
                              ]),
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
