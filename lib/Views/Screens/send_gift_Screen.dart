import 'package:flutter/material.dart';
import 'package:pointz/Views/Screens/gift_payment_screen.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';
import '../Widgets/gift_item_Card.dart';
import '../Widgets/simple_Header.dart';
import '../Widgets/square_text_field.dart';

class SendGiftScreen extends StatefulWidget {
  const SendGiftScreen({Key? key}) : super(key: key);

  @override
  State<SendGiftScreen> createState() => _SendGiftScreenState();
}

class _SendGiftScreenState extends State<SendGiftScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 42.h),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              height: 12.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "قيمه الهديه",
                                                  style: TextStyle(
                                                    letterSpacing: 0,
                                                    color: Colors.black,
                                                    fontSize: 10.sp,
                                                    fontFamily: "Taga",
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                          child: SquareTextField(
                                            suffixWidget: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 1.7.h),
                                              child: Text(
                                                "SR",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15..sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            hintText: "",
                                            onChanged: (phone) {},
                                            onSave: (phone) {},
                                            keyBoardType: TextInputType.number,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "الرساله",
                                                  style: TextStyle(
                                                    letterSpacing: 0,
                                                    color: Colors.black,
                                                    fontSize: 10.sp,
                                                    fontFamily: "Taga",
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        SizedBox(
                                          child: SquareTextField(
                                            hintText: "",
                                            onChanged: (phone) {},
                                            maxLines: 2,
                                            onSave: (phone) {},
                                            keyBoardType: TextInputType.text,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 12.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "رقم هاتف المستلم",
                                                  style: TextStyle(
                                                    letterSpacing: 0,
                                                    color: Colors.black,
                                                    fontSize: 10.sp,
                                                    fontFamily: "Taga",
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                          child: SquareTextField(
                                            hintText: "",
                                            onChanged: (phone) {},
                                            onSave: (phone) {},
                                            keyBoardType: TextInputType.phone,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 12.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "اسم المستلم",
                                                  style: TextStyle(
                                                    letterSpacing: 0,
                                                    color: Colors.black,
                                                    fontSize: 10.sp,
                                                    fontFamily: "Taga",
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                          child: SquareTextField(
                                            hintText: "",
                                            onChanged: (phone) {},
                                            onSave: (phone) {},
                                            keyBoardType: TextInputType.name,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 12.h,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                  text: "إختر المتجر",
                                                  style: TextStyle(
                                                    letterSpacing: 0,
                                                    color: Colors.black,
                                                    fontSize: 10.sp,
                                                    fontFamily: "Taga",
                                                  )),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: .5.h,
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                          child: SquareTextField(
                                            hintText: "",
                                            suffixWidget: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                  Icons.arrow_drop_down_sharp),
                                            ),
                                            onChanged: (phone) {},
                                            onSave: (phone) {},
                                            keyBoardType:
                                                TextInputType.emailAddress,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CustomTextButton(
                                buttonColor: kMainColor,
                                textColor: Colors.white,
                                buttonHorizontalPaddingval: 20.w,
                                roundedBorder: 1.h,
                                textSize: 12.sp,
                                onPressed: () {
                                  pushToStack(context, GiftPaymentScreen());
                                },
                                text: "متابعه"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SimpleHeader(
                      headerTitle: 'إرسال بطاقه إهداء',
                    ),
                    Center(
                      child: GiftItemCard(),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 4.w),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {
                        pop(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(1.h),
                          child: Icon(
                            Icons.arrow_back,
                            color: kMainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
