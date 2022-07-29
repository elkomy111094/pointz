import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/Views/Screens/registeration/otp_screen.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:pointz/Views/Widgets/square_text_field.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

class PhoneRegisterationScreen extends StatefulWidget {
  @override
  State<PhoneRegisterationScreen> createState() =>
      _PhoneRegisterationScreenState();
}

class _PhoneRegisterationScreenState extends State<PhoneRegisterationScreen> {
  Future<void> _register(BuildContext context) async {
    RegisterationCubit inst = RegisterationCubit.get(context);
    if (inst.validatePhoneNumber(context) == true) {
      print("wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww");
      print("+9665" /*"+201"*/ + inst.phoneNumberController.text);
      inst.submitPhoneNumber(
          "+9665" /*"+201"*/ + inst.phoneNumberController.text);
    } else {
      return;
    }
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
                phoneNumber:
                    "+9665" /*"+201"*/ + inst.phoneNumberController.text),
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
            textDirection: getDirection(context),
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
                                  elevation: 20,
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
                                                text: "login".tr(),
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
                                              getDirection(context) ==
                                                      TextDirection.rtl
                                                  ? Icons.phone_enabled
                                                  : Icons.phone,
                                              color: kMainColor,
                                              size: 15.sp,
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "phoneNumber".tr(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
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
                                              fillColor: kBackGroundColor,
                                              textLetterSpaceing: 2,
                                              prefixText: "+9665 ",
                                              maxLength: 8,
                                              hintText: "",
                                              validator: (phoneVal) {
                                                if (phoneVal!.isEmpty) {
                                                  return "pleaseEnterYourPhoneNumber"
                                                      .tr();
                                                } else if (!RegExp(
                                                        r'(^(?:[+0]9)?[0-9]{8,8}$)')
                                                    .hasMatch(phoneVal)) {
                                                  return "pleaseEnterCorrectPhoneNumber"
                                                      .tr();
                                                } else {
                                                  return null;
                                                }
                                              },
                                              controller:
                                                  inst.phoneNumberController,
                                              onChanged: (phone) {},
                                              keyBoardType: TextInputType.phone,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                          child: Center(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Transform.scale(
                                                  scale: .75.sp,
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
                                                  text: TextSpan(
                                                      text:
                                                          "agreeTermsAndConditions"
                                                              .tr(),
                                                      style: TextStyle(
                                                        color: Colors.black38,
                                                        fontSize: 12.sp,
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
                                          height: 3.h,
                                        ),
                                        CustomTextButton(
                                            buttonColor: kMainColor,
                                            textColor: Colors.white,
                                            textSize: 15.sp,
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
                                            text: "loginButton".tr()),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
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
