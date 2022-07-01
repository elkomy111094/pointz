import 'package:flutter/material.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

class SquareTextField extends StatelessWidget {
  String hintText;
  Widget? suffixWidget;
  int? maxLines;
  Widget? preFixWidget;
  String? Function(String?)? validator;
  final TextEditingController? phoneController;

  void Function(String)? onChanged;
  void Function(String?)? onSave;
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

  SquareTextField(
      {required this.hintText,
      this.textLetterSpaceing = 0.0,
      this.hintStyle,
      this.textStyle,
      this.maxLength,
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
      required this.onChanged,
      required this.onSave});

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
            onSaved: onSave,
            validator: validator,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: keyBoardType,
            keyboardAppearance: keyBoardAppearance,
            controller: controller,
            maxLines: maxLines,
            maxLength: maxLength,
            obscuringCharacter: "•",
            obscureText: obsecureance,
            style: textStyle ??
                TextStyle(
                    color: Colors.black,
                    /*fontFamily: "Taga",*/
                    letterSpacing: textLetterSpaceing,
                    fontSize: 13.sp),
            decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 10.sp, fontFamily: "Taga"),
              fillColor: fillColor,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
              prefixText: prefixText,
              prefixStyle: TextStyle(
                  color: Colors.black,
                  /*fontFamily: "Taga",*/
                  fontSize: 13.sp),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: kBackGroundColor,
              )),
              focusedBorder: OutlineInputBorder(
                  /* borderSide: BorderSide(color: kYellow, width: 2)*/),
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
