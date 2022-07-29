import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pointz/Views/Screens/bottom_navbar_screen.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../helper/components.dart';
import '../../../views_models/registeration/registeration_cubit.dart';
import '../../Widgets/otp_verfication.dart';
import 'location_registeration_screen.dart';

class OTPScreen extends StatelessWidget {
  final String phoneNumber;

  OTPScreen({required this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<RegisterationCubit, RegisterationState>(
        listener: (ctx, state) {
          RegisterationCubit inst = RegisterationCubit.get(context);

          if (state is PhoneOTPResent) {
            pop(ctx);
            pop(ctx);
            showToast(context, "The code has been sent back to you.".tr());
            /*pushToStackAndReplacement(
                context
                ;  0
                +-utss
                +,
                OTPScreen(
                    phoneNumber: */ /*"+966"*/ /* "+201" +
                        inst.phoneNumberController.text));*/
          }
          if (state is PhoneOTPVerified) {
            pop(ctx);
            pop(ctx);
          }

          if (state is UserRegisteredBefore) {
            pop(ctx);
            pop(ctx);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return NavBarScreen();
            }), (route) => false);
          }
          if (state is UserNotRegisteredBefore) {
            pop(ctx);
            pop(ctx);
            pushToStack(ctx, LocationRegisterationScreen());
          }

          if (state is Loading) {
            showProgressIndicator(ctx);
          }
          if (state is OTPErrorOccurred) {
            pop(ctx);
            pop(ctx);
            String errorMsg = (state).errorMsg;
            showToast(ctx, errorMsg);
          }

          if (state is PhoneNumberSubmitErrorOccurred) {
            pop(ctx);
            pop(ctx);
            showToast(ctx, state.errorMsg);
          }
        },
        builder: (context, state) {
          RegisterationCubit inst = RegisterationCubit.get(context);
          return Directionality(
            textDirection: getDirection(context),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        height: 25.h,
                        width: 100.w,
                        child: Center(
                          child: SvgPicture.asset("assets/icons/pincode.svg"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "OTP".tr() + " \n\n ",
                                      style: TextStyle(
                                          color: kMainColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Taga",
                                          fontSize: 13.sp)),
                                  TextSpan(
                                      text:
                                          "The activation code has been sent to"
                                                  .tr() +
                                              " \n\n ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Taga",
                                          fontSize: 12.sp)),
                                ])),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: phoneNumber,
                                        style: TextStyle(
                                            color: kMainColor,
                                            fontFamily: "Taga",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.sp)),
                                  ])),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        height: 40.h,
                        width: 90.w,
                        child:
                            PinCodeVerificationScreen(phoneNumber: phoneNumber),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
