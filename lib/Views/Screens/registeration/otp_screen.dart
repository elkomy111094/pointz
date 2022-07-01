import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            /*   showGeneralDialog(
                context: context,
                pageBuilder: (x, y, z) {
                  return CustomAlertDialog(
                    cardImgUrl: "assets/icons/info.svg",
                    content: Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 5.w, right: 5.w, bottom: 2.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "أنت بالفعل تمتلك حساب علي التطبيق",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Taga",
                                fontSize: 14.sp),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          CustomTextButton(
                              buttonColor: kMainColor,
                              textColor: Colors.white,
                              textSize: 12.sp,
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(builder: (context) {
                                  return NavBarScreen();
                                }), (route) => false);
                              },
                              text: "الذهاب الي الشاشه الرئيسيه")
                        ],
                      ),
                    ),
                    onTapXButton: () {
                      pop(context);
                    },
                  );
                });*/
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
