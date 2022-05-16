import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/Views/Screens/registeration/location_registeration_screen.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:pointz/Views/Widgets/square_text_field.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:sizer/sizer.dart';

class CompleteRegisterationData extends StatefulWidget {
  @override
  State<CompleteRegisterationData> createState() =>
      _CompleteRegisterationDataState();
}

class _CompleteRegisterationDataState extends State<CompleteRegisterationData> {
  var checkBoxVal = false;
  String groupValue = "call";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: 100.h,
            width: 100.w,
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: kBackGroundColor,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    child: SvgPicture.asset("assets/icons/login.svg",
                        fit: BoxFit.contain),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 65.h,
                    width: 90.w,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 65.h,
                            width: 90.w,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.h)),
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Center(
                                      child: RichText(
                                        text: TextSpan(
                                            text:
                                                "من فضلك أكمل تسجيل بياناتك للمتابعه",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: "Hacen",
                                                fontSize: 12.sp,
                                                wordSpacing: 1.2)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
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
                                                          text: "الاسم الاول",
                                                          style: TextStyle(
                                                            letterSpacing: 1.5,
                                                            color: kMainColor,
                                                            fontSize: 10.sp,
                                                            fontFamily: "Hacen",
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
                                                      text: TextSpan(
                                                          text: "الاسم الاخير",
                                                          style: TextStyle(
                                                            letterSpacing: 1.5,
                                                            color: kMainColor,
                                                            fontSize: 10.sp,
                                                            fontFamily: "Hacen",
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
                                        ],
                                      ),
                                    ),
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
                                                          text:
                                                              "البريد الالكتروني",
                                                          style: TextStyle(
                                                            letterSpacing: 1.5,
                                                            color: kMainColor,
                                                            fontSize: 10.sp,
                                                            fontFamily: "Hacen",
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
                                                          text: "تاريخ الميلاد",
                                                          style: TextStyle(
                                                            letterSpacing: 1.5,
                                                            color: kMainColor,
                                                            fontSize: 10.sp,
                                                            fontFamily: "Hacen",
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
                                                        TextInputType.datetime,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 6.h,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          RichText(
                                              text: TextSpan(
                                                  text: "النوع",
                                                  style: TextStyle(
                                                      fontFamily: "Hacen",
                                                      fontSize: 12.sp,
                                                      color: Colors.black))),
                                          Container(
                                            width: 30.w,
                                            child: Theme(
                                              data: Theme.of(context).copyWith(
                                                  unselectedWidgetColor:
                                                      kMainColor,
                                                  disabledColor: Colors.blue),
                                              child: RadioListTile(
                                                  value: "call",
                                                  groupValue: groupValue,
                                                  activeColor: kMainColor,
                                                  title: Text(
                                                    "ذكر",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: "Hacen",
                                                        fontSize: 12.sp),
                                                  ),
                                                  onChanged: (val) {
                                                    setState(() {
                                                      groupValue = "call";
                                                    });
                                                  }),
                                            ),
                                          ),
                                          Container(
                                            width: 30.w,
                                            child: Theme(
                                              data: Theme.of(context).copyWith(
                                                  unselectedWidgetColor:
                                                      kMainColor,
                                                  disabledColor: Colors.blue),
                                              child: RadioListTile(
                                                  value: "email",
                                                  activeColor: kMainColor,
                                                  title: Text(
                                                    "أنثي",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: "Hacen",
                                                        fontSize: 10.sp),
                                                  ),
                                                  groupValue: groupValue,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      groupValue = "email";
                                                    });
                                                  }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    CustomTextButton(
                                        buttonColor: kMainColor,
                                        textColor: Colors.white,
                                        textSize: 12.sp,
                                        buttonVerticalPaddingVal: 0,
                                        onPressed: () {
                                          pushToStack(context,
                                              LocationRegisterationScreen());
                                        },
                                        roundedBorder: 1.h,
                                        text: "تسجيل"),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                        ],
                      ),
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
