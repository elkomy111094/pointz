import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/Views/Screens/bottom_navbar_screen.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:pointz/Views/Widgets/square_text_field.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

class CompleteRegisterationData extends StatelessWidget {
  Widget build(BuildContext context) {
    RegisterationCubit inst = RegisterationCubit.get(context);
    return Directionality(
      textDirection: getDirection(context),
      child: BlocConsumer<RegisterationCubit, RegisterationState>(
        listener: (ctx, state) {
          if (state is CompleteRegisterationLoading) {
            showProgressIndicator(ctx);
          }
          if (state is SuccessRegisteration) {
            pop(ctx);
            pushToStack(ctx, NavBarScreen());
          }
          if (state is FailedRegisteration) {
            pop(ctx);
            showToast(ctx, state.errorMsg);
          }
        },
        builder: (context, state) {
          return SafeArea(
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Form(
                                      key: inst.completeRegisterationFormKey,
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Center(
                                                child: RichText(
                                                  text: TextSpan(
                                                      text:
                                                          "complete your registration to continue"
                                                              .tr(),
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: "Taga",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12.sp,
                                                          wordSpacing: 1.2)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Center(
                                                child: Container(
                                                    height: .5,
                                                    width: 20.w,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 2.h,
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
                                                                    text: "First Name"
                                                                        .tr(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10.sp,
                                                                      fontFamily:
                                                                          "Taga",
                                                                    )),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: .5.h,
                                                          ),
                                                          SizedBox(
                                                            height: 8.h,
                                                            child:
                                                                SquareTextField(
                                                              maxLength: 15,
                                                              fillColor:
                                                                  kBackGroundColor,
                                                              validator:
                                                                  (fName) {
                                                                if (fName!
                                                                    .isEmpty) {
                                                                  return "Empty Field"
                                                                      .tr();
                                                                }
                                                              },
                                                              controller: inst
                                                                  .firstNameController,
                                                              hintText: "",
                                                              onChanged:
                                                                  (phone) {},
                                                              keyBoardType:
                                                                  TextInputType
                                                                      .name,
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
                                                                    text: "Last Name"
                                                                        .tr(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10.sp,
                                                                      fontFamily:
                                                                          "Taga",
                                                                    )),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: .5.h,
                                                          ),
                                                          SizedBox(
                                                            height: 8.h,
                                                            child:
                                                                SquareTextField(
                                                              fillColor:
                                                                  kBackGroundColor,
                                                              hintText: "",
                                                              validator:
                                                                  (lName) {
                                                                if (lName!
                                                                    .isEmpty) {
                                                                  return "Empty Field"
                                                                      .tr();
                                                                }
                                                              },
                                                              maxLength: 15,
                                                              controller: inst
                                                                  .lastNameController,
                                                              onChanged:
                                                                  (phone) {},
                                                              keyBoardType:
                                                                  TextInputType
                                                                      .name,
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
                                                                    text: "Email"
                                                                        .tr(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          10.sp,
                                                                      fontFamily:
                                                                          "Taga",
                                                                    )),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: .5.h,
                                                          ),
                                                          SizedBox(
                                                            height: 8.h,
                                                            child:
                                                                SquareTextField(
                                                              fillColor:
                                                                  kBackGroundColor,
                                                              hintText: "",
                                                              controller: inst
                                                                  .emailController,
                                                              validator:
                                                                  (email) {
                                                                if (email!
                                                                    .isEmpty) {
                                                                  return "Empty Field"
                                                                      .tr();
                                                                }
                                                                if (!RegExp(
                                                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                                    .hasMatch(
                                                                        email)) {
                                                                  return "Enter An Correct Email"
                                                                      .tr();
                                                                }
                                                              },
                                                              onChanged:
                                                                  (phone) {},
                                                              keyBoardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
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
                                                                text:
                                                                    "Birth Date"
                                                                        .tr(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      10.sp,
                                                                  fontFamily:
                                                                      "Taga",
                                                                )),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: .5.h,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          DatePicker.showDatePicker(
                                                              context,
                                                              showTitleActions:
                                                                  true,
                                                              minTime: DateTime(
                                                                  1950, 1, 1),
                                                              maxTime: DateTime
                                                                  .now(),
                                                              onChanged:
                                                                  (date) {
                                                            inst.userBirthDate =
                                                                intl.DateFormat(
                                                                        "d-M-y")
                                                                    .format(
                                                                        date)
                                                                    .toString();
                                                            print(
                                                                'change $date');
                                                          }, onConfirm: (date) {
                                                            inst.setUserDateOfBirth(
                                                                date);
                                                            print(date);
                                                          },
                                                              currentTime:
                                                                  DateTime
                                                                      .now(),
                                                              locale: LocaleType
                                                                  .en);
                                                        },
                                                        child: Container(
                                                          height: 6.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                kBackGroundColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            border: Border.all(
                                                                color:
                                                                    kBackGroundColor),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        1.h,
                                                                    horizontal:
                                                                        3.w),
                                                            child: Center(
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        vertical:
                                                                            .5.h),
                                                                    child: Text(
                                                                        inst
                                                                            .userBirthDate,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
                                                                          fontFamily:
                                                                              "Taga",
                                                                          fontSize:
                                                                              14.sp,
                                                                        )),
                                                                  ),
                                                                  Icon(
                                                                    Icons
                                                                        .arrow_drop_down,
                                                                    size: 20.sp,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
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
                                            child: Center(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 1.h),
                                                    child: RichText(
                                                        text: TextSpan(
                                                            text: "Type".tr(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Taga",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12.sp,
                                                                color: Colors
                                                                    .black))),
                                                  ),
                                                  Expanded(
                                                    child: Center(
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 30.w,
                                                            child: Theme(
                                                              data: Theme.of(context).copyWith(
                                                                  unselectedWidgetColor:
                                                                      kMainColor,
                                                                  disabledColor:
                                                                      Colors
                                                                          .blue),
                                                              child:
                                                                  RadioListTile(
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      value:
                                                                          "male",
                                                                      groupValue:
                                                                          inst
                                                                              .userGender,
                                                                      activeColor:
                                                                          kMainColor,
                                                                      title:
                                                                          Text(
                                                                        "Male"
                                                                            .tr(),
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontFamily:
                                                                                "Taga",
                                                                            fontSize:
                                                                                12.sp),
                                                                      ),
                                                                      onChanged:
                                                                          (val) {
                                                                        inst.setUserGender(
                                                                            "male");
                                                                      }),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 30.w,
                                                            child: Theme(
                                                              data: Theme.of(context).copyWith(
                                                                  unselectedWidgetColor:
                                                                      kMainColor,
                                                                  disabledColor:
                                                                      Colors
                                                                          .blue),
                                                              child:
                                                                  RadioListTile(
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      value:
                                                                          "female",
                                                                      activeColor:
                                                                          kMainColor,
                                                                      title:
                                                                          Text(
                                                                        "FeMale"
                                                                            .tr(),
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontFamily:
                                                                                "Taga",
                                                                            fontSize:
                                                                                12.sp),
                                                                      ),
                                                                      groupValue:
                                                                          inst
                                                                              .userGender,
                                                                      onChanged:
                                                                          (val) {
                                                                        inst.setUserGender(
                                                                            "female");
                                                                      }),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                                                if (inst
                                                    .validateCompleteRegisterationForm(
                                                        context)) {
                                                  inst
                                                      .postNewUser(context)
                                                      .then((value) {
                                                    if (value == true) {
                                                      pushToStackAndReplacement(
                                                          context,
                                                          NavBarScreen());
                                                    } else {}
                                                  });
                                                } else {
                                                  print("Not Valid");
                                                }
                                                /* pushToStack(context,
                                                    LocationRegisterationScreen());*/
                                              },
                                              roundedBorder: 1.h,
                                              text: "Record".tr()),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                        ],
                                      ),
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
          );
        },
      ),
    );
  }
}
