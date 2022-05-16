import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pointz/Views/Screens/registeration/complete_registeration_data_screen.dart';
import 'package:pointz/constants/colors.dart';
import 'package:pointz/helper/components.dart';
import 'package:sizer/sizer.dart';

import 'customt_text_button.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  final String? phoneNumber;

  PinCodeVerificationScreen(this.phoneNumber);

  @override
  _PinCodeVerificationScreenState createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();

  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
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
                        fontFamily: "Hacen",
                      ),
                      length: 4,
                      obscureText: true,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,

                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        inactiveFillColor: Colors.grey.withOpacity(.1),
                        selectedFillColor: kMainColor.withOpacity(.5),
                        borderWidth: 0,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 7.h,
                        fieldWidth: 7.h,
                        activeFillColor: Colors.white,
                      ),
                      backgroundColor: Colors.white,
                      autoFocus: true,
                      cursorColor: Colors.black,
                      animationDuration: Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: errorController,
                      controller: textEditingController,

                      validator: (v) {
                        if (v!.length < 3) {
                          return "I'm from validator";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      onCompleted: (v) {
                        print("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          currentText = value;
                        });
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
                          text: "59:00",
                          style: TextStyle(
                              color: Colors.black, fontFamily: "Hacen"))),
                  SizedBox(
                    width: 3.w,
                  ),
                  TextButton(
                      onPressed: () => snackBar("OTP resend!!"),
                      child: Text(
                        "اعاده ارسال الكود ؟",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.sp,
                            fontFamily: "Hacen"),
                      )),
                ],
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
                    onPressed: () {
                      pushToStack(context, CompleteRegisterationData());
                    },
                    text: "تحقق"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
