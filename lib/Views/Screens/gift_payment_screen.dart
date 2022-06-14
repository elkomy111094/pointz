import 'package:flutter/material.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';
import '../Widgets/square_text_field.dart';

class GiftPaymentScreen extends StatefulWidget {
  const GiftPaymentScreen({Key? key}) : super(key: key);

  @override
  State<GiftPaymentScreen> createState() => _GiftPaymentScreenState();
}

class _GiftPaymentScreenState extends State<GiftPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: kBackGroundColor,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 60.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.h),
                            topLeft: Radius.circular(10.h))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 5.w),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.h),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.w),
                              child: Column(
                                children: [
                                  Container(
                                    height: 12.h,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text: "رقم البطاقه",
                                                        style: TextStyle(
                                                          letterSpacing: 0,
                                                          color: Colors.black,
                                                          fontSize: 10.sp,
                                                          fontFamily: "Taga",
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: .5.h,
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                                child: SquareTextField(
                                                  hintText: "",
                                                  onChanged: (phone) {},
                                                  onSave: (phone) {},
                                                  keyBoardType: TextInputType
                                                      .emailAddress,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 12.h,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(
                                                        text: "تاريخ الانتهاء",
                                                        style: TextStyle(
                                                          letterSpacing: 0,
                                                          color: Colors.black,
                                                          fontSize: 10.sp,
                                                          fontFamily: "Taga",
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: .5.h,
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                                child: SquareTextField(
                                                  hintText: "",
                                                  onChanged: (phone) {},
                                                  onSave: (phone) {},
                                                  keyBoardType:
                                                      TextInputType.name,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text: "رقم ال",
                                                          style: TextStyle(
                                                            letterSpacing: 0,
                                                            color: Colors.black,
                                                            fontSize: 10.sp,
                                                            fontFamily: "Taga",
                                                          )),
                                                      TextSpan(
                                                          text: " CCV ",
                                                          style: TextStyle(
                                                            letterSpacing: 0,
                                                            color: Colors.black,
                                                            fontSize: 10.sp,
                                                          ))
                                                    ]),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: .5.h,
                                              ),
                                              SizedBox(
                                                height: 8.h,
                                                child: SquareTextField(
                                                  hintText: "",
                                                  onChanged: (phone) {},
                                                  onSave: (phone) {},
                                                  keyBoardType:
                                                      TextInputType.name,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CustomTextButton(
                            buttonColor: Colors.transparent,
                            textColor: Colors.grey,
                            roundedBorder: 1.h,
                            buttonHorizontalPaddingval: 7.w,
                            buttonVerticalPaddingVal: 0,
                            textSize: 12.sp,
                            borderColor: Colors.grey,
                            onPressed: () {},
                            text: "دفع"),
                        SizedBox(
                          height: .5.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 4.w),
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
              ],
            ),
          )),
    );
  }
}
