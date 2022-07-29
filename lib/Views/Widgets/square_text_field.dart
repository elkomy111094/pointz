import 'package:flutter/material.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

class SquareTextField extends StatelessWidget {
  String hintText;
  Widget? suffixWidget;
  int? maxLines;
  Widget? preFixWidget;
  String? Function(String?)? validator;
  String? Function(String?)? onSubmit;
  final TextEditingController? phoneController;

  void Function(String)? onChanged;

  TextEditingController? controller;

  bool obsecureance;

  Brightness? keyBoardAppearance;

  TextInputType? keyBoardType;

  Color? fillColor;

  int? maxLength;

  String? prefixText;

  double? textLetterSpaceing;

  TextStyle? textStyle;

  TextStyle? hintStyle;

  SquareTextField({
    required this.hintText,
    this.textLetterSpaceing = 0.0,
    this.hintStyle,
    this.textStyle,
    this.maxLength,
    this.onSubmit,
    this.prefixText,
    this.preFixWidget,
    this.fillColor = Colors.white60,
    this.maxLines = 1,
    this.phoneController,
    this.keyBoardType,
    this.controller,
    this.validator,
    this.keyBoardAppearance,
    this.obsecureance = false,
    this.suffixWidget,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Center(
          child: TextFormField(
            textAlign: TextAlign.start,
            cursorColor: kMainColor,
            onChanged: onChanged,
            validator: validator,
            keyboardType: keyBoardType,
            keyboardAppearance: keyBoardAppearance,
            controller: controller,
            maxLines: maxLines,
            maxLength: maxLength,
            obscuringCharacter: "•",
            obscureText: obsecureance,
            onFieldSubmitted: onSubmit,
            style: textStyle ??
                TextStyle(
                    color: Colors.black,
                    /*fontFamily: "Taga",*/
                    letterSpacing: textLetterSpaceing,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp),
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 10.sp, fontFamily: "Taga"),
              fillColor: fillColor,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
              prefixText: prefixText,
              prefixStyle: TextStyle(
                  color: kMainColor,
                  fontWeight: FontWeight.bold,
                  /*fontFamily: "Taga",*/
                  fontSize: 13.sp),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: kBackGroundColor,
              )),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kMainColor, width: 1)),
              hintText: hintText,
              counterText: "",
              suffixIcon: suffixWidget,
              prefixIcon: preFixWidget,
              hintStyle: hintStyle ??
                  TextStyle(color: Colors.black26, fontSize: 15.sp),
            ),
          ),
        ),
      ),
    );
  }
}
