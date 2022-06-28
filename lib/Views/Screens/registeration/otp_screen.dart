import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            showToast(context, "تم إعاده إرسال الكود اليك");
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
            Navigator.pop(ctx);
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
        },
        builder: (context, state) {
          RegisterationCubit inst = RegisterationCubit.get(context);

          print(
              "oooooooooooooooooooooooooooTTTTTTTTTTTTTTTTTTTTTTTTPPPPPPPPPPPPPPPPP");
          print(inst.verificationId);

          return Scaffold(
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
                        children: [
                          Center(
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "كود التحقق" + " \n\n ",
                                      style: TextStyle(
                                          color: kMainColor,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Taga",
                                          fontSize: 13.sp)),
                                  TextSpan(
                                      text: "تم أرسال كود التفعيل الي رقم" +
                                          " \n\n ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Taga",
                                          fontSize: 12.sp)),
                                  TextSpan(
                                      text: phoneNumber,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Taga",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.sp)),
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
          );
        },
      ),
    );
  }
}
