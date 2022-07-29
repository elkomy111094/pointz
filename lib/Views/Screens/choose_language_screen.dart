import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/Views/Screens/onboarding/onboarding_screen.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';
import '../Widgets/simple_Header.dart';

class ChooseLanguageScreen extends StatefulWidget {
  @override
  _ChooseLanguageScreenState createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  String selectedLang = translator.activeLanguageCode;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: getDirection(context),
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  left: 0,
                  top: 0,
                  child: SimpleHeader(
                    headerTitle: "language".tr(),
                  ),
                ),
                /*Padding(
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
                ),*/
                Positioned(
                  right: 0,
                  left: 0,
                  top: 20.h,
                  bottom: 0,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(3.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 1.h,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Wrap(
                            runSpacing: 3.h,
                            children: translator.locals().map((i) {
                              return GestureDetector(
                                onTap: () {
                                  translator
                                      .setNewLanguage(
                                    context,
                                    newLanguage: i.languageCode,
                                    remember: true,
                                    restart: false,
                                  )
                                      .then((value) {
                                    pushToStack(context, OnBoarding());
                                  });
                                  setState(() {
                                    selectedLang = i.languageCode;
                                  });
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.h),
                                      side: BorderSide(
                                        color: kMainColor,
                                        width: 2,
                                      )),
                                  elevation: 10,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 10.w),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 10.h,
                                          width: 8.h,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: kMainColor, width: 3)),
                                          child: Center(
                                            child: RichText(
                                              text: TextSpan(
                                                  text: i.languageCode
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 15.sp)),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        i.languageCode == "ar"
                                            ? Text(
                                                "arabic".tr(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Taga",
                                                    fontSize: 15.sp),
                                              )
                                            : Text("english".tr(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: "Taga",
                                                    fontSize: 15.sp)),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        i.languageCode == selectedLang
                                            ? Icon(
                                                Icons.where_to_vote_outlined,
                                                color: kMainColor,
                                                size: 4.h,
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 10.h,
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
