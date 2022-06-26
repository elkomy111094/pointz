import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pointz/Views/Screens/registeration/otp_screen.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:pointz/Views/Widgets/square_text_field.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

import '../login/login_screen.dart';

class PhoneRegisterationScreen extends StatefulWidget {
  @override
  State<PhoneRegisterationScreen> createState() =>
      _PhoneRegisterationScreenState();
}

class _PhoneRegisterationScreenState extends State<PhoneRegisterationScreen> {
  Future<void> _register(BuildContext context) async {
    RegisterationCubit inst = RegisterationCubit.get(context);
    if (inst.validatePhoneNumber(context) == true) {
      inst.submitPhoneNumber(
          /*"+966"*/ "+201" + inst.phoneNumberController.text);
    } else {
      return;
    }

/*
    if (!inst.validatePhoneNumber(context)) {
      Navigator.pop(context);
      return;
    } else {
      Navigator.pop(context);
      inst.submitPhoneNumber(
          */ /*"+966"*/ /* "+201" + inst.phoneNumberController.text);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    RegisterationCubit inst = RegisterationCubit.get(context);
    return BlocConsumer<RegisterationCubit, RegisterationState>(
      listener: (context, state) {
        if (state is PhoneNumberSubmited) {
          pop(context);
          pushToStack(
            context,
            OTPScreen(
                phoneNumber: /*"+966"*/ "+201" +
                    inst.phoneNumberController.text),
          );
        }
        if (state is Loading) {
          showProgressIndicator(context);
        }
        if (state is PhoneNumberSubmitErrorOccurred) {
          pop(context);
          String errorMsg = (state).errorMsg;
          showToast(context, errorMsg);
        }
      },
      builder: (context, state) {
        RegisterationCubit inst = RegisterationCubit.get(context);

        return SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body: Form(
                key: inst.phoneRegisterationFormKey,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 45.h,
                                width: 90.w,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.h)),
                                  color: Colors.white,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Center(
                                          child: RichText(
                                            text: TextSpan(
                                                text: "تسجيل الدخول",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Taga",
                                                  fontSize: 15.sp,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.phone_enabled,
                                              color: kMainColor,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "رقم الهاتف",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                    fontFamily: "Taga",
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                          child: Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: SquareTextField(
                                              prefixText: "+966 ",
                                              maxLength: 9,
                                              hintText: "",
                                              validator: (phoneVal) {
                                                if (phoneVal!.isEmpty) {
                                                  return "من فضلك أدخل رقم الجوال الخاص بك";
                                                } else if (!RegExp(
                                                        r'(^(?:[+0]9)?[0-9]{9,9}$)')
                                                    .hasMatch(phoneVal)) {
                                                  return "من فضلك أدخل رقم جوال صحيح";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              controller:
                                                  inst.phoneNumberController,
                                              onChanged: (phone) {},
                                              onSave: (phone) {},
                                              keyBoardType: TextInputType.phone,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Transform.scale(
                                                  scale: 1.1,
                                                  child: Checkbox(
                                                      activeColor: kMainColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(.5
                                                                          .h)),
                                                      value: inst
                                                          .termsAndConditionsAgreement,
                                                      onChanged: (val) {
                                                        inst.changeTermsAndConditionsAgreemetState(
                                                            val!);
                                                      }),
                                                ),
                                                RichText(
                                                  text: const TextSpan(
                                                      text:
                                                          "الموافقه علي الشروط والاحكام",
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontFamily: "Taga",
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        CustomTextButton(
                                            buttonColor: kMainColor,
                                            textColor: Colors.white,
                                            textSize: 12.sp,
                                            onPressed: () {
                                              _register(context);
                                              /*    pushToStack(
                                                  context,
                                                  OTPScreen(
                                                    phoneNumber: "01128756021",
                                                  ),

                                              );*/
                                            },
                                            roundedBorder: 1.h,
                                            text: "تسجيل"),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Center(
                                child: InkWell(
                                  onTap: () {
                                    pushToStack(context, Login());
                                  },
                                  child: Container(
                                    height: 7.h,
                                    width: 75.w,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(1.h),
                                        border: Border.all(
                                            color: kMainColor, width: 1)),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                                text: "لديك حساب بالفعل ؟",
                                                style: TextStyle(
                                                  color: Colors.black38,
                                                  fontSize: 12.sp,
                                                  fontFamily: "Taga",
                                                )),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              pushToStack(context, Login());
                                            },
                                            child: RichText(
                                              text: TextSpan(
                                                  text: "تسجيل الدخول",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: "Taga",
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
