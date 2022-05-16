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

  SquareTextField(
      {required this.hintText,
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Center(
          child: TextFormField(
            onChanged: onChanged,
            onSaved: onSave,
            validator: validator,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: keyBoardType,
            keyboardAppearance: keyBoardAppearance,
            controller: controller,
            maxLines: maxLines,
            obscuringCharacter: "•",
            obscureText: obsecureance,
            style: TextStyle(
                color: Colors.black, fontFamily: "Hacen", fontSize: 12.sp),
            decoration: InputDecoration(
              fillColor: fillColor,
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.w),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: kBackGroundColor,
              )),
              focusedBorder: OutlineInputBorder(
                  /* borderSide: BorderSide(color: kYellow, width: 2)*/),
              hintText: hintText,
              suffixIcon: suffixWidget,
              prefixIcon: preFixWidget,
              hintStyle: TextStyle(
                  color: Colors.black26, fontFamily: "Hacen", fontSize: 10.sp),
            ),
          ),
        ),
      ),
    );
  }
}
