import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/views_models/registeration/registeration_cubit.dart';
import 'package:sizer/sizer.dart';

import 'customt_text_button.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  PinCodeVerificationScreen({required this.phoneNumber});

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  // ignore: close_sinks

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  late String otpCode;
  int secondsRemaining = 60;
  bool enableResend = false;
  late Timer timer;

  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _resendOTP(BuildContext context) async {
    RegisterationCubit inst = RegisterationCubit.get(context);
    await inst.resendOTP(widget.phoneNumber);
  }

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  Future _login(BuildContext context) async {
    await BlocProvider.of<RegisterationCubit>(context).submitOTP(otpCode);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Form(
          key: formKey,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: PinCodeTextField(
                enablePinAutofill: true,
                appContext: context,
                pastedTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Taga",
                ),
                length: 6,
                obscureText: true,
                obscuringCharacter: '*',
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,

                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  activeColor: kMainColor,
                  inactiveColor: kMainColor,
                  selectedColor: kMainColor.withOpacity(.5),
                  inactiveFillColor: Colors.grey.withOpacity(.1),
                  selectedFillColor: kMainColor.withOpacity(.5),
                  borderWidth: 0,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 7.h,
                  fieldWidth: 5.h,
                  activeFillColor: kMainColor,
                ),

                autoFocus: true,
                cursorColor: Colors.black,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,

                controller: textEditingController,

                validator: (v) {
                  if (v!.length < 6) {
                    return "يجب إدخال جميع الحقول";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                onCompleted: (submitedCode) {
                  otpCode = submitedCode;
                  print("Completed");
                },
                // onTap: () {
                //   print("Pressed");
                // },
                onChanged: (value) {
                  print(value);
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Text(
            hasError ? " يرجى ملء جميع الخلايا بشكل صحيح*" : "",
            style: TextStyle(
                color: Colors.red,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
                    text: secondsRemaining.toString() + ":00",
                    style: TextStyle(color: Colors.black, fontFamily: "Taga"))),
            SizedBox(
              width: 3.w,
            ),
            enableResend
                ? TextButton(
                    onPressed: () async {
                      await _resendOTP(context);
                      setState(() {
                        secondsRemaining = 60;
                        enableResend = false;
                      });
                      snackBar("OTP resend!!");
                    },
                    child: Text(
                      "اعاده ارسال الكود ؟",
                      style: TextStyle(
                          color: kMainColor,
                          fontSize: 12.sp,
                          fontFamily: "Taga"),
                    ),
                  )
                : TextButton(
                    onPressed: null,
                    child: Text(
                      "اعاده ارسال الكود ؟",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontFamily: "Taga"),
                    ),
                  ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomTextButton(
              buttonColor: kMainColor,
              roundedBorder: 10,
              textColor: Colors.white,
              vPadding: 0,
              hPadding: 0,
              buttonHorizontalPaddingval: 20.w,
              textSize: 12.sp,
              onPressed: () async {
                await _login(context);
              },
              text: "تحقق"),
        ),
      ],
    );
  }
}
