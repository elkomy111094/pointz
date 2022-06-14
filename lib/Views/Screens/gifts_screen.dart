import 'package:flutter/material.dart';
import 'package:pointz/Views/Screens/send_gift_Screen.dart';
import 'package:pointz/Views/Widgets/customt_text_button.dart';
import 'package:pointz/Views/Widgets/gift_item_Card.dart';
import 'package:pointz/Views/Widgets/gifts_sent_card.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../helper/components.dart';
import '../Widgets/simple_Header.dart';

class GiftsScreen extends StatefulWidget {
  const GiftsScreen({Key? key}) : super(key: key);

  @override
  State<GiftsScreen> createState() => _GiftsScreenState();
}

class _GiftsScreenState extends State<GiftsScreen> {
  int giftsTypeIndex = 0;

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
                  padding: EdgeInsets.only(top: 12.h),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kBackGroundColor,
                                  borderRadius: BorderRadius.circular(1.h)),
                              child: Padding(
                                padding: EdgeInsets.all(.5.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: MaterialButton(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(1.h)),
                                        elevation: giftsTypeIndex == 0 ? 10 : 0,
                                        color: giftsTypeIndex == 0
                                            ? kMainColor
                                            : kBackGroundColor,
                                        onPressed: () {
                                          setState(() {
                                            giftsTypeIndex = 0;
                                          });
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                              text: "هداياي المستخدمه",
                                              style: TextStyle(
                                                  fontFamily: "Taga",
                                                  fontSize: 10.sp,
                                                  color: giftsTypeIndex == 0
                                                      ? Colors.white
                                                      : Colors.grey)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: MaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(1.h)),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        elevation: giftsTypeIndex == 1 ? 10 : 0,
                                        color: giftsTypeIndex == 1
                                            ? kMainColor
                                            : kBackGroundColor,
                                        onPressed: () {
                                          setState(() {
                                            giftsTypeIndex = 1;
                                          });
                                        },
                                        child: RichText(
                                          text: TextSpan(
                                              text: "هداياي المتاحه",
                                              style: TextStyle(
                                                  fontFamily: "Taga",
                                                  fontSize: 10.sp,
                                                  color: giftsTypeIndex == 1
                                                      ? Colors.white
                                                      : Colors.grey)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          giftsTypeIndex == 0
                              ? Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 30.h,
                                        child: ListView.separated(
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              return GiftItemCard();
                                            },
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                width: 3.w,
                                              );
                                            },
                                            itemCount: 5),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.w),
                                        child: Text(
                                          "الهدايا المرسله لأحبائك",
                                          style: TextStyle(
                                              fontFamily: "Taga",
                                              fontSize: 12.sp,
                                              color: kMainColor),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Center(
                                        child: Container(
                                          height: 35.h,
                                          width: 90.w,
                                          child: ListView.separated(
                                              itemBuilder: (context, index) {
                                                return GiftsSentCard();
                                              },
                                              separatorBuilder:
                                                  (context, index) {
                                                return SizedBox(
                                                  height: 2.h,
                                                );
                                              },
                                              itemCount: 5),
                                        ),
                                      ),
                                      CustomTextButton(
                                          buttonColor: kMainColor,
                                          buttonHorizontalPaddingval: 10.w,
                                          roundedBorder: 1.h,
                                          textColor: Colors.white,
                                          textSize: 12.sp,
                                          onPressed: () {
                                            pushToStack(
                                                context, SendGiftScreen());
                                          },
                                          text: "إرسال بطاقه إهداء")
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
                SimpleHeader(
                  headerTitle: 'الهدايا',
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
