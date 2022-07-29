import 'package:flutter/material.dart';
import 'package:pointz/constants/colors.dart';
import 'package:sizer/sizer.dart';

class CustomDropDownMenu extends StatelessWidget {
  Object? dropdownvalue;
  final List<String>? items;
  String hint;
  void Function(Object?)? onchanged;
  void Function()? ontabed;

  CustomDropDownMenu(
      {this.dropdownvalue,
      required this.items,
      this.hint = "",
      required this.onchanged,
      this.ontabed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontabed,
      child: Container(
        decoration: BoxDecoration(
          color: kBackGroundColor,
          borderRadius: BorderRadius.circular(.5.h),
          border: Border.all(color: kBackGroundColor),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
          child: DropdownButton(
            itemHeight: 9.h,
            menuMaxHeight: 70.h,
            // Initial Value
            value: dropdownvalue,
            hint: Text(hint,
                style: TextStyle(
                    color: Colors.grey, fontSize: 12.sp, fontFamily: "Taga")),
            iconSize: 3.h,
            alignment: Alignment.center,
            dropdownColor: kMainColor,
            isDense: true,
            borderRadius: BorderRadius.circular(1.h),
            isExpanded: true,
            style: TextStyle(
                fontFamily: "Taga", color: Colors.white, fontSize: 12.sp),
            underline: SizedBox(
              height: 0.h,
            ),
            // Down Arrow Icon
            icon: Padding(
              padding: EdgeInsets.only(right: 1.w, left: 1.w),
              child: Icon(Icons.keyboard_arrow_down, color: kMainColor),
            ),

            selectedItemBuilder: (context) => items != null
                ? items!
                    .map((e) => Container(
                          height: 6.h,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              e,
                              style: TextStyle(
                                  fontFamily: "Taga",
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp),
                            ),
                          ),
                        ))
                    .toList()
                : [],

            // Array list of items
            items: items != null
                ? items!.map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 7.h,
                              child: Card(
                                color: kMainColor,
                                elevation: 10,
                                child: Center(
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                        fontFamily: "Taga",
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList()
                : null,
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: onchanged,
          ),
        ),
      ),
    );
  }
}
